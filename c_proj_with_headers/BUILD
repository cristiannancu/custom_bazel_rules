load("//:custom_compile.bzl", "custom_compile")

custom_compile(
	name = "foo",
	src = "hello.c",
	imports = [
		"func.h",
		"numbers.h",
	],
	out = "bar",
)
