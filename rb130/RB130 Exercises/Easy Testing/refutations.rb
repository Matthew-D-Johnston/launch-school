# refutations.rb

# Write a test that will fail if `xyz` is one of the elements in the `Array`
# `list`:

refute list.include?('xyz')
# or
refute_equal true, list.include?('xyz')
# or
refute_includes list, 'xyz'