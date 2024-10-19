local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities())

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'rust_analyzer', 'gopls', 'jdtls', 'ruby_lsp', 'standardrb', 'solargraph', 'clangd'},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({
        capabilities = capabilities
      })
    end,
    ["solargraph"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.solargraph.setup{
            cmd = {vim.fn.expand("$HOME/.rbenv/shims/solargraph"), "stdio"},
            capabilities = cmp_lsp.default_capabilities(capabilities)
        }
    end,
  -- ["ruby_lsp"] = function()
  --     local lspconfig = require("lspconfig")
  --     lspconfig.ruby_lsp.setup{
  --         cmd = {vim.fn.expand("$HOME/.rbenv/shims/ruby-lsp"), "stdio"},
  --         capabilities = cmp_lsp.default_capabilities(capabilities)
  --     }
  -- end,
  -- ["standardrb"] = function()
  --     local lspconfig = require("lspconfig")
  --     lspconfig.standardrola.setup{
  --         cmd = {vim.fn.expand("$HOME/.rbenv/shims/standardrb"), "stdio"},
  --         capabilities = cmp_lsp.default_capabilities(capabilities)
  --     }
  -- end,
    ["jdtls"] = function()
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
    end,
    ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                }
                            }
                        }
                    }
  end,
  ["gopls"] = function()
        local lspconfig = require("lspconfig")
        lspconfig.gopls.setup{
            settings = {
                gopls =  {
                    buildFlags =  {"-tags=integration unit"}
                }
            }
        }
  end,
}})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
    }),
})

vim.diagnostic.config({
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})










































































































































































































