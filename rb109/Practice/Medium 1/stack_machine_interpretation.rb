# stack_machine_interpretation.rb

# write a method
# input: string of commands
# output: prints the values that correspond to the given commands

# Algorithm:
# register variable = 0
# stack array 

def minilang(commands)
  register = 0
  stack = []
  commands_arr = commands.split

  commands_arr.each do |command|
    if command.to_i.to_s == command
      register = command.to_i
    else
      case command
      when 'PUSH'
        stack << register
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
      end
    end
  end
end

minilang('PRINT')
puts '------'
minilang('5 PUSH 3 MULT PRINT')
puts '------'
minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
puts '------'
minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
puts '------'
minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
puts '------'
minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
puts '------'
minilang('-3 PUSH 5 SUB PRINT')
puts '------'
minilang('6 PUSH')
