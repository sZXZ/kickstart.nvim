-----@brief
-----
----- https://github.com/japhib/pico8-ls
-----
----- Full language support for the PICO-8 dialect of Lua.
--
--local util = require 'lspconfig.util'
--
-----@type vim.lsp.Config
--return {
--  cmd = { 'pico8-ls', '--stdio' },
--  filetypes = { 'p8', 'lua' },
--  root_dir = function(bufnr, on_dir)
--    local fname = vim.api.nvim_buf_get_name(bufnr)
--    on_dir(util.root_pattern '*.p8'(fname))
--  end,
--  settings = {},
--}
--

return {
  cmd = { 'pico8-ls', '--stdio' },
  filetypes = { 'p8', 'lua' },
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)

    -- Check if the file is in your PICO-8 directory
    if fname:match 'carts/' then
      -- Look for a marker like .git or a .p8 file to find the project root
      local root = vim.fs.root(fname, { '.git', 'config.txt' })

      -- If a root is found, on_dir(root) tells Neovim to start the LSP
      if root then
        on_dir(root)
      end
    end
  end,
}
