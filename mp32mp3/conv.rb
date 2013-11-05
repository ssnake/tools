#!/usr/bin/env ruby

# encoding: utf-8
$LOAD_PATH <<  '/home/snake/apps/mp32mp3'
puts $LOAD_PATH
require "transl.rb"
dir = ARGV[0] || '.'
puts "Dir #{dir}"
files = Dir.glob(File.join("**", dir, "*.mp3"))
output_dir = '!converted'

files.each do |mp3_file|
	puts "Convert file #{mp3_file}"
	dir = "#{output_dir}/"+File.dirname(mp3_file)
	puts "mkdir '#{dir}'"
	`mkdir -p "#{dir}"`
	#`lame --abr 128k "#{mp3_file}" "./#{output_dir}/#{mp3_file}"`
	`cp "#{mp3_file}" "./#{output_dir}/#{mp3_file}"`
	traslite_file "./#{output_dir}/#{mp3_file}"
end
