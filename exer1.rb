def check_syntax(str)
  openables = {
    "(" => ")",
    "[" => "]",
    "{" => "}",
    "<" => ">"
  }
  open = []
  opening_chars = openables.keys
# Keys checks for what key there are in the hashes

  closing_chars = openables.values
# Values checks for the values in the defined hash

  str.each_char do |char|
# each_char takes the values as a string. And passes it into the placeholder variable char.

    if opening_chars.include?(char) # opening bracket
# This checks for a true or false... for an array
# Only for keys
      open << char
# Shovel char into the empty open array.

    elsif closing_chars.include?(char) # closing bracket
# Else, this checks for
# Only for values

      required_char = openables[open.last]

      if char == required_char # it's the right kind of closing bracket

        open.pop
# pop removes the last item in the array

      else

        if open.any? # it's the wrong kind of closing bracket
          p str
          # Added a p to show what string returned an error
          puts "* You have a syntax error: there is an unexpected #{char}"
        else # there's nothing to close
          p str
          # Added a p to show what string returned an error
          puts "* You have a syntax error: there is an unexpected #{char} where there is nothing to close."
        end

        return false

      end

    end
  end

  if open.any?
    required_char = openables[open.last]
    p str
    # Added a p to show what string returned an error
    puts "* You have a syntax error: the string ended without a closing #{required_char}"
  end

  return open.empty?
end

# Testing area



puts check_syntax("(this)[] is some text")
# true

puts "*****"
# "*****"

puts check_syntax("(this)] is some text")
#"(this)] is some text"
# * You have a syntax error: there is an unexpected ] where there is nothing to close.
# false

puts "*****"
# "*****"

puts check_syntax("[(this] is some text")
#"[(this] is some text"
#* You have a syntax error: there is an unexpected ]
#false

puts "*****"
# "*****"

puts check_syntax("[this][ is some text")
# * You have a syntax error: the string ended without a closing ]
# false

puts "*****"
# "*****"

puts check_syntax("[this] is some text")
# [this][ is some text
# * You have a syntax error: the string ended without a closing ]
# false


# Exercise 2
puts check_syntax("<html> [this] is some text</html")
# Updated the openables to include the angular brackets.
