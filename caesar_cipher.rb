def shift_code(code, shift)
  # if uppercase
  if code >= 65 && code < 91
    ((code + shift - 65) % 26) + 65
  # else if lowercase
  elsif code >= 97 && code < 123
    ((code + shift - 97) % 26) + 97
  else
    code
  end
end

def caesar_cipher(message, shift)
  # get array of codes
  char_codes = message.codepoints
  # shift the ascii code and transform in string again
  char_codes.reduce("") do |acc, code|
    acc + shift_code(code, shift).chr
  end
end


# TESTS
p caesar_cipher("What a string!", 5) == "Bmfy f xywnsl!"
p caesar_cipher("A", 1) == "B"
p caesar_cipher("Aaa", 1) == "Bbb"
p caesar_cipher("Hello, World!", 5) == "Mjqqt, Btwqi!"
p caesar_cipher("Mjqqt, Btwqi!", -5) == "Hello, World!"
p caesar_cipher("Z", 1) == "A"
p caesar_cipher("Hello, World!", 75) == "Ebiil, Tloia!"
p caesar_cipher("Hello, World!", -29) == "Ebiil, Tloia!"