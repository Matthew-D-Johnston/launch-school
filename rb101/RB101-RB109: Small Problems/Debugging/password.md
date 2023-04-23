### Password

---

The following code prompts the user to set their own password if they haven't done so already, and then prompts them to login with that password. However, the program throws an error. What is the problem and how can you fix it?



Once you get the problem to run without error, does it behave as expected? Verify that you are able to log in with your new password.

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password
  puts '** Login **'
  print 'Password: '
  input = gets.chomp
  
  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password
```

---

**The Problem:**

After setting the password and then entering it in at login, the code throws out the following error message: `undefined local variable or method 'password' for main:Object (NameError)`



After inspecting the code a little more, I realized a problem with the way in which the `verify_password` method was defined: it is defined without a parameter and yet it tries to access the `password` variable, which was intialized in the outer scope; methods can only access outer scope variables that explicitly passed in as arguments.

---

**Line-by-Line Code Breakdown:**

* Line 1: the local `password` variable is initialized by assigning it to the `nil` object.
* Lines 3-7: defintion of the `set_password` method, which is not defined with a parameter:
  * Line 3: the `set_password` method definition is initialized with the `def` keyword; the method is defined without a parameter;
  * Line 4: the `puts` method is called on a string object containing the value `'What would you like your password to be?'` (this will be the prompt for the user to input a password);
  * Line 5: a local `new_password` variable is initialized and is assigned to a string object containing the value input by the user, which is retrieved by the `gets` method and which the `chomp` method has removed any carriage return characters;
  * Line 6: the outer scope variable `password` is reassigned to the string object assigned to `new_password`, so that now `password` references the user's input;
  * Line 7: the method definition is closed with the `end` keyword.
* Lines 9-19: definition of the `verify_password` method, which is defined without a parameter (this is going to be the source of the error):
  * Line 9: the definition of the `verify_password` is initialized with the `def` keyword; the method is defined without a parameter, but it should be;
  * Line 10: the `puts` method is called on a string object containing the value `'** Login **'`, which will print that value to the screen and move to the next line;
  * Line 11: the `print` method is called on a string object containing the value `'Password: '`, which will print that value to the screen and remain on the same line; this printout is the prompt for the user to enter their password;
  * Line 12: a local `input` variable is initialized with assignment to a string object with the value based on the user's input retrieved by the `gets` method and with any carriage return characters removed by the `chomp` method;
  * Lines 14-19: an `if/else` conditional statement is invoked:
    * Line 14: the `if` statement evaluates the return value of a comparison between the local variable  `input` and the outer scope variable `password` (i.e. `input == password`); the problem, however, is that the `verify_password` method has no access to `password` unless it were to be explicitly passed as an argument to the method; but that is not possible as the method was not defined with a parameter; thus, an exception will be raised at this point when the code is run;
      * Line 15: this line of code would be run if the return value of the condition following the `if` keyword were to evaluate to `true`; if that were the case, then the `puts` method would be called on a string object containing the value `'Welcome to the inside!'`.
    * Line 16: the `else` condition is invoked, which applies to all other cases for which the `if` condition does not;
      * Line 17: if the `if` condition evaluates to `false` then the `puts` method will be called on a string object containing the value `'Authentication failed.'`.
    * Line 18: the `if/else` statement is closed with the `end` keyword.
  * Line 19: the definition of the `verify_password` method is closed with the `end` keyword.
* Lines 21-23: an `if` conditional statement is invoked:
  * Line 21: the `if` conditional evaluates the return value of the condition `!password`, which will return a boolean value based on the truthiness of `password`, returning `false` if `password` is truthy and `true` if `password` is falsey; thus, if `password` is truthy, the `if` conditional will evaluate to `false` and the conditional code will not be executed, whereas if `password` is falsey, the `if` conditional will evaluate to `true` and the conditional code will be executed:
    * Line 22: if the `if` conditional statement on Line 21 evaluates to `true` then the `set_password` method will be invoked on this line, prompting the user to set their password.
  * Line 23: the `if` conditional statement is closed with the `end` keyword.
* Line 25: the `verify_password` method is invoked.

---

**Modified Code:**

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  password = new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp
  
  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  set_password
end

verify_password(password)
```

The above code fixes the problem of the program throwing out an error, however, it does not behave as expected. When verifying the password, the program prints `'Authentication failed.'` even when the correct password was input.



The error occurs because the `set_password` method only sets its own local `password` variable to the user's input, but because it does not have access to the outer scope variables unless they are explicitly passed to it, it will not modify the outer scope `password` variable; thus, `password` is still referencing `nil` from its initialization on the very first line, which is why the authentication keeps failing.



To fix this problem, we need to explicitly set `password` to the user's input by reassigning `password` to the string object returned by the `set_password` method. The following code will do that:

```ruby
password = nil

def set_password
  puts 'What would you like your password to be?'
  new_password = gets.chomp
  new_password
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)
```

---

**Launch School Solution:**

Same as mine.

