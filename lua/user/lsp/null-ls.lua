------------------------------ OG Trail
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
local completion = null_ls.builtins.completion

null_ls.setup({
	debug = false,
	sources = {
		-- Eng
		-- formatting.codespell, -- codespell fix common misspellings in text files.
		-- diagnostics.cspell, -- cspell is a spell checker for code.
		-- formatting.trim_newlines, --  A simple wrapper around awk to remove trailing newlines.
		-- formatting.trim_whitespace, -- A simple wrapper around awk to remove trailing whitespace.
		-- diagnostics.misspell, -- Checks commonly misspelled English words in source files.
		-- diagnostics.proselint, -- proselint places the world’s greatest writers and editors by your side, where they whisper suggestions on how to improve your prose.
		-- diagnostics.shellcheck, -- A shell script static analysis tool.
		-- diagnostics.write_good, -- English prose linter.
		-- code_actions.proselint, -- An English prose linter. Can fix some issues via code actions.
		-- code_actions.shellcheck, -- Provides actions to disable ShellCheck errors/warnings, either for the current line or for the entire file.
		-- completion.spell, -- Spell suggestions completion source
		-- diagnostics.codespell, -- codespell finds common misspellings in text files.

		-- C C++ Java And Co
		-- formatting.clang_format, -- Tool to format C/C++/… code according to a set of rules and heuristics.
		-- formatting.uncrustify, -- A source code beautifier for C, C++, C#, ObjectiveC, D, java, pawn and VALA.
		-- formatting.google_java_format, -- Reformats Java source code according to Google Java Style.
		-- diagnostics.cppcheck, -- A tool for fast static analysis of C/C++ code.

		-- Lua
		formatting.stylua, -- A fast and opinionated Lua formatter written in Rust. Highly recommended!
		-- formatting.lua_format, --A flexible but slow lua formatter. Not recommended for formatting on save.
		-- diagnostics.luacheck, -- A tool for linting and static analysis of lua code.
		-- diagnostics.selene, -- Command line tool designed to help write correct and idiomatic lua code.

		-- Haskell
		-- formatting.brittany, -- haskell source code formatter
		-- formatting.fouremolu, -- Fourmolu is a formatter for Haskell source code.

		-- Git
		-- diagnostics.gitlint, -- Linter for git commit messages
		-- code_actions.gitsigns, -- Injects code actions for Git operations at the current cursor position (stage / preview / reset hunks, blame, etc.).
		-- code_actions.gitrebase, -- Inject actions to change gitrebase command. (eg. using squash instead of pick).

		-- SQL
		-- formatting.pg_format, -- PostgreSQL SQL syntax beautifier
		-- formatting.sqlformat, -- The sqlformat command-line tool can reformat SQL files according to specified options.

		-- Web
		formatting.prettier,
		-- formatting.prettier_d_slim, -- A faster version of prettier that doesn't seem to work well on non-JavaScript filetypes.
		-- formatting.prettierd, -- Another "prettier, but faster" formatter, with better support for non-JavaScript filetypes.
		-- formatting.prettier_standard, --Formats with prettier (actually prettierx) and lints with eslint preconfigured with standard rules
		-- formatting.deno_fmt, -- Use Deno to format TypeScript and JavaScript code.
		-- formatting.eslint, -- Fixes problems in your JavaScript code.
		-- diagnostics.eslint, -- A linter for the javascript ecosystem.
		-- code_actions.eslint, -- Injects actions to fix ESLint issues (or ignore broken rules).
		-- formatting.eslint_d, -- An absurdly fast formatter (and linter).
		-- diagnostics.eslint_d, --An absurdly fast linter (and formatter).
		-- code_actions.eslint_d, -- Injects actions to fix ESLint issues (or ignore broken rules). Like ESLint, but faster.
		-- formatting.rustywind, -- CLI for organizing Tailwind CSS classes.
		-- formatting.stylelint, -- A mighty, modern CSS/SCSS/SASS linter that helps you avoid errors and enforce conventions in your styles.
		-- diagnostics.standardjs, -- JavaScript style guide, linter, and formatter.
		-- diagnostics.stylelint, -- A mighty, modern SASS, CSS, SCSS linter that helps you avoid errors and enforce conventions in your styles.

		-- Json
		-- formatting.fixjson, -- fixjson is a JSON file fixer/formatter for humans using (relaxed) JSON5.
		-- formatting.json_tool, -- Provides a simple command line interface to validate and pretty-print JSON objects.
		-- diagnostics.jsonlint, -- A pure JavaScript version of the service provided at jsonlint.com.

		-- Python
		-- formatting.black.with({ extra_args = { "--fast" } }), -- Uncompromising Python code formatter.
		-- formatting.reorder_python_imports, -- Tool for automatically reordering python imports. Like isort, but uses static analysis more.
		-- formatting.djhtml, -- A pure-Python Django/Jinja template indenter without dependencies.
		-- formatting.isort, -- Python utility / library to sort imports alphabetically and automatically separate them into sections and by type.
		-- formatting.reorder_python_imports, -- python utility tool for automatically reordering python imports. Like isort, but uses static analysis more.
		-- formatting.yapf, --Formatter for python files
		-- diagnostics.flake8, -- flake8 is a python tool that glues together pycodestyle, pyflakes, mccabe, and third-party plugins to check the style and quality of some python code.
		-- diagnostics.pylama, -- Code audit tool for Python.
		-- diagnostics.vulture, -- Vulture finds unused code in Python programs.
		-- diagnostics.pylint, -- Pylint is a Python static code analysis tool which looks for programming errors, helps enforcing a coding standard, sniffs for code smells and offers simple refactoring suggestions.
		-- diagnostics.mypy, -- Mypy is an optional static type checker for Python that aims to combine the benefits of dynamic (or "duck") typing and static typing.

		-- PHP
		-- formatting.phpcbf, -- Tokenizes PHP files and detects violations of a defined set of coding standards.
		-- formatting.phpcsfixer, -- Formatter for php files.
		-- diagnostics.phpstan, --PHP static analysis tool.
		-- diagnostics.psalm, -- A static analysis tool for finding errors in PHP applications
		-- diagnostics.php, -- Uses the php command-line tool's built in -l flag to check for syntax errors.
		-- diagnostics.phpcs, --PHP_CodeSniffer is a script that tokenizes PHP, JavaScript and CSS files to detect violations of a defined coding standard.

		-- Go
		-- formatting.gofmt, -- Formats go programs.
		-- formatting.gofumpt, -- Enforce a stricter format than gofmt, while being backwards compatible. That is, gofumpt is happy with a subset of the formats that gofmt is happy with.
		-- formatting.goimports, -- Updates your Go import lines, adding missing ones and removing unreferenced ones.
		-- formatting.golines, -- Applies a base formatter (eg. goimports or gofmt), then shorten long lines of code.

		-- Misc
		formatting.shfmt, -- A shell parser, formatter, and interpreter with bash support.
		-- diagnostics.qmllint, -- qmllint is a tool shipped with Qt that verifies the syntatic validity of QML files. It also warns about some QML anti-patterns.
		-- formatting.cmake_format, -- Format your listfiles nicely so that they don't look like crap.
		-- formatting.rustfmt, -- A tool for formatting rust code according to style guidelines.
		-- formatting.dart_format, --Replace the whitespace in your program with formatting that follows Dart guidelines.
		-- formatting.swiftformat, -- SwiftFormat is a code library and command-line tool for reformatting swift code on macOS or Linux.
	},

	-- Format on Save
	-- on_attach = function(client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd([[
	--        augroup LspFormatting
	--             autocmd! * <buffer>
	--             autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
	--        augroup END
	--      ]])
	-- 	end
	-- end,
})

-- Format On save, fail safe option while clangd_format is fixed
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.* Format
augroup END
]],
	true
)
