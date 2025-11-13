return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    build = "make",
    opts = {
      provider = "gemini",
      system_prompt = function ()
        local hub = require("mcphub").get_hub_instance()
        return hub and hub:get_active_servers_prompt() or ""
      end,
      custom_tools = function ()
        return {
          require("mcphub.extensions.avante").mcp_tool()
        }
      end,
      providers = {
        ollama = {
          model = "deepseek-r1:14b",
        },
        gemini = {
          model = "gemini-2.5-flash",
          extra_requrest_body = {
            temperature = 0.75,
            max_tokens = 1000000
          }
        },
        openai = {
          endpoint = "https://api.openai.com/v1",
          -- model = "gpt-4o",
          model = "o4-mini",
          timeout = 30000,
          extra_requrest_body = {
            temperature = 0.75,
            max_completion_tokens = 8192, -- Increase this to include reasoning tokens (for reasoning models)
            --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
          },
        }
      },
      acp_providers = {
        ["gemini-cli"] = {
          command = "gemini",
          args = { "--experimental-acp" },
          env = {
            NODE_NO_WARNINGS = "1",
            GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
          },
        },
      },
    },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "echasnovski/mini.pick",
      "nvim-telescope/telescope.nvim",
      "hrsh7th/nvim-cmp",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      "MeanderingProgrammer/render-markdown.nvim",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
    },
  },
}
