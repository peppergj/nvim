local supertab = function(if_active, if_not_active)
	return function(cmp)
		if cmp.snippet_active() then
			if cmp.is_visible() then
				return cmp[if_active]()
			else
				return cmp[if_not_active]()
			end
		end
	end
end

return {
	{
		"saghen/blink.cmp",
		lazy = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			"disrupted/blink-cmp-conventional-commits",

			-- nvim-cmp sources
			"hrsh7th/cmp-calc",

			-- appearance
			"nvim-tree/nvim-web-devicons",
			"onsails/lspkind.nvim",
		},
		version = "1.*",

		opts = {
			sources = {
				default = {
					"lazydev",
					"lsp",
					"path",
					"snippets",
					"buffer",
				},

				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},

					conventional_commits = {
						name = 'Conventional Commits',
						module = 'blink-cmp-conventional-commits',
						enabled = function()
							return vim.bo.filetype == 'gitcommit'
						end,
						opts = {},
					},

					calc = { -- cmp-calc
						name = "calc",
						module = "blink.compat.source",
					},
				},
			},

			keymap = {
				preset = "none",
				["<Tab>"] = { supertab("select_next", "snippet_forward"), "select_next", "fallback" },
				["<S-Tab>"] = { supertab("select_prev", "snippet_backward"), "select_prev", "fallback" },
				["<CR>"] = { "accept", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-Space>"] = { 'show', 'show_documentation', 'hide_documentation' },
				['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
				['<C-e>'] = { 'hide', 'fallback' },
			},

			completion = {
				list = {
					selection = {
						preselect = false,
						auto_insert = false,
					}
				},

				documentation = {
					auto_show = true,
					auto_show_delay_ms = 0,
				},

				menu = {
					draw = {
						columns = {
							{ "kind_icon" },
							{ "label", gap = 1 },
						},
						treesitter = { "lsp" },
						components = {
							label = {
								text = function(ctx)
									return require("colorful-menu").blink_components_text(ctx)
								end,
								highlight = function(ctx)
									return require("colorful-menu").blink_components_highlight(ctx)
								end,
							},
							kind_icon = {
								text = function(ctx)
									local lspkind = require("lspkind")
									local icon = ctx.kind_icon
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											icon = dev_icon
										end
									else
										icon = require("lspkind").symbolic(ctx.kind, {
											mode = "symbol",
										})
									end

									return icon .. ctx.icon_gap
								end,

								-- Optionally, use the highlight groups from nvim-web-devicons
								-- You can also add the same function for `kind.highlight` if you want to
								-- keep the highlight groups in sync with the icons.
								highlight = function(ctx)
									local hl = ctx.kind_hl
									if vim.tbl_contains({ "Path" }, ctx.source_name) then
										local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
										if dev_icon then
											hl = dev_hl
										end
									end
									return hl
								end,
							}
						}
					}
				}
			},

			cmdline = {
				enabled = true,
				keymap = {
					preset = "inherit",
					["<Tab>"] = { "show", "select_next", "fallback" },
				},
				completion = {
					menu = { auto_show = false },
					ghost_text = { enabled = false },
				},
			},

			appearance = {
				nerd_font_variant = "normal",
			},
		},
	},

	-- nvim-cmp source compat
	{
		"saghen/blink.compat",
		version = "*",
		lazy = true,
		opts = {},
	},

	-- highlighting in completion menu suggestions
	{
		"xzbdmw/colorful-menu.nvim",
		opts = {},
		init = function()
			vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = nil })
		end,
	}
}

