return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6", -- Note the correct tag syntax
    dependencies = {
      "nvim-lua/plenary.nvim",
      "jvgrootveld/telescope-zoxide",
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      "nvim-telescope/telescope-frecency.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "nvim-telescope/telescope-project.nvim",
      "nvim-telescope/telescope-github.nvim",
      "nvim-telescope/telescope-bibtex.nvim",
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})

      --extensions

      local z_utils = require("telescope._extensions.zoxide.utils")
      local project_actions = require("telescope._extensions.project.actions")
      extensions = {
        project = {
          base_dirs = {
            "~/dev/src",
            { "~/dev/src2" },
            { "~/dev/src3",        max_depth = 4 },
            { path = "~/dev/src4" },
            { path = "~/dev/src5", max_depth = 2 },
          },
          hidden_files = true, -- default: false
          theme = "dropdown",
          order_by = "asc",
          search_by = "title",
          sync_with_nvim_tree = true, -- default false
          -- default for on_project_selected = find project files
          on_project_selected = function(prompt_bufnr)
            -- Do anything you want in here. For example:
            project_actions.change_working_directory(prompt_bufnr, false)
            require("harpoon.ui").nav_file(1)
          end,
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          mappings = {
            ["i"] = {},
            ["n"] = {},
          },
        },
        zoxide = {
          prompt_title = "[ Walking on the shoulders of TJ ]",
          mappings = {
            default = {
              after_action = function(selection)
                print("Update to (" .. selection.z_score .. ") " .. selection.path)
              end,
            },
            ["<C-s>"] = {
              before_action = function(selection)
                print("before C-s")
              end,
              action = function(selection)
                vim.cmd.edit(selection.path)
              end,
            },
            -- Opens the selected entry in a new split
            ["<C-q>"] = { action = z_utils.create_basic_command("split") },
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      }

      require("telescope").load_extension("zoxide")
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("frecency")
      require("telescope").load_extension("media_files")
      require("telescope").load_extension("project")
      require("telescope").load_extension("gh")
      require("telescope").load_extension("bibtex")
    end,
  },
  {
    "nosduco/remote-sshfs.nvim",
    config = function()
      require("remote-sshfs").setup({})
      require("telescope").load_extension("remote-sshfs")
      local api = require("remote-sshfs.api")
      vim.keymap.set("n", "<leader>rc", api.connect, {})
      vim.keymap.set("n", "<leader>rd", api.disconnect, {})
      vim.keymap.set("n", "<leader>re", api.edit, {})

      local builtin = require("telescope.builtin")
      local connections = require("remote-sshfs.connections")
      vim.keymap.set("n", "<leader>rf", function()
        if connections.is_connected then
          api.find_files()
        else
          builtin.find_files()
        end
      end, {})
      vim.keymap.set("n", "<leader>rg", function()
        if connections.is_connected then
          api.live_grep()
        else
          builtin.live_grep()
        end
      end, {})
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      vim.keymap.set("n", "<C-b>", ":Telescope file_browser<CR>", { desc = "Show the filesystem." })
    end,
  },
}
