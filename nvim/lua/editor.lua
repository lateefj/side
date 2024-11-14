local add, later, now = MiniDeps.add, MiniDeps.later, MiniDeps.now

now(function()
  -- Dressing
  add({
    source = 'stevearc/dressing.nvim'
  })

  -- Git signs
  add({
    source = 'lewis6991/gitsigns.nvim'
  })

  -- Editior configuration
  require('mini.animate').setup()
  require('mini.basics').setup()
  require('mini.bracketed').setup()
  require('mini.bufremove').setup()
  require('mini.colors').setup()
  require('mini.comment').setup()
  require('mini.completion').setup({
    lsp_completion = {
      auto_setup = true
    }
  })
  require('mini.diff').setup()
  require('mini.extra').setup()
  require('mini.files').setup()
  require('mini.git').setup()
  require('mini.hipatterns').setup()
  require('mini.icons').setup()
  require('mini.operators').setup()
  require('mini.map').setup()
  require('mini.notify').setup()
  require('mini.pairs').setup()
  require('mini.pick').setup()
  require('mini.sessions').setup({
    directory = vim.fn.stdpath("data")
  })
  require('mini.starter').setup()
  require('mini.statusline').setup()
  require('mini.surround').setup()
  require('mini.tabline').setup()
  require('mini.trailspace').setup()
  require('mini.visits').setup()

end)

later(function() 
  -- Dressing config
  require('dressing').setup()
  require('gitsigns').setup()
end)
