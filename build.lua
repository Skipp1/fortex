#!/usr/bin/env texlua

module = "fortex.dtx"

-- m for minted (Needs shell-esc)
-- o for output-directory
checkconfigs = { "build", "build_m", "build_o" }
checkengines = { "pdftex", "luatex", "ptex", "uptex", "xetex"}
checkruns = 3

-- We use special unicode and need 8bit on some engines.

-- pTeX emits warnings when it has to guess the encoding. 
-- listings loads lots of files where it has to guess. 
-- Therefore we just quiet pTeX
specialformats = specialformats or {}
specialformats.latex = {
	luatex = { binary = "lualatex", format = "" },
	pdftex = { binary = "pdflatex", format = "" },
	ptex   = { binary = "platex",   format = "", options="-8bit 2>/dev/null" },
	uptex  = { binary = "uplatex",  format = "", options="-8bit" },
	xetex  = { binary = "xelatex",  format = "", options="-8bit" },
}
asciiengines = {}

function runtest_tasks ( name , run )
	return " makeindex " .. name .. " 2>/dev/null "
end
