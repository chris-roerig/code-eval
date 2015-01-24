class Integer
  def divisible?(divisor)
    self % divisor.to_i === 0      
  end
end

def play_fizz_buzz(fizz, buzz, max)
  output = []

  1.upto max do |n|
    current_value = nil

    current_value = 'F' if n.divisible?(fizz)
    current_value = "#{current_value}B" if n.divisible?(buzz)

    current_value = n if current_value.nil?

    output << current_value
  end

  puts output.join(' ')
end

File.open(ARGV[0]).each_line do |line|
  input = line.split(' ')
  fizz, buzz, max = input.collect { |x| x.to_i }
  play_fizz_buzz(fizz, buzz, max)
end

