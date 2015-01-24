1.upto 12 do |x|
  row = []
  1.upto 12 do |y|
    row << x * y
  end

  puts row.collect { |n|  n.to_s.rjust(4) }.join
end

