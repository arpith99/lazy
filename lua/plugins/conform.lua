return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        c = { "clang-format" },
      },
      formatters = {
        ["clang-format"] = {
          prepend_args = { "--style=file:./src/.clang-format" },
        },
      },
    },
  },
}
