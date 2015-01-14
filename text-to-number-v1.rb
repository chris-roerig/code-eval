class String
  alias old_to_i to_i

  def to_i
    # let the built in method handle the conversion if possible
    return old_to_i if self.old_to_i > 0 && self != '0'

    # text map
    text_as_num = {
      zero: 0, one: 1, two: 2, three: 3, four: 4, five: 5, six: 6,
      seven: 7, eight: 8, nine: 9, ten: 10, eleven: 11, twelve: 12,
      thirteen: 13, fourteen: 14, fifteen: 15, sixteen: 16, seventeen: 17,
      eighteen: 18, nineteen: 19, twenty: 20, thirty: 30, forty: 40, fifty: 50,
      sixty: 60, seventy: 70, eighty: 80, ninety: 90, hundred: 100, thousand: 1_000,
      million: 1_000_000
    }

    # definitions
    total, factors, words = 0, [], self.split(' ')

    words.each do |text|
      key   = text.to_sym

      # get the associated int val from the hash. 0 if nothing is found
      # value = text_as_num.has_key?(key) ? text_as_num[key] : 0
      value = text_as_num[key] ||= 0

      # do math based on conditions
      case key
      when /hundred|thousand|million/ # multipliers
        total *= value

        unless key == :hundred
          factors << total
          total = 0
        end
      else                            # addition
        total += value
      end 
    end

    total = factors.inject(total) { |res, el| res += el }

    total *= -1 if words.first == 'negative'

   total 
  end
end

puts 'negative three hundred fifty five million six'.to_i


#File.open(ARGV[0]).each_line do |line|
#  puts line.to_i
#end
