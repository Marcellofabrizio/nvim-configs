return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'

      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft['json'] = { 'jsonlint' }
      lint.linters_by_ft['markdown'] = { 'markdownlint' }

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          -- Only run the linter in buffers that you can modify in order to
          -- avoid superfluous noise, notably within the handy LSP pop-ups that
          -- describe the hovered symbol using Markdown.
          if not vim.opt_local.modifiable:get() then
            return
          end

          -- Only run linters whose executable is actually installed. This keeps
          -- a missing tool (e.g. jsonlint/markdownlint not on PATH) from raising
          -- `ENOENT: no such file or directory` every time you open a file.
          local names = lint.linters_by_ft[vim.bo.filetype] or {}
          local available = {}
          for _, name in ipairs(names) do
            local linter = lint.linters[name]
            local cmd = type(linter) == 'table' and linter.cmd or nil
            if type(cmd) == 'function' then
              cmd = cmd()
            end
            if cmd and vim.fn.executable(cmd) == 1 then
              table.insert(available, name)
            end
          end

          if #available > 0 then
            lint.try_lint(available)
          end
        end,
      })
    end,
  },
}