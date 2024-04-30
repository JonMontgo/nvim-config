-- Borked atm

local null_ls = require("null-ls")
local completion = require("lsp/completion")

null_ls.setup({
	debug = true,
	capabilities = completion.capabilities,
	sources = {
		-- Formatting
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
		null_ls.builtins.formatting.eslint,
		null_ls.builtins.formatting.remark,
		null_ls.builtins.formatting.terraform_fmt,

		-- Completions
		null_ls.builtins.completion.spell,

		-- Diagnostics
		null_ls.builtins.diagnostics.markdownlint,
		-- null_ls.builtins.diagnostics.terraform_validate,
	},
})
