return {
  "Assistant.nvim",
  dependencies = { "stevearc/dressing.nvim" },
  dir = "~/workspace/development/assistant.nvim",
  opts = {
    commands = {
      cpp = {
        extension = "cpp",
        compile = {
          main = "g++",
          args = { "-std=c++17", "$FILENAME_WITH_EXTENSION", "-o", "$FILENAME_WITHOUT_EXTENSION" },
        },
        execute = {
          main = "./$FILENAME_WITHOUT_EXTENSION",
          args = nil,
        },
      },
    },
  },
}
