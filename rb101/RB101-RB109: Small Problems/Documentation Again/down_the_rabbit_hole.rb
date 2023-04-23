# down_the_rabbit_hole.rb

# In a very early assignment at Launch School, you are tasked with writing a
# program that loads some text messages from a YAML file. We do this with
# `YAML::load_file`:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file

# YAML Documentation: http://ruby-doc.org/stdlib-2.6.3/libdoc/yaml/rdoc/YAML.html
# ::load_file documentation: http://ruby-doc.org/stdlib-2.6.3/libdoc/psych/rdoc/Psych.html#method-c-load_file
