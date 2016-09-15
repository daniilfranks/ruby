module A
    def a1
    end
    def a2
    end
end
module B
     def b1
     end
     def b2
     end
end
class Sample
    include A
    include B
    def s1
    end
end

samp=Sample.new
samp.a1
samp.a2
samp.b1
samp.b2
samp.s1


module Novel
     def no_of_novels
            @no_of_novels=100
            return @no_of_novels
     end
end
module Magazine
     def no_of_mag
            @no_of_mag=350
            return @no_of_mag
     end
end

class Library
     include Novel
     include Magazine
     def maintenance
            puts "This is the maintenance section of the library"
     end
     def issuing
            puts "This is the issuing section of the library"
     end
end

lib=Library.new
n=lib.no_of_novels
puts "The number of novels is : #{n}"
m=lib.no_of_mag
puts "The number of magazines is : #{m}"
lib.maintenance
lib.issuing