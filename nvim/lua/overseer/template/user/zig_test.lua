{
  name = "zig_test",
  params = {
    args = {},
  },
  builder = function(params)
    return {
      cmd = { "zig" },
      args = params.args,
      components = {
        { "on_output_quickfix", open = true, close = false, set_diagnostics = true },
        { "on_complete_dispose", timeout = 1000 },
        "default",
      },
    }
  end,
  condition = {
    filetype = { "zig" },
  },
}
