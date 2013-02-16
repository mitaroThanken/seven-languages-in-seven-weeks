# coding: utf-8

rp = Regexp.new( ARGV.shift ) if ARGV.length > 0

while line = ARGF.gets
  puts("#{ARGF.filename}: #{ARGF.file.lineno}: #{line}") if rp === line
end

