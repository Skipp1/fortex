#!/usr/bin/env texlua

testfiledir = "testfiles_m"

texinputs = "TEXINPUTS=$TEXINPUTS"..os_pathsep.."out "

checkengines = { "pdftex", "luatex", "ptex", "uptex", "xetex"}

specialformats = specialformats or {}
specialformats.latex = {
	pdftex = { binary = texinputs.."pdflatex", format = "", options="-shell-esc -output-directory=out" },
	luatex = { binary = texinputs.."lualatex", format = "", options="-shell-esc -output-directory=out" },
	ptex   = { binary = texinputs.."platex",   format = "", options="-8bit -shell-esc -output-directory=out 2>/dev/null" },
	uptex  = { binary = texinputs.."uplatex",  format = "", options="-8bit -shell-esc -output-directory=out" },
	xetex  = { binary = texinputs.."xelatex",  format = "", options="-8bit -shell-esc -output-directory=out" }
}

test_types = {
	outputdir = {
		test = ".lvt",
		reference = ".tlg",
		generated = ".log.output",
		rewrite = function(source, normalised, engine, err) 
			copylog()
			rewrite_log(source, normalised, engine, err)
			os.execute(string.format("sed -i 's:(out[/\\]:(:g' %s", normalised))
		end,
	}
}
test_order = { "outputdir" }

function copylog( ) 
	cp("*", testdir.."/out", testdir)
	logs = filelist(testdir, "*.log")
	for _, log in ipairs(logs) do 
		ren(testdir, log, log..".output")
	end 
end 

function runtest_tasks( name , run )
	copylog()
	return "cd out/" .. os_concat .."makeindex " .. name .. " 2>/dev/null" .. os_concat .. "cd .."
end 

function checkinit_hook()
	mkdir(testdir.."/out")
	return 0
end 
