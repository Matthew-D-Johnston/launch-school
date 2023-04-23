# JS229 - Assessment: Object Oriented JavaScript

## Todo App

### Project Requirements:

- A file, `todoApp.js`, containing code that meets the application specifications.
- Test cases that you used to check whether your application meets the specifications. It's up to you how you want to test it. You may place this code as part of your `todoApp.js` file or as a separate file if you're using a testing framework (i.e., jest).
- A zip file containing `todoApp.js`, your tests (if it's a separate file), the README.md file, and `package.json` (if using external packages). **Do not include the `node_modules` directory in the zip file or you may be unable to upload it.**

---

### Application Specifications

The application you're going to build is a todo app. The todo app has a `todoManager`. The `todoManager` is responsible for returning a set of todos from a `todoList` based on certain criteria. The `todoList` is an object that has a collection of `todo` objects. Finally, the app has a `Todo` that is responsible for creating the `todo` objects. The `todo` objects should have unique `id`s.

There are four main components:

1. `todoManager` that is responsible for returning a set of `todo` objects from a `todoList` based on specified criteria;
2. `todoList` object that has a collection of `todo` objects;
3. `todo` objects;
4. and a `Todo` for creating `todo` objects.

---

#### `todo` object

Properties:

* `id` (must be unique)
* `title` (string)
* `completed` (default value is `false`)
* `month` (string)
* `year` (string)
* `description` (string)

Shared Methods:

* `isWithinMonthYear(month, year)` (assumption: this method will return a boolean indicating whether the object on which it is called has `month` and `year` properties that match those given as arguments).

**Note:** The application does not include getting inputs from a user. As such, you may assume that the following data are available to be used as inputs:

* todo data: You will use this data for creating a single `todo` object. This is an object containing key-value pairs for `title`, `month`, `year`, and `description`; with the values always being strings.

---

#### `Todo` (`todo` object creator)

* Creates `todo`s that have unique `id`s.

Example:

```javascript
class Todo {
  constructor(title, month, year, description) {
    this.title = title;
    this.month = month;
    this.year = year;
    this.description = description;
    this.completed = false;
    this.id = Todo.id += 1;
    todoList.addTodo(this);
  }
    
  static id = 100;

	isWithinMonthYear(month, year) {
    return this.month === month && this.year === year;
  }
}
```

---

#### `todoList`

* The `todoList` is an object that has a collection of `todo` objects.
* Provides an interface for manipulating the collection of objects (i.e., adding, updating, deleting, etc.).
* Maintains the integrity of the collection by returning only a copy of the collection anytime that a method returns all or a subset of it. It does not allow users or other objects to manipulate the values of `todo` objects directly.

The `todoList` object supports the following operations:

* Maintains a collection of `todo` objects
* Adds a `todo` object to the collection
* Deletes a `todo` object from the collection
* Initializes the collection with `todo` objects
* Updates existing properties of a specific `todo` object
* Returns a specified `todo` object based on its `id` property

Example:

```javascript
let todoList = (function() {
  let todos = [];
  return {
    addTodo(todo) {
      todos.push(todo);
    },
    
    deleteTodo(id) {
      
    },
    
    updateTodo() {
      
    },
    
    findTodo(id) {
      
    },
    
    allTodos() {
      return todos.slice();
    },
  }
})();
```

Notes:

* It might be worth making the `todoList` object a static property of the `Todo` constructor.

---

#### `todoManager`

* Interfaces with the `todoList` object.
* It has methods that query the `todoList` to return all or a subset of the `todo` objects as an array of `todo` objects.

The `todoManager` can query the `todoList` object in the following ways:

* Return all `todo` objects
* Return all completed `todo` objects
* Return all `todo` objects within a given month-year combination
* Return all completed `todo` objects within a given month-year combination

Example:

```javascript
let todoList = {
  // todoList properties
};

let todoManager = {
  allTodos() {
    return todoList.allTodos();
  },
  
  completedTodos() {
    return this.allTodos().filter(todo => todo.completed);
  },
  
  todosWithMonthYear(month, year) {
    return this.allTodos().filter(todo => todo.month === month && todo.year === year);
  },
  
  completedTodosWithMonthYear(month, year) {
    return this.completedTodos().todosWithMonthYear(month, year);
  },
}
```

---

#### Testing Data

```javascript
let todoData1 = {
  title: 'Buy Milk',
  month: '1',
  year: '2017',
  description: 'Milk for baby',
};

let todoData2 = {
  title: 'Buy Apples',
  month: '',
  year: '2017',
  description: 'An apple a day keeps the doctor away',
};

let todoData3 = {
  title: 'Buy chocolate',
  month: '1',
  year: '',
  description: 'For the cheat day',
};

let todoData4 = {
  title: 'Buy Veggies',
  month: '',
  year: '',
  description: 'For the daily fiber needs',
};

let todoSet = [todoData1, todoData2, todoData3, todoData4];
```





