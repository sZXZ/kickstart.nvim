return {
  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)

    -- If we are in the PICO-8 folder, DO NOT call on_dir()
    -- This effectively "disables" lua_ls for this specific directory
    if fname:match '/pico8' then
      return
    end

    -- Otherwise, use standard Lua discovery
    local root = vim.fs.root(fname, { '.luarc.json', '.git' })
    if root then
      on_dir(root)
    end
  end,
}
