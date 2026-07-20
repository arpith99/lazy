return {
  {
    "nicolasgb/jj.nvim",
    version = "*",
    dependencies = { "sindrets/diffview.nvim" },
    config = function()
      require("jj").setup({
        diff = { backend = "diffview" },
      })
    end,
  },
}
