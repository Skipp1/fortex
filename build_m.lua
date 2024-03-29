#!/usr/bin/env texlua

testfiledir = "testfiles_m"

specialformats = specialformats or {}
specialformats.latex = {
	luatex = { binary = "lualatex", format = "", options="-shell-esc" },
	pdftex = { binary = "pdflatex", format = "", options="-shell-esc"},
	ptex   = { binary = "platex",   format = "", options="-8bit -shell-esc 2>/dev/null" },
	uptex  = { binary = "uplatex",  format = "", options="-8bit -shell-esc" },
	xetex  = { binary = "xelatex",  format = "", options="-8bit -shell-esc" }
}

function runtest_tasks ( name , run )
	return " makeindex " .. name .. " 2>/dev/null "
end
