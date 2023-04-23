##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Encrypted Pioneers

**Problem:**  

The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. The names are in an encrypted form, though, using a simple (and incredibly weak) form of encryption called [Rot13](https://en.wikipedia.org/wiki/ROT13).

```
Nqn Ybirynpr
Tenpr Ubccre
Nqryr Tbyqfgvar
Nyna Ghevat
Puneyrf Onoontr
Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv
Wbua Ngnanfbss
Ybvf Unvog
Pynhqr Funaaba
Fgrir Wbof
Ovyy Tngrf
Gvz Orearef-Yrr
Fgrir Jbmavnx
Xbaenq Mhfr
Fve Nagbal Ubner
Zneiva Zvafxl
Lhxvuveb Zngfhzbgb
Unllvz Fybavzfxv
Tregehqr Oynapu
```

Write a program that deciphers and prints each of these names.  

Here is a description of Rot13 from Wikipedia:  

**ROT13** ("**rotate by 13 places**", somtimes hyphenated **ROT-13**) is a simple letter substitution cipher that replaces a letter with the 13th letter after it, in the alphabet. ROT13 is a special case of the Caesar cipher which was developed in ancient Rome.  

Because there are 26 letters (2x13) in the basic Latin alphabet, ROT13 is its own inverse; that is, to undo ROT13, the same algorithm is applied, so that the same action can be used for encoding and decoding. The algorithm provides virtually no cryptographic security, and is often cited as a canonical example of weak encryption.

---

**Examples / Test Cases:**  

```ruby
decipher("Uryyb") == "Hello"
decipher("Znggurj") == "Matthew"
```

---

**Data Structure:**  

**_Inputs_**

* The input to our `decipher` method will be a String object.
* However, to decipher and print each of the given names, we can run the `each` method over an Array object containing the list of names, and for each element print the return value of the `decipher` method call on each element.

**_Outputs_**

* The `decipher` method will output a String-object deciphered representation of the given name.
* Iterating over the list of names will produce a print out of the deciphered names.

**_Rules_**

* Maintain the correct capitalization of the first character.

---

**Algorithm:**  

* We should start with some kind of constant variable associated with the encryption algorithm, such as: `CHAR_INVERSE = { 'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r',
                       'f' => 's', 'g' => 'g', 'h' => 'u', 'i' => 'v', 'j' => 'w',
                   	 'k' => 'w', 'l' => 'y', 'm' => 'z', 'n' => 'a', 'o' => 'b',
                   	 'p' => 'c', 'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
                   	 'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k', 'y' => 'l',
                   	 'z' => 'm' }`
* The we begin by initializing the method definition: `def decipher(string)`
* Next, we are going to want to iterate over each character of the given string, and substituting that character with its corresponding ROT13 inverse. To iterate we can use the `each_char` method.
* We can create a `deciphered` variable that is assigned to an empty String object, `''`.
* Within the iterating loop, we can extract the inverse of each character and add it to the new string object.
* Note that we will have to treat capitalized and uncapitalized letters differently. We may want to introduce an `if/else` conditional statement to treat the two cases separately.



---

**Code:** 

```ruby
CHAR_INVERSE = { 'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q', 'e' => 'r',
                 'f' => 's', 'g' => 't', 'h' => 'u', 'i' => 'v', 'j' => 'w',
                 'k' => 'w', 'l' => 'y', 'm' => 'z', 'n' => 'a', 'o' => 'b',
                 'p' => 'c', 'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
                 'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k', 'y' => 'l',
                 'z' => 'm' }

def decipher(string)
  deciphered = ''

  string.each_char do |char|
    if char.match?(/[^a-z]/i)
      deciphered << char
    elsif char == char.downcase
      deciphered << CHAR_INVERSE[char]
    else
      deciphered << CHAR_INVERSE[char.downcase].upcase
    end
  end

  deciphered
end

names = ["Nqn Ybirynpr", "Tenpr Ubccre", "Nqryr Tbyqfgvar", "Nyna Ghevat",
         "Puneyrf Onoontr", "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
         "Wbua Ngnanfbss", "Ybvf Unvog", "Pynhqr Funaaba", "Fgrir Wbof",
         "Ovyy Tngrf", "Gvz Orearef-Yrr", "Fgrir Jbmavnx", "Xbaenq Mhfr",
         "Fve Nagbal Ubner", "Zneiva Zvafxl", "Lhxvuveb Zngfhzbgb",
         "Unllvz Fybavzfxv", "Tregehqr Oynapu"
        ] 

names.each { |name| puts decipher(name) }
```

---

**Launch School's Solution:**  

```ruby
ENCRYPTED_PIONEERS = [
  'Nqn Ybirynpr',
  'Tenpr Ubccre',
  'Nqryr Tbyqfgvar',
  'Nyna Ghevat',
  'Puneyrf Onoontr',
  'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
  'Wbua Ngnanfbss',
  'Ybvf Unvog',
  'Pynhqr Funaaba',
  'Fgrir Wbof',
  'Ovyy Tngrf',
  'Gvz Orearef-Yrr',
  'Fgrir Jbmavnx',
  'Xbaenq Mhfr',
  'Fve Nagbal Ubner',
  'Zneiva Zvafxl',
  'Lhxvuveb Zngfhzbgb',
  'Unllvz Fybavzfxv',
  'Tregehqr Oynapu'
].freeze

def rot13(encrypted_text)
  encrypted_text.each_char.reduce('') do |result, encrypted_char|
    result + decipher_character(encrypted_char)
  end
end

def decipher_character(encrypted_char)
  case encrypted_char
  when 'a'..'m', 'A'..'M' then (encrypted_char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (encrypted_char.ord - 13).chr
  else													encrypted_char
  end
end
    
ENCRYPTED_PIONEERS.each do |encrypted_name|
	puts rot13(encrypted_name)
end
```

