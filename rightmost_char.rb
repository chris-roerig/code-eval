File.open(ARGV[0]).each_line do |line|
  # remove new line chars and get the last char in the line
  last = line.chomp!()[-1]

  # remove the last char and then find the right most
  # index of the search char
  pos  = line.chomp(last).rindex(last)

  puts pos.nil? ? -1 : pos
end

