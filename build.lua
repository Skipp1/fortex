#!/usr/bin/env texlua

module = "fortex.dtx"

-- m for minted (Needs shell-esc)
checkconfigs = { "build", "build_m" }
checkengines = { "pdftex", "luatex", "ptex", "uptex", "xetex" }
checkruns = 3

-- We use special unicode and need 8bit on some engines.
specialformats = specialformats or {}
specialformats.latex = {
	luatex = { binary = "lualatex", format="" },
	pdftex = { binary = "pdflatex", format="" },
	ptex   = { binary = "platex",   format = "", options="-8bit" },
	uptex  = { binary = "uplatex",  format = "", options="-8bit" },
	xetex  = { binary = "xelatex",  format = "", options="-8bit" }
}
asciiengines = {}

-- Check the outputted source code too
test_types = {
	source_test_c = {
		test = ".cvt",
		reference = ".expect.c",
		generated = ".c",
		rewrite = function(source, normalized, engine, errorcode)
			os.execute(string.format("cp %s %s", source, normalized))
			-- For Subfiles
			os.execute(string.format("cat %s.1 2>/dev/null 1>> %s", source, normalized))
			os.execute(string.format("cat %s.2 2>/dev/null 1>> %s", source, normalized))
		end,
	},
}

test_order = { "source_test_c", "log" }


function runtest_tasks ( name , run )
	-- Run makeindex on check as we automatically add stuff.
		return " makeindex " .. name .. " 2>/dev/null "
end
