vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
local cmp = require "cmp"
local defaults = require("cmp.config.default")()


require("luasnip.loaders.from_vscode").lazy_load()


-- local formatting_style = {
--   -- default fields order i.e completion word + item.kind + item.kind icons
--   fields = { "abbr", "kind", "menu" },
--   format = require('tailwindcss-colorizer-cmp').formatter,
-- }


-- local function border(hl_name)
--   return {
--     { "╭", hl_name },
--     { "─", hl_name },
--     { "╮", hl_name },
--     { "│", hl_name },
--     { "╯", hl_name },
--     { "─", hl_name },
--     { "╰", hl_name },
--     { "│", hl_name },
--   }
-- end

local icons = {
  Text = "󰉿",
  Snippet = "",
  Keyword = "󰌋",
  File = "󰉿",
  Module = "󰜢",
  Namespace = "",
  Package = "󰊕",
  Class = "󰌋",
  Method = "",
  Property = "",
  Field = "",
  Constructor = "",
  Enum = "",
  Interface = "",
  Function = "󰊕",
  Variable = "",
  Constant = "",
  String = "",
  Number = "#",
  Boolean = "",
  Array = "",
  Object = "",
  Key = "",
  Null = "",
  EnumMember = "",
  Struct = "",
  Eient = "",
  Operator = "",
  TypeParameter = "",
  Component = "",
  Fragment = "",
}

local options = {
  completion = {
    completeopt = "menu,menuone,noinsert",
  },
  -- window = {
  --   completion = {
  --     side_padding = 0,
  --     winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:PmenuSel",
  --     scrollbar = true,
  --     border = border "CmpDocBorder",
  --   },
  --   documentation = {
  --     border = border "CmpDocBorder",
  --     winhighlight = "Normal:CmpDoc",
  --   },
  -- },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },


  -- formatting = formatting_style,
  formatting = {
    format = function(_, vim_item)
      vim_item.kind = icons[vim_item.kind] .. " " .. vim_item.kind or vim_item.kind
      return vim_item
    end,
  },
  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
          "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(
          vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
  }, {
    { name = "buffer" },
  }),
  experimental = {
    ghost_text = {
      hl_group = "CmpGhostText",
    },
  },
  sorting = defaults.sorting,
}
require("cmp").setup(options)

--- HACK: Override `vim.lsp.util.stylize_markdown` to use Treesitter.
---@param bufnr integer
---@param contents string[]
---@param opts table
---@return string[]
---@diagnostic disable-next-line: duplicate-set-field
vim.lsp.util.stylize_markdown = function(bufnr, contents, opts)
  contents = vim.lsp.util._normalize_markdown(contents, {
    width = vim.lsp.util._make_floating_popup_size(contents, opts),
  })
  vim.bo[bufnr].filetype = 'markdown'
  vim.treesitter.start(bufnr)
  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, contents)

  return contents
end
