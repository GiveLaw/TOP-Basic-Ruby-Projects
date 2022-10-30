def shift_value(number ,shift_factor, range = (97..122))
  range.include?(number + shift_factor) ?
    number + shift_factor :
    shift_factor - (range.max - number) + range.min - 1
  # subtract 1 because when we add the value of <shift_factor-(range.max-number)>
  # to <range.min> the counting starts from the next index, which gives un one
  # index too many (example):
  # 5 - (90 - 87) + 65  => [A,B,C,...,W,X,Y,Z]
  #                                   0 1 2 3
  #                         3 4 5
  # note that we start counting from X and all goes fine until we start counting
  # again in the array, that's because the result of <5-(90-87)> is added to 65
  # <range,min>, but the count should countinue from the end of the array, and
  # not start another count from <A>
end

def caesar_cipher(string = "Nothing to see here", shift_factor = rand(26))
  string.split('').reduce('') do |accumulator, char|
    ord = char.ord

    ord.between?(65, 90) ?
      accumulator + shift_value(ord, shift_factor, (65..90)).chr :
    ord.between?(97, 122) ?
      accumulator + shift_value(ord, shift_factor, (97..122)).chr :
      accumulator + char
  end
end

print "'What a string!' -> "
puts caesar_cipher("What a string!", 5)
