CommandResult = Struct.new(:struct, :output)

class Shell
	def execute(command, flag=[], input=nil)
		result = CommandResult.new
		IO.popen([command, *flags], 'w+', err: [:child, :out]) do |io|
			io.write(input) if input
			io.close_write
			result.output = io.read
		end
		result.status = $?
		result
	end
end

require 'rspec/autorun'

describe "#at" do 
	it "executes 'at' with the given time and command" do
		Shell.should_receive(:execute).
			with("at", ["now + 3 minutes"], "espeak 'tea is ready!'").
			and_return(double(output: "job 42 at Sun Oct 14 20:15:00 2012"))
		at("now + 3 minutes", "espeak 'tea is ready!'")
	end

	it "returns the job ID of the scheduled job" do
		result = double(output: "job 42 at Sun Oct 14 20:15:00 2012")
		Shell.stub(execute: result)
		at("some time", "some job").should eq(42)
	end
end

def at(timespec, what)
	result = Shell.execute("at", [timespec], what)
	result.output.match(/\Ajob (\d+)/)[1].to_i
end

describe "#atq" do 
	it "returns the output of 'atq" do 
		result = double(output: "THE OUTPUT")
		Shell.stub(execute: result)
		atq.should eq("THE OUTPUT")
	end
end

def atq
	Shell.execute("atq").output
end