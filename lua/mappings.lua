-- NOTE: NvChad Related Mappings
---@type MappingsTable
local fn = vim.fn
local cwd = vim.fn.stdpath "config" .. "/"
local config_dir = { cwd }

local mappings = {
  LspLens = {
    n = {
      ["<leader>ll"] = {
        "<cmd>LspLensToggle<cr>",
        "Toggle Code Lens",
        opts = { silent = true },
      },
    },
  },

  Harpoon = {
    n = {
      ["<leader>ha"] = {
        function()
          require("harpoon"):list():append()
          vim.notify("   Marked file", vim.log.levels.INFO, { title = "Harpoon" })
        end,
        "Add Mark",
        opts = { silent = true },
      },
      ["<leader>hh"] = {
        function()
          require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
        end,
        "Harpoon Menu",
        opts = { silent = true },
      },

      -- ["<leader>hn"] = {
      --   function()
      --     require("harpoon"):list():next()
      --   end,
      --   "Next",
      --   opts = { silent = true },
      -- },

      -- ["<leader>hp"] = {
      --   function()
      --     require("harpoon"):list():prev()
      --   end,
      --   "Previous",
      --   opts = { silent = true },
      -- },
    },
  },

  Swenv = {
    n = {
      ["<leader>vp"] = {
        ":lua=require('swenv.api').pick_venv()<cr>",
        "Pick Venv",
        opts = { silent = true },
      },
    },
  },

  MarkdownPreview = {
    n = {
      ["<leader>m"] = {
        function()
          if vim.bo.filetype == "markdown" then
            vim.cmd "MarkdownPreviewToggle"
          else
            vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Preview" })
          end
        end,
        "Markdown Preview",
        opts = { silent = true },
      },
    },
  },

  NvimTree = {
    n = {
      ["<leader>e"] = {
        "<cmd>NvimTreeToggle<cr>",
        "Explorer",
        opts = { silent = true },
      },
    },
  },

  Compiler = {
    n = {
      ["<leader>rr"] = {
        "<cmd>CompilerRedo<cr>",
        "Redo Last Action",
        opts = { silent = true },
      },

      ["<leader>ro"] = {
        "<cmd>CompilerOpen<cr>",
        "Open",
        opts = { silent = true },
      },

      ["<leader>rs"] = {
        "<cmd>CompilerStop<cr>",
        "Stop All Tasks",
        opts = { silent = true },
      },

      ["<leader>rt"] = {
        "<cmd>CompilerToggleResults<cr>",
        "Toggle Results.",
        opts = { silent = true },
      },
    },
  },

  Dap = {
    n = {
      ["<leader>dc"] = {
        "<cmd>lua require'dap'.continue()<cr>",
        "Continue",
        opts = { silent = true },
      },

      ["<leader>do"] = {
        "<cmd>lua require'dap'.step_over()<cr>",
        "Step Over",
        opts = { silent = true },
      },

      ["<leader>di"] = {
        "<cmd>lua require'dap'.step_into()<cr>",
        "Step Into",
        opts = { silent = true },
      },

      ["<leader>du"] = {
        "<cmd>lua require'dap'.step_out()<cr>",
        "Step Out",
        opts = { silent = true },
      },

      ["<leader>db"] = {
        "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
        "Breakpoint",
        opts = { silent = true },
      },

      ["<leader>dB"] = {
        "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>",
        "Breakpoint Condition",
        opts = { silent = true },
      },

      ["<leader>dd"] = {
        "<cmd>lua require'dapui'.toggle()<cr>",
        "Dap UI",
        opts = { silent = true },
      },

      ["<leader>dl"] = {
        "<cmd>lua require'dap'.run_last()<cr>",
        "Run Last",
        opts = { silent = true },
      },
    },
  },

  Neotest = {
    n = {
      ["<leader>Tt"] = {
        function()
          vim.cmd 'lua require("neotest").run.run(vim.fn.expand "%")'
        end,
        "Run File",
        opts = { silent = true },
      },

      ["<leader>TT"] = {
        function()
          vim.cmd 'lua require("neotest").run.run(vim.loop.cwd())'
        end,
        "Run All Test Files",
        opts = { silent = true },
      },

      ["<leader>Tr"] = {
        function()
          vim.cmd 'lua require("neotest").run.run()'
        end,
        "Run Nearest",
        opts = { silent = true },
      },

      ["<leader>Td"] = {
        function()
          vim.cmd 'lua require("neotest").run.run { strategy = "dap" }'
        end,
        "Run Dap",
        opts = { silent = true },
      },

      ["<leader>Ts"] = {
        function()
          vim.cmd 'lua require("neotest").summary.toggle()'
        end,
        "Toggle Summary",
        opts = { silent = true },
      },

      ["<leader>To"] = {
        function()
          vim.cmd 'lua require("neotest").output.open { enter = true, auto_close = true }'
        end,
        "Show Output",
        opts = { silent = true },
      },

      ["<leader>TO"] = {
        function()
          vim.cmd 'lua require("neotest").output_panel.toggle()'
        end,
        "Toggle Output Panel",
        opts = { silent = true },
      },

      ["<leader>TS"] = {
        function()
          vim.cmd 'lua require("neotest").run.stop()'
        end,
        "Stop",
        opts = { silent = true },
      },
    },
  },

  Neovim = {
    n = {
      ["<leader>nf"] = {
        function()
          require("telescope.builtin").find_files {
            prompt_title = "Config Files",
            search_dirs = config_dir,
            cwd = cwd,
          }
        end,
        "Find Config Files",
        opts = { silent = true },
      },

      ["<leader>ng"] = {
        function()
          require("telescope.builtin").live_grep {
            prompt_title = "Config Files",
            search_dirs = config_dir,
            cwd = cwd,
          }
        end,
        "Grep Config Files",
        opts = { silent = true },
      },

      -- ["<leader>nc"] = {
      --   "<cmd>NvCheatsheet<cr>",
      --   "Cheatsheet",
      --   opts = { silent = true },
      -- },

      ["<leader>ni"] = {
        function()
          if vim.fn.has "nvim-0.9.0" == 1 then
            vim.cmd "Inspect"
          else
            vim.notify("Inspect isn't available in this neovim version", vim.log.levels.WARN, { title = "Inspect" })
          end
        end,
        "Inspect",
        opts = { silent = true },
      }, -- only available on neovim >= 0.9

      ["<leader>nm"] = {
        "<cmd>messages<cr>",
        "Messages",
        opts = { silent = true },
      },

      ["<leader>nh"] = {
        "<cmd>checkhealth<cr>",
        "Health",
        opts = { silent = true },
      },

      ["<leader>nv"] = {
        function()
          local version = vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch
          return vim.notify(version, vim.log.levels.INFO, { title = "Neovim Version" })
        end,
        "Version",
        opts = { silent = true },
      },
      ["<leader>nr"] = {
        function()
          RunCode()
        end,
        "Run Code",
        opts = { silent = true },
      },
    },
  },

  Sessions = {
    n = {
      ["<leader>so"] = {
        "<cmd>SessionStop<cr>",
        "Stop",
        opts = { silent = true },
      },

      ["<leader>sl"] = {
        "<cmd>SessionLoad<cr>",
        "Load",
        opts = { silent = true },
      },

      ["<leader>sL"] = {
        "<cmd>SessionLoad<cr>",
        "Load Last",
        opts = { silent = true },
      },

      ["<leader>sd"] = {
        "<cmd>SessionDelete<cr>",
        "Delete",
        opts = { silent = true },
      },
    },
  },

  Telescope = {
    n = {
      ["<leader>fa"] = {
        "<cmd>Telescope autocommands<cr>",
        "Autocommmands",
        opts = { silent = true },
      },

      ["<leader>ff"] = {
        "<cmd>Telescope find_files<cr>",
        "Files",
        opts = { silent = true },
      },

      ["<leader>fs"] = {
        "<cmd>Telescope persisted<cr>",
        "Sessions",
        opts = { silent = true },
      },

      ["<leader>fm"] = {
        "<cmd>Telescope marks<cr>",
        "Marks",
        opts = { silent = true },
      },

      ["<leader>fM"] = {
        "<cmd>Telescope man_pages<cr>",
        "Man Pages",
        opts = { silent = true },
      },

      ["<leader>fw"] = {
        "<cmd>Telescope live_grep<cr>",
        "Word",
        opts = { silent = true },
      },

      ["<leader>ft"] = {
        "<cmd>Telescope themes<cr>",
        "Themes",
        opts = { silent = true },
      },

      ["<leader>fb"] = {
        "<cmd>Telescope buffers<cr>",
        "Buffers",
        opts = { silent = true },
      },

      ["<leader>fn"] = {
        "<cmd>lua require('telescope').extensions.notify.notify()<cr>",
        "Notify History",
        opts = { silent = true },
      },

      ["<leader>fp"] = {
        "<cmd>Telescope projects<cr>",
        "Projects",
        opts = { silent = true },
      },

      ["<leader>fh"] = {
        "<cmd>Telescope help_tags<cr>",
        "Help",
        opts = { silent = true },
      },

      ["<leader>fk"] = {
        "<cmd>Telescope keymaps<cr>",
        "Keymaps",
        opts = { silent = true },
      },

      ["<leader>fC"] = {
        "<cmd>Telescope commands<cr>",
        "Commands",
        opts = { silent = true },
      },

      ["<leader>fr"] = {
        "<cmd>Telescope oldfiles<cr>",
        "Recent Files",
        opts = { silent = true },
      },

      ["<leader>fH"] = {
        "<cmd>Telescope highlights<cr>",
        "Highlights",
        opts = { silent = true },
      },

      ["<leader>ls"] = {
        "<cmd>Telescope lsp_document_symbols<cr>",
        "Buffer Symbols",
        opts = { silent = true },
      },

      ["<leader>lS"] = {
        "<cmd>Telescope lsp_workspace_symbols<cr>",
        "Workspace Symbols",
        opts = { silent = true },
      },

      ["<leader>gb"] = {
        "<cmd>Telescope git_branches<cr>",
        "Checkout branch",
        opts = { silent = true },
      },

      ["<leader>gc"] = {
        "<cmd>Telescope git_commits<cr>",
        "Checkout commit",
        opts = { silent = true },
      },
    },
  },

  Toggleterm = {
    n = {
      ["<leader>tf"] = {
        "<cmd>ToggleTerm direction=float<cr>",
        "Float Terminal",
        opts = { silent = true },
      },

      ["<leader>th"] = {
        "<cmd>ToggleTerm direction=horizontal<cr>",
        "Horizontal Terminal",
        opts = { silent = true },
      },

      ["<leader>tv"] = {
        "<cmd>ToggleTerm direction=vertical<cr>",
        "Vertical Terminal",
        opts = { silent = true },
      },

      ["<leader>gg"] = {
        function()
          ClickGit()
        end,
        "Lazygit",
        opts = { silent = true },
      },
    },
  },

  Trouble = {
    n = {
      ["<leader>lb"] = {
        "<cmd>TroubleToggle document_diagnostics<cr>",
        "Buffer Diagnostics",
        opts = { silent = true },
      },

      ["<leader>lw"] = {
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        "Workspace Diagnostics",
        opts = { silent = true },
      },

      ["<leader>fT"] = {
        "<cmd>TodoTelescope<cr>",
        "Todo",
        opts = { silent = true },
      },
    },
  },

  Lspsaga = {
    n = {
      ["<leader>la"] = {
        "<cmd>Lspsaga code_action<cr>",
        "Code Action",
        opts = { silent = true },
      },

      ["<leader>lo"] = {
        "<cmd>Lspsaga outline<cr>",
        "Code Outline",
        opts = { silent = true },
      },

      ["<leader>lI"] = {
        "<cmd>Lspsaga incoming_calls<cr>",
        "Incoming Calls",
        opts = { silent = true },
      },

      ["<leader>lO"] = {
        "<cmd>Lspsaga outgoing_calls<cr>",
        "Outgoing Calls",
        opts = { silent = true },
      },

      ["<leader>lr"] = {
        "<cmd>Lspsaga rename<cr>",
        "Rename",
        opts = { silent = true },
      },

      ["<leader>lj"] = {
        "<cmd>Lspsaga diagnostic_jump_next<cr>",
        "Next Diagnostic",
        opts = { silent = true },
      },

      ["<leader>lk"] = {
        "<cmd>Lspsaga diagnostic_jump_prev<cr>",
        "Prev Diagnostic",
        opts = { silent = true },
      },
    },
    v = {
      ["<leader>la"] = {
        "<cmd>Lspsaga code_action<cr>",
        "Code Action",
        opts = { silent = true },
      },
    },
  },

  Mason = {
    n = {
      ["<leader>lm"] = {
        "<cmd>Mason<cr>",
        "Mason Installer",
        opts = { silent = true },
      },
    },
  },

  LSP = {
    n = {
      ["<leader>lf"] = {
        "<cmd>Format<cr>",
        "Format",
        opts = { silent = true },
      },

      ["<leader>li"] = {
        "<cmd>LspInfo<cr>",
        "Info",
        opts = { silent = true },
      },

      ["<leader>lR"] = {
        "<cmd>LspRestart<cr>",
        "Restart",
        opts = { silent = true },
      },
    },
    v = {
      ["<leader>lf"] = {
        "<cmd>Format<cr>",
        "Format",
        opts = { silent = true },
      },
    },
  },

  GitBlame = {
    n = {
      ["<leader>gO"] = {
        "<cmd>GitBlameOpenCommitURL<cr>",
        "Open Commit Url",
        opts = { silent = true },
      },

      ["<leader>gc"] = {
        "<cmd>GitBlameCopyCommitURL<cr>",
        "Copy Commit Url",
        opts = { silent = true },
      },

      ["<leader>gf"] = {
        "<cmd>GitBlameOpenFileURL<cr>",
        "Open File Url",
        opts = { silent = true },
      },

      ["<leader>gC"] = {
        "<cmd>GitBlameCopyFileURL<cr>",
        "Copy File Url",
        opts = { silent = true },
      },

      ["<leader>gs"] = {
        "<cmd>GitBlameCopySHA<cr>",
        "Copy SHA",
        opts = { silent = true },
      },

      ["<leader>gt"] = {
        function()
          if vim.g.gitblame_enabled ~= true then
            vim.cmd "GitBlameEnable"
            vim.g.gitblame_enabled = true
          else
            vim.cmd "GitBlameDisable"
            vim.g.gitblame_enabled = false
          end
        end,
        "Toggle Blame",
        opts = { silent = true },
      },
    },
  },

  GitSigns = {
    n = {
      ["<leader>gp"] = {
        "<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
        "Preview Hunk",
        opts = { silent = true },
      },

      ["<leader>gj"] = {
        "<cmd>lua require 'gitsigns'.next_hunk()<cr>",
        "Next Hunk",
        opts = { silent = true },
      },

      ["<leader>gk"] = {
        "<cmd>lua require 'gitsigns'.prev_hunk()<cr>",
        "Prev Hunk",
        opts = { silent = true },
      },

      ["<leader>gl"] = {
        "<cmd>lua require 'gitsigns'.blame_line()<cr>",
        "Blame Line",
        opts = { silent = true },
      },
    },
  },

  Diffview = {
    n = {
      ["<leader>gd"] = {
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd "DiffviewOpen"
          else
            vim.cmd "DiffviewClose"
          end
        end,
        "Toggle Diffview",
        opts = { silent = true },
      },
    },
  },

  Lazy = {
    n = {
      ["<leader>pc"] = {
        "<cmd>Lazy clean<cr>",
        "Clean",
        opts = { silent = true },
      },

      ["<leader>pC"] = {
        "<cmd>Lazy check<cr>",
        "Check",
        opts = { silent = true },
      },

      ["<leader>pd"] = {
        "<cmd>Lazy debug<cr>",
        "Debug",
        opts = { silent = true },
      },

      ["<leader>pi"] = {
        "<cmd>Lazy install<cr>",
        "Install",
        opts = { silent = true },
      },

      ["<leader>ps"] = {
        "<cmd>Lazy sync<cr>",
        "Sync",
        opts = { silent = true },
      },

      ["<leader>pl"] = {
        "<cmd>Lazy log<cr>",
        "Log",
        opts = { silent = true },
      },

      ["<leader>ph"] = {
        "<cmd>Lazy home<cr>",
        "Home",
        opts = { silent = true },
      },

      ["<leader>pH"] = {
        "<cmd>Lazy help<cr>",
        "Help",
        opts = { silent = true },
      },

      ["<leader>pp"] = {
        "<cmd>Lazy profile<cr>",
        "Profile",
        opts = { silent = true },
      },

      ["<leader>pu"] = {
        "<cmd>Lazy update<cr>",
        "Update",
        opts = { silent = true },
      },
    },
  },

  General = {
    n = {
      ["<leader>R"] = {
        "<cmd>%d+<cr>",
        "Remove All Text",
        opts = { silent = true },
      },

      ["<leader>y"] = {
        "<cmd>%y+<cr>",
        "Yank All Text",
        opts = { silent = true },
      },

      ["<leader>q"] = {
        "<cmd>qa!<cr>",
        "Quit",
        opts = { silent = true },
      },

      ["<leader>c"] = {
        "<cmd>Bdelete!<cr>",
        "Close Buffer",
        opts = { silent = true },
      },

      ["<leader>ob"] = {
        function()
          if vim.o.showtabline == 2 then
            vim.o.showtabline = 0
          else
            vim.o.showtabline = 2
          end
        end,
        "Toggle Tabufline",
        opts = { silent = true },
      },

      ["<leader>os"] = {
        function()
          if vim.o.laststatus == 3 then
            vim.o.laststatus = 0
          else
            vim.o.laststatus = 3
          end
        end,
        "Toggle Statusline",
        opts = { silent = true },
      },

      ["<leader>ol"] = {
        function()
          if vim.o.number then
            vim.o.number = false
          else
            vim.o.number = true
          end
        end,
        "Toggle Line Number",
        opts = { silent = true },
      },

      ["<leader>or"] = {
        function()
          if vim.o.relativenumber then
            vim.o.relativenumber = false
          else
            vim.o.relativenumber = true
          end
        end,
        "Toggle Relative Number",
        opts = { silent = true },
      },
      ["<leader>ot"] = {
        function()
          require("base46").toggle_theme()
        end,
        "Toggle Theme",
        opts = { silent = true },
      },

      ["<leader>oT"] = {
        function()
          require("base46").toggle_transparency()
        end,
        "Toggle Transparency",
        opts = { silent = true },
      },

      ["<leader>ow"] = {
        function()
          if vim.o.wrap then
            vim.o.wrap = false
          else
            vim.o.wrap = true
          end
        end,
        "Toggle Wrap",
        opts = { silent = true },
      },

      -- ["jk"] = {
      --   "<Esc>",
      --   "Enter insert mode",
      --   opts = { silent = true },
      -- },

      ["j"] = {
        "v:count == 0 ? 'gj' : 'j'",
        "Better Down",
        opts = { expr = true, silent = true },
      },

      ["k"] = {
        "v:count == 0 ? 'gk' : 'k'",
        "Better Up",
        opts = { expr = true, silent = true },
      },

      ["<C-j>"] = {
        "<C-w>j",
        "Go to upper window",
        opts = { silent = true },
      },

      ["<C-k>"] = {
        "<C-w>k",
        "Go to lower window",
        opts = { silent = true },
      },

      ["<C-h>"] = {
        "<C-w>h",
        "Go to left window",
        opts = { silent = true },
      },

      ["<C-l>"] = {
        "<C-w>l",
        "Go to right window",
        opts = { silent = true },
      },

      -- ["<Leader>w"] = {
      --   "<C-w>w",
      --   "Go to next window",
      --   opts = { silent = true },
      -- },

      ["<leader>w"] = {
        function()
          if vim.bo.buftype == "terminal" then
            vim.cmd "Bdelete!"
            vim.cmd "silent! close"
          elseif #vim.api.nvim_list_wins() > 1 then
            vim.cmd "silent! close"
          else
            vim.notify("Can't Close Window", vim.log.levels.WARN, { title = "Close Window" })
          end
        end,
        "Close window",
        opts = { silent = true },
      },

      ["<C-Up>"] = {
        "<cmd>resize +2<CR>",
        "Add size at the top",
        opts = { silent = true },
      },

      ["<C-Down>"] = {
        "<cmd>resize -2<CR>",
        "Add size at the bottom",
        opts = { silent = true },
      },

      ["<C-Right>"] = {
        "<cmd>vertical resize +2<CR>",
        "Add size at the left",
        opts = { silent = true },
      },

      ["<C-Left>"] = {
        "<cmd>vertical resize -2<CR>",
        "Add size at the right",
        opts = { silent = true },
      },

      ["H"] = {
        "<cmd>bp<cr>",
        "Go to previous buffer",
        opts = { silent = true },
      },
      ["L"] = {
        "<cmd>bn<cr>",
        "Go to next buffer",
        opts = { silent = true },
      },

      ["<Left>"] = {
        "<cmd>tabprevious<CR>",
        "Go to previous tab",
        opts = { silent = true },
      },

      ["<Right>"] = {
        "<cmd>tabnext<CR>",
        "Go to next tab",
        opts = { silent = true },
      },

      ["<Up>"] = {
        "<cmd>tabnew<CR>",
        "New tab",
        opts = { silent = true },
      },

      ["<Down>"] = {
        "<cmd>tabclose<CR>",
        "Close tab",
        opts = { silent = true },
      },

      ["<"] = {
        "<<",
        "Indent backward",
        opts = { silent = true },
      },

      [">"] = {
        ">>",
        "Indent forward",
        opts = { silent = true },
      },

      ["<A-j>"] = {
        ":m .+1<CR>==",
        "Move the line up",
        opts = { silent = true },
      },

      ["<A-k>"] = {
        ":m .-2<CR>==",
        "Move the line down",
        opts = { silent = true },
      },
    },
    i = {
      -- ["jk"] = {
      --   "<Esc>",
      --   "Enter insert mode",
      --   opts = { silent = true },
      -- },

      ["<A-j>"] = {
        "<Esc>:m .+1<CR>==gi",
        "Move the line up",
        opts = { silent = true },
      },

      ["<A-k>"] = {
        "<Esc>:m .-2<CR>==gi",
        "Move the line down",
        opts = { silent = true },
      },
    },
    v = {
      ["j"] = {
        "v:count == 0 ? 'gj' : 'j'",
        "Better Down",
        opts = { expr = true, silent = true },
      },

      ["k"] = {
        "v:count == 0 ? 'gk' : 'k'",
        "Better Up",
        opts = { expr = true, silent = true },
      },

      ["p"] = {
        '"_dP',
        "Better Paste",
        opts = { silent = true },
      },

      -- ["jk"] = {
      --   "<Esc>",
      --   "Enter insert mode",
      --   opts = { silent = true },
      -- },

      ["<"] = {
        "<gv",
        "Indent backward",
        opts = { silent = true },
      },

      [">"] = {
        ">gv",
        "Indent forward",
        opts = { silent = true },
      },

      ["<A-j>"] = {
        ":m '>+1<CR>gv=gv",
        "Move the selected text up",
        opts = { silent = true },
      },

      ["<A-k>"] = {
        ":m '<-2<CR>gv=gv",
        "Move the selected text down",
        opts = { silent = true },
      },
    },
    c = {
      ["<Tab>"] = {
        function()
          if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
            return "<CR>/<C-r>/"
          end
          return "<C-z>"
        end,
        "Word Search Increment",
        opts = { expr = true },
      },

      ["<S-Tab>"] = {
        function()
          if fn.getcmdtype() == "/" or fn.getcmdtype() == "?" then
            return "<CR>?<C-r>/"
          end
          return "<S-Tab>"
        end,
        "Word Search Decrement",
        opts = { expr = true },
      },
    },
    t = {
      ["<Esc>"] = {
        "<C-\\><C-n>",
        "Enter insert mode",
        opts = { silent = true },
      },
    },
  },
}

if vim.fn.has "nvim-0.10" == 1 then
  mappings.LSP.n["<leader>lh"] = {
    function()
      if vim.lsp.inlay_hint.is_enabled(0) then
        vim.cmd "lua=vim.lsp.inlay_hint.enable(0, false)"
      else
        vim.cmd "lua=vim.lsp.inlay_hint.enable(0, true)"
      end
    end,
    "Inlay Hints",
    opts = { silent = true },
  }
end

-- local disabled = {
--   n = {
--     "<leader>rh",
--     "<leader>ph",
--     "<leader>gb",
--   },
-- }

-- for mode, maps in pairs(disabled) do
--   for _, val in pairs(maps) do
--     vim.keymap.del(mode, val)
--   end
-- end

for _, module in pairs(mappings) do
  for mode, maps in pairs(module) do
    for key, val in pairs(maps) do
      local opts = vim.tbl_deep_extend("force", val.opts, { desc = val[2] })
      vim.keymap.set(mode, key, val[1], opts)
    end
  end
end
