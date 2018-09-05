def _custom_compile_impl(ctx):

  ctx.actions.run_shell(
    inputs = ctx.attr.src.files,
    outputs = [ctx.outputs.out],
    command = "gcc " + ctx.attr.src.files.to_list()[0].path + " -o " + ctx.outputs.out.path,
  )

custom_compile = rule(
  attrs = {
    "src": attr.label(
      mandatory = True,
      allow_files = True,
    ),
    "out": attr.output(),
  },
  implementation = _custom_compile_impl,
)
