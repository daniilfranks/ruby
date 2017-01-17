require 'digest'
require 'fileutils'

class FoDig
	#include Comparable
	attr_reader :sha256sum, :destdir, :filename, :filepath

	def initialize(filepath)
		@filename = File.basename(filepath)
		@filepath = filepath
		@sha256sum = Digest::SHA256.file(filepath)
	end

	def mv(destdir)
		@destdir = destdir
		FileUtils.mkdir(destdir) unless File.exists?(destdir)
		FileUtils.cp_r(@filepath, destdir)
	end

	def <=>(file)
		libdirs = File.join("**", @destdir, "**", @filepath)
		moved_file = Dir.glob(libdirs)[0]
		this  = File.size(@filepath)
		other = File.size(moved_file)
	end
end

p fodig = FoDig.new('fodig.txt')
fodig.mv('fodig')
