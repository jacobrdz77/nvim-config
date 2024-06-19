require('telescope').setup {
  defaults = {
    -- Default configuration for Telescope goes here:
    -- config_key = value,
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '--ignore-file', '.gitignore',
      '--glob', '!.git/',
      '--glob', '!.cache/',
      '--glob', '!.idea/',
      '--glob', '!node_modules/',
      '--glob', '!target/',
      '--glob', '!build/',
      '--glob', '!dist/',
      '--glob', '!__pycache__/',
      '--glob', '!.DS_Store'
    },
    file_ignore_patterns = { "node_modules", ".git", ".cache", "*.dotnet", "__pycache__", "%.zip" },
  },
  pickers = {

    find_files = {
	    find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix', '--hidden', '--exclude', '.git', '--exclude', 'node_modules', '--exclude', '.cache', '--exclude', '__pycache__' },
	 -- cwd = vim.fn.getcwd(),  
    }
  },
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><space>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>fs', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
