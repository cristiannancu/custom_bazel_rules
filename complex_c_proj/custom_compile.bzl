def _custom_compile_impl(ctx):

  imports = depset()
  for target in ctx.attr.imports:
    imports += target.files

  cmd = "gcc "
  if ctx.attr.generate_object_file:
    cmd += "-c "

  cmd += ctx.attr.src.files.to_list()[0].path + " -o " + ctx.outputs.out.path

  ctx.actions.run_shell(
    inputs = ctx.attr.src.files + imports,
    outputs = [ctx.outputs.out],
    command = cmd,
  )

  return DefaultInfo(
    files = depset([ctx.outputs.out]),
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
    "generate_object_file": attr.bool(
      default = False,
    ),
    "out": attr.output(
      mandatory = True,
    ),
  },
  implementation = _custom_compile_impl,
)

def _custom_link_impl(ctx):

  inputs = depset()

  for target in ctx.attr.deps:
    inputs += target.files

  for target in ctx.attr.srcs:
    inputs += target.files

  ctx.actions.run_shell(
    inputs =  inputs,
    outputs = [ctx.outputs.out],
    command = "gcc " + " ".join([input.path for input in inputs]) + " -o " + ctx.outputs.out.path,
  )

custom_link = rule(
  attrs = {
    "srcs": attr.label_list(
      allow_files = True,
    ),
    "deps": attr.label_list(),
    "out": attr.output(
      mandatory = True,
    ),
  },
  implementation = _custom_link_impl,
)
