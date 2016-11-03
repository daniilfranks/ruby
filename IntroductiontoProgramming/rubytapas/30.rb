sysinfo =`uname -a`
puts sysinfo

output = %x{finger `whoami`}
puts output


alias old_backtick `
def `(command)
puts "Executing command: #{command}"
puts old_backtick(command)
end

`uname -a`

%x{uname -a}