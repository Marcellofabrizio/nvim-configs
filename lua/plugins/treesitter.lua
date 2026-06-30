return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  branch = 'main',
  build = ':TSUpdate',
  opts = function()
    local parser_installed = {
      'c',
      'cpp',
      'diff',
      'java',
      'javadoc',
      'kotlin',
      'groovy',
      'dockerfile',
      'go',
      'gomod',
      'gosum',
      'html',
      'css',
      'javascript',
      'svelte',
      'lua',
      'markdown',
      'markdown_inline',
      'comment',
      'python',
      'htmldjango',
      'rust',
      'sql',
      'typescript',
      'tsx',
      'yaml',
      'toml',
      'elixir',
      'bash',
      'http',
      'tmux',
      'xml',
      'fish',
      'awk',
      'jq',
      'json',
      'json5',
      'printf',
      'vim',
      'vimdoc',
      'query',
      'cmake',
      'csv',
      'dot',
      'func',
      'gotmpl',
      'graphql',
      'ini',
      'jsdoc',
      'luadoc',
      'make',
      'nginx',
      'regex',
      'requirements',
      'ssh_config',
      'strace',
      'styled',
      'templ',
      'todotxt',
      'vue',
      'xresources',
      'asm',
      'mermaid',
    }
    require('nvim-treesitter').install(parser_installed)
    local ft_list = {}
    local ft_set = {}
    for _, parser in ipairs(parser_installed) do
      local fts = vim.treesitter.language.get_filetypes(parser)
      for _, ft in ipairs(fts) do
        ft_set[ft] = true
      end
    end
    for filetype in pairs(ft_set) do
      table.insert(ft_list, filetype)
    end
    vim.api.nvim_create_autocmd('FileType', {
      pattern = ft_list,
      callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}