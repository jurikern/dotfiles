local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/site/java/workspace-root/" .. project_name

os.execute("mkdir -p " .. workspace_dir)
local os
if vim.fn.has("mac") == 1 then
  os = "mac"
elseif vim.fn.has("unix") == 1 then
  os = "linux"
elseif vim.fn.has("win32") == 1 then
  os = "win"
end


local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g",
        "-Xmx2G",
        "-Xbootclasspath/a:" .. install_path .. "lombok.jar",
        "-javaagent:" .. install_path .. "/lombok.jar",
        "--add-modules=ALL-SYSTEM",
        "--add-opens",
        "java.base/java.util=ALL-UNNAMED",
        "--add-opens",
        "java.base/java.lang=ALL-UNNAMED",
        "-jar",
        vim.fn.glob(install_path .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration",
        install_path .. "/config_" .. os,
        "-data",
        workspace_dir,
    },

    settings = {
        java = {
            signatureHelp = {enabled = true},
            import = {enabled = true},
            rename = {enabled = true}
        },
        completion = {
            filteredTypes = {
                  "com.sun.*",
                  "io.micrometer.shaded.*",
                  "java.awt.*",
                  "jdk.*",
                  "sun.*",
            },
        },
        sources = {
            organizeImports = {
                starThreshold = 9999;
                staticStarThreshold = 9999;
            },
        }
    },

    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
