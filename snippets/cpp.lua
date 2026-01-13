local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local rep = require("luasnip.extras").rep

ls.add_snippets("cpp", {
	s("hdr", {
		t("#ifndef "),
		i(1, "HEADER_NAME"),
		t({ "", "#define " }),
		rep(1),
		t({ "", "" }),
		i(0),
		t({ "", "" }),
		t("#endif // "),
		rep(1),
	}),
})
