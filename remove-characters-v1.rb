# for codeeval
File.open(ARGV[0]).each_line do |line|
  parts = line.split ', '
  puts parts.first.gsub! /[#{parts[1]}]/, ''
end

# for testing
line = 'how are you, abc'
parts = line.split ', '
puts parts.first.gsub! /[#{parts[1]}]/, ''

