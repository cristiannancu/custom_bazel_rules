def _custom_compile_impl(ctx):

  imports = depset()
  for target in ctx.attr.imports:
    imports += target.files

  ctx.actions.run_shell(
    inputs = ctx.attr.src.files + imports,
    outputs = [ctx.outputs.out],
    command = "gcc " + ctx.attr.src.files.to_list()[0].path + " -o " + ctx.outputs.out.path,
  )

custom_compile = rule(
  attrs = {
    "src": attr.label(
      mandatory = True,
      allow_files = True,
    ),
    "imports": attr.label_list(
      allow_files = True,
    ),
    "out": attr.output(),
  },
  implementation = _custom_compile_impl,
)
