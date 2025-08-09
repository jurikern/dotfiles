return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    local home = os.getenv("HOME")
    local jdtls_path = home .. "/dev/tools/jdtls"
    local config_path = jdtls_path .. "/config_mac"
    local plugins_path = jdtls_path .. "/plugins"
    local launcher_jar = vim.fn.glob(plugins_path .. "/org.eclipse.equinox.launcher_*.jar")

    local jdtls = require("jdtls")

    local cmd = {
      "java",
      "-Declipse.application=org.eclipse.jdt.ls.core.id1",
      "-Dosgi.bundles.defaultStartLevel=4",
      "-Declipse.product=org.eclipse.jdt.ls.core.product",
      "-Dlog.protocol=true",
      "-Dlog.level=ALL",
      "-Xms1g",
      "--add-modules=ALL-SYSTEM",
      "--add-opens", "java.base/java.util=ALL-UNNAMED",
      "--add-opens", "java.base/java.lang=ALL-UNNAMED",
      "-jar", launcher_jar,
      "-configuration", config_path,
      "-data", vim.fn.getcwd(),
    }

    local config = {
      cmd = cmd,
      root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
    }

    jdtls.start_or_attach(config)
  end,
}
