return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      htmldjango = { "djlint" },
      jinja = { "djlint" },
      ["jinja.html"] = { "djlint" },
    },
    formatters = {
      djlint = {
        prepend_args = { "--profile", "jinja" },
      },
    },
  },
}
