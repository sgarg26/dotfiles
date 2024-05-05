return {
  "kdheepak/lazygit.nvim",
  cmd = {
    "LazyGit",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "AstroNvim/astrocore",
      opts = { mappings = { n = {
        ["<Leader>lg"] = { "<Cmd>LazyGit<CR>", desc = "LazyGit" },
      } } },
    },
  },
  opts = {},
}
