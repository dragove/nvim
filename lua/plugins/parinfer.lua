-- better lisp editing
return {
	"eraserhd/parinfer-rust",
	ft = { "lisp", "scheme" },
	build = "cargo build --release",
}
