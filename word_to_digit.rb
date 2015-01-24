words = %w(zero one two three four five six seven eight nine)

File.open(ARGV[0]).each_line do |line|
  next if line.empty?
  output = ''
  line.strip.split(';').each { |word| output += words.index(word).to_s }
  puts output
end

