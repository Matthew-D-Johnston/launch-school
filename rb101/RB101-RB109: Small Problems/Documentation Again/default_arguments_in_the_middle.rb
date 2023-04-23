# default_arguments_in_the_middle.rb
# Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)   # => [4, 5, 3, 6] . (Correct)

# found documentation here: https://docs.ruby-lang.org/en/trunk/syntax/calling_methods_rdoc.html , 
# under 'Default Positional Arguments'
# Also can be found here: http://ruby-doc.org/core-2.6.3/doc/syntax/calling_methods_rdoc.html 