load("//:custom_compile.bzl", "custom_compile", "custom_link")

custom_compile(
	name = "hello",
	src = "hello.c",
	imports = [
		"func.h",
		"numbers.h",
	],
	generate_object_file = True,
	out = "hello.o",
)

custom_compile(
	name = "func",
	src = "func.c",
	imports = [
		"func.h",
	],
	generate_object_file = True,
	out = "func.o",
)

custom_compile(
	name = "numbers",
	src = "numbers.c",
	imports = [
		"numbers.h",
	],
	generate_object_file = True,
	out = "numbers.o",
)

custom_link(
	name = "pizza",
	deps = [
		":func",
		":numbers",
		":hello",
	],
	out = "bar",
)
