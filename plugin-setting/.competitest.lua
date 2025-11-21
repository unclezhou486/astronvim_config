-- .competitest.lua content
return {
	multiple_testing = -1,
	maximum_time = 5000,
	testcases_use_single_file = true,
	testcases_input_file_format = "in_$(TCNUM).txt",
	testcases_output_file_format = "ans_$(TCNUM).txt",
	testcases_single_file_format = ".file_testcases/$(FNOEXT).tc",
	compile_command = {
		c = { exec = "gcc", args = { "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
		cpp = { exec = "g++", args = {"-std=c++20", "-Wall", "$(FNAME)", "-o", "$(FNOEXT).out" } },
		rust = { exec = "rustc", args = { "$(FNAME)" } },
		java = { exec = "javac", args = { "$(FNAME)" } },
	},
	run_command = {
		cpp = {exec = "./$(FNOEXT).out"}
	},
	template_file = {
		cpp = "/home/unclezhou/Coderepo/template.cpp",
	},
	evaluate_template_modifiers = true,
	date_format = "%Y-%m-%d %H:%M:%S",
	received_problems_path = "/home/unclezhou/Coderepo/ACM-Solutions/Mix/$(JUDGE)/$(CONTEST)/$(PROBLEM).$(FEXT)",
	save_current_file = true,
	view_output_diff = true,
  open_receievd_contest = true,
}
