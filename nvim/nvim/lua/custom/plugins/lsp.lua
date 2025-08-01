return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'saghen/blink.cmp',
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabiblities = require('blink.cmp').get_lsp_capabilities()
      require("lspconfig").lua_ls.setup { capabiblities = capabiblities }
      require("lspconfig").gopls.setup { capabiblities = capabiblities }
      require("lspconfig").rust_analyzer.setup { capabiblities = capabiblities }
      require("lspconfig").pyright.setup { capabiblities = capabiblities }
      require("lspconfig").ruff.setup { capabiblities = capabiblities }

      vim.keymap.set("n", '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame' })
      vim.keymap.set("n", 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end,
            })
          end
        end,
      })
    end,
  }
}
