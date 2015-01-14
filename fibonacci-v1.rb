class Integer
  def to_fib
    fib_r(0, 1, self)
  end

  private

  def fib_r(a, b, n)
    n == 0 ? a : fib_r(b, a + b, n - 1)
  end
end

puts 7.to_fib

# File.open(ARGV[0]).each_line do |line|
#   puts line.to_i.to_fib 
# end
