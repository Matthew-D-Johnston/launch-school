# stack_machine_interpretation.rb

# A stack is a list of values that grows and shrinks dynamically. In ruby, a
# stack is easily implemented as an Array that just uses the `#push` and `#pop`
# mehtods.

# A stack-and-register programming language is a language that uses a stack of
# values. Each operation in the language operates on a register, which can be
# thought of as the current value. The register is not part of the stack.
# Operations that require two values pop the topmost item from the stack (that
# is, the operation removes the most recently pushed value from the stack),
# perform the operation using the popped value and the register value, and then
# store the result back in the register.

# Consider a `MULT` operation in a stack-and-register language. It multiplies
# the stack value with the register value, removes the value from the stack,
# and then stores the result back in the register. Thus, if we start with a
# stack of `3 6 4` (where `4` is the topmost item in the stack), and a register
# value of `7`, then the `MULT` operation will transform things to `3 6` on the
# stack (the `4` is removed), and the result of the multiplication, `28`, is
# left in the register. If we do another `MULT` at this point, then the stack
# is transformed to `3`, and the register is left with the value `168`.

# Write a method that implements a miniature stack-and-register-based
# programming language that has the following commands:
# 1) `n` Place a value n in the "register". Do not modify the stack.
# 2) `PUSH` Push the register value on to the stack. Leave the value in the
#    register.
# 3) `ADD` Pops a value from the stack and adds it to the register value,
#    storing the result in the register.
# 4) `SUB` Pops a value from the stack and subtracts it from the register
#    value, storing the result in the register.
# 5) `MULT` Pops a value from the stack and multiplies it by the register
#    value, storing the result in the register.
# 6) `DIV` Pops a value from the stack and divides it into the register value,
#    storing the integer result in the register.
# 7) `MOD` Pops a value from the stack and divides it into the register value,
#    storing the integer remainder of the division in the register.
# 8) `POP` Remove the topmost item from the stack and place in register.
# 9) `PRINT` Print the register value.

# All operations are integer operations (which is only important with DIV and
# MOD).

# Programs will be supplied to your language method via a string passed in as
# an argument. Your program may assume that all programs are correct programs;
# that is, they won't do anything like try to pop a non-existent value from the
# stack, and they won't contain unknown tokens.

# You should initialize the register to 0.


def minilang(commands)
  command_arr = commands.split
  register = 0
  stack = []

  command_arr.each do |command|
    case command
    when 'PUSH'
      stack.push(register)
    when 'ADD'
      register += stack.pop
    when 'SUB'
      register -= stack.pop
    when 'MULT'
      register *= stack.pop
    when 'DIV'
      register /= stack.pop
    when 'MOD'
      register %= stack.pop
    when 'POP'
      register = stack.pop
    when 'PRINT'
      puts register
    else
      register = command.to_i
    end
  end
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')

puts '-------'

# Further Exploration:
# Try writing a minilang program to evaluate and print the result of this
# expression:

(3 + (4 * 5) - 7) / (5 % 3)

"3" # register = 3
"PUSH" # stack = [3]
"5" # register = 5
"MOD" # register = 2; stack = []
"PUSH" # regiser = 2; stack = [2]
"7" # register = 7; stack = [2]
"PUSH" # register = 7; stack = [2, 7]
"5" # register = 5; stack = [2, 7]
"Push" # register = 5; stack = [2, 7, 5]
"4" # register = 4; stack = [2, 7, 5]
"MULT" # register = 20; stack = [2, 7]
"PUSH" # register = 20; stack = [2, 7, 20]
"3" # register = 3; stack = [2, 7, 20]
"ADD" # register = 23; stack = [2, 7]
"SUB" # register = 16; stack = [2]
"DIV" # register = 8; stack = [0]
"PRINT" # 8

minilang("3 PUSH 5 MOD PUSH 7 PUSH 5 PUSH 4 MULT PUSH 3 ADD SUB DIV PRINT")

puts '---------'

VALID_COMMANDS = ['PUSH', 'ADD', 'SUB', 'MULT', 'DIV', 'MOD', 'POP', 'PRINT']

def valid_command?(commands)
  result = nil

  commands.each do |command|
    if command == command.to_i.to_s
      result = true
    elsif VALID_COMMANDS.include?(command)
      result = true
    else
      result = false
      break
    end
  end
  result
end

def minilang(commands)
  command_arr = commands.split
  register = 0
  stack = []
  return_value = nil
  
  if valid_command?(command_arr)
    command_arr.each do |command|
      case command
      when 'PUSH'
        stack.push(register)
      when 'ADD'
        if stack.empty? 
          return_value = "Error: Empty Stack on 'ADD' command" 
          break
        else
          register += stack.pop
        end
      when 'SUB'
        if stack.empty? 
          return_value = "Error: Empty Stack on 'SUB' command" 
          break
        else
          register -= stack.pop
        end
      when 'MULT'
        if stack.empty? 
          return_value = "Error: Empty Stack on 'MULT' command" 
          break
        else
          register *= stack.pop
        end
      when 'DIV'
        if stack.empty? 
          return_value = "Error: Empty Stack on 'DIV' command" 
          break
        elsif stack.last == 0
          return_value = "Error: cannot divide by zero on 'DIV' command"
          break
        else
          register /= stack.pop
        end
      when 'MOD'
        if stack.empty? 
          return_value = "Error: Empty Stack on 'MOD' command" 
          break
        elsif stack.last == 0
          return_value = "Error: cannot divide by zero on 'MOD' command"
          break
        else
          register %= stack.pop
        end
      when 'POP'
        if stack.empty? 
          return_value = "Error: Empty Stack on 'POP' command" 
          break
        else
          register = stack.pop
        end
      when 'PRINT'
        puts register
      else
        register = command.to_i
      end
    end
    return_value
  else
    "Error: Invalid Command"
  end
end

minilang('PRINT')
minilang('5 PUSH 3 MULT PRINT')
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
minilang('5 PUSH POP PRINT')
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
minilang('-3 PUSH 5 SUB PRINT')
minilang('6 PUSH')
minilang('6 push PRINT')
minilang('6 MULT PRINT')
minilang('0 PUSH 5 MOD PRINT')