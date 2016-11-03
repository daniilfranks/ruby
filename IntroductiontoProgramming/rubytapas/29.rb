require 'stringio'

def capture_output
	fake_stdout = StringIO.new
	old_stdout = $stdout
	$stdout = fake_stdout
	Object.const_set(:STDOUT, fake_stdout)
	yield
ensure
	$stdout = old_stdout
	Object.const_set(:STDOUT, old_stdout)
	return fake_stdout.string 
end

output = capture_output do
	$stdout.puts "This goes to standart out"
	STDOUT.puts "This bypasses capture"
	system 'echo "output from subprocess'
end

p output


