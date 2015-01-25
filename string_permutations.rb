def word_permutations(word='')
  permutations = []
  chars = word.scan(/\w/)

  chars.permutation.to_a.each do |set|
    permutations << set.join
  end

  permutations.sort.join(',')
end

File.open(ARGV[0]).each_line do |line|
  puts word_permutations(line)
end

