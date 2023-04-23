##### RB130 - Ruby Foundations: More Topics > Easy 1

---

## Enumerable Class Creation

**Problem:**  

Assume we have a `Tree` class that implements a binary tree.

```ruby
class Tree
  ...
end
```

A binary tree is just one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more. All of these collection classes include the `Enumerable` module, which means they have access to an `each` method, as well as many other iterative methods such as `map`, `reduce`, `select`, and more.  

For this exercise, modify the `Tree` class to support the methods of `Enumerable`. You do not have to actually implement any methods -- just show the methods that you must provide.

---

**My Solution:**  

In working towards a solution I think I should draw on the description of the `Enumerable` module in the Ruby documentation ([here](https://ruby-doc.org/core-2.6.3/Enumerable.html)). That description is as follows:  

The `Enumerable` mixing provides collection classes with several traversal and searching methods, and with the ability to sort. The class must provide a method `each`, which yields successive members of the collection. If `Enumerable#max`, `#min`, or `#sort` is used, the objects in the collection must also implement a meaningful `<=>` operator, as these methods rely on an ordering between members of the collection.

```ruby
class Tree
  def each
    # method implementation
  end
  
  def <=>(other)
    # method implementation
  end
end
```

---

**Launch School's Solution:**  

```ruby
class Tree
  include Enumerable
  
  def each
    ...
  end
end
```

To provide most of the functionality of the `Enumerable` module, all you need to do is include `Enumerable` in your class, and define an `each` method that yields each member of the collection, one at a time.  

