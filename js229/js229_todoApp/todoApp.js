"use strict";

// Todo App Code:

let Todo = (function() {
  let id = 100;
  return function(todoData) {
    this.title = todoData.title;
    this.month = todoData.month;
    this.year = todoData.year;
    this.description = todoData.description;
    this.completed = false;
    this.id = id += 1;
    Object.defineProperty(this, 'id', {
      value: id,
      writable: false,
    });
  };
})();

Todo.prototype.isWithinMonthYear = function(month, year) {
  return this.month === month && this.year === year;
};

let todoList = (function() {
  let todos;
  return {
    initialize(todoSet) {
      todos = [];
      todoSet.forEach(todo => {
        let todoObject = new Todo(todo);
        this.addTodo(todoObject);
      });
    },

    addTodo(todo) {
      if (todos) {
        todos.push(todo);
      } else {
        console.log("The todo list collection must be initialized before todos can be added.");
      } 
    },
    
    deleteTodo(id) {
      let todo = todos.filter(todo => todo.id === id)[0];
      let todoIdx = todos.indexOf(todo);
      todos.splice(todoIdx, 1);
    },
    
    updateTodo(id, propertiesObject) {
      let todo = todos.filter(todo => todo.id === id)[0];
      let props = Object.getOwnPropertyNames(propertiesObject);
      props.forEach(prop => todo[prop] = propertiesObject[prop]);
    },
    
    findTodo(id) {
      return this.allTodos().filter(todo => todo.id === id)[0];
    },

    allTodos() {
      return todos.map(todo => {
        let todoCopy = Object.create(Todo.prototype);
        return Object.assign(todoCopy, todo);
      });
    },
  };
})();

let todoManager = {
  allTodos() {
    return todoList.allTodos();
  },
  
  completedTodos() {
    return this.allTodos().filter(todo => todo.completed);
  },
  
  todosWithMonthYear(month, year) {
    return this.allTodos().filter(todo => todo.isWithinMonthYear(month, year));
  },
  
  completedTodosWithMonthYear(month, year) {
    return this.todosWithMonthYear(month, year).filter(todo => todo.completed);
  },
};

// Data Set:

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

// Tests:

// Test that our Todo constructor constructs a new `todo` object and that all
// properties and methods are accessible:
let todo = new Todo({ title: 'Buy soap', month: '4', year: '2021', description: 'need to stay squeaky clean' });
console.log(typeof todo === 'object'); // => true
console.log(todo instanceof Todo);  // => true
console.log(todo.title === 'Buy soap'); // => true
console.log(todo.month === '4'); // => true
console.log(todo.year === '2021'); // => true
console.log(todo.description === 'need to stay squeaky clean'); // => true
console.log(todo.completed === false); // => true
console.log(todo.id === 101); // => true
console.log(typeof todo.isWithinMonthYear === 'function' && !todo.hasOwnProperty('isWithinMonthYear')); // => true
console.log(todo.isWithinMonthYear('4', '2021')); // => true
console.log(todo.isWithinMonthYear('4', '2018') === false); // => true

// Test to see that the created `todo` object only has the specified properties:
const allowedProps = ['title', 'month', 'year', 'description', 'completed', 'id'];
let todoProps = Object.getOwnPropertyNames(todo);
console.log(todoProps.length === allowedProps.length && todoProps.every(prop => allowedProps.includes(prop))); // => true

// Test to see that the `todo` object has the `isWithinMonthYear(month, year)`
// method, but that the property is not an own property.
console.log(typeof todo.isWithinMonthYear === 'function' && !todo.hasOwnProperty('isWithinMonthYear'));

// Test that we cannot add an object to our todoList collection until it has been initialized:
console.log(todoList.addTodo(todo)) // => "The todo list collection must be initialized before todos can be added."

// Let's initialize our `todoList` object with a collection of `todo`
// objects using the provided `todoSet` array from the above Data Set.

todoList.initialize(todoSet);

// Test to see that we now have a list of `todo` objects by invoking the
// `allTodos()` method of the `todoManager`.
console.log(todoManager.allTodos());
// Expected return value:
// [
//   {
//     title: 'Buy Milk',
//     month: '1',
//     year: '2017',
//     description: 'Milk for baby',
//     completed: false,
//     id: 102
//   },
//   {
//     title: 'Buy Apples',
//     month: '',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: false,
//     id: 103
//   },
//   {
//     title: 'Buy chocolate',
//     month: '1',
//     year: '',
//     description: 'For the cheat day',
//     completed: false,
//     id: 104
//   },
//   {
//     title: 'Buy Veggies',
//     month: '',
//     year: '',
//     description: 'For the daily fiber needs',
//     completed: false,
//     id: 105
//   }
// ]

// Now let's try testing our `todoList.addTodo` method with our `todo` object:
todoList.addTodo(todo);
// We can check to see if it was added by also testing our `todoList.findTodo` method:
let foundTodo = todoList.findTodo(101);
console.log(foundTodo);
// Expected return value:
// {
//   title: 'Buy soap',
//   month: '4',
//   year: '2021',
//   description: 'need to stay squeaky clean',
//   completed: false,
//   id: 101
// }
console.log(typeof foundTodo === 'object'); // => true
console.log(foundTodo instanceof Todo);  // => true
console.log(foundTodo.title === 'Buy soap'); // => true
console.log(foundTodo.month === '4'); // => true
console.log(foundTodo.year === '2021'); // => true
console.log(foundTodo.description === 'need to stay squeaky clean'); // => true
console.log(foundTodo.completed === false); // => true
console.log(foundTodo.id === 101); // => true
console.log(typeof foundTodo.isWithinMonthYear === 'function' && !foundTodo.hasOwnProperty('isWithinMonthYear')); // => true
console.log(foundTodo.isWithinMonthYear('4', '2021')); // => true
console.log(foundTodo.isWithinMonthYear('4', '2018') === false); // => true

// We can verify that the returned `foundTodo` object is a copy rather than a reference
// to the original object by utilizing some newly created methods:
function sameKeysAndValues(obj1, obj2) {
  let props1 = Object.getOwnPropertyNames(obj1);
  let props2 = Object.getOwnPropertyNames(obj2);

  if (props1.length !== props2.length) {
    return false;
  }

  for (let idx = 0; idx < props1.length; idx += 1) {
    let prop = props1[idx];
    if (obj1[prop] !== obj2[prop]) {
      return false;
    }
  }

  return true;
}

function areCopies(obj1, obj2) {
  return (obj1 !== obj2) && sameKeysAndValues(obj1, obj2);
}

console.log(areCopies(todo, foundTodo)); // => true
// The `areCopies` function should return false if we pass in two variables that
// reference the same object:
let todoCopy = todo;
console.log(areCopies(todo, todoCopy) === false); // => true

// Let's also test the other `todoList` method that returns objects from the collection
// and ensure that it also only returns copies and not references to the original
// object. The only other method on the `todoList` that does that is the
// `allTodos` method. We should be able to just check one of these and assume that
// the other `todo` objects are also just copies. Let's select the object with `id`
// of 101 since we have the original `todo` object to verify it with.

let todo101 = todoList.allTodos().filter(todo => todo.id === 101)[0];
console.log(areCopies(todo, todo101)); // => true


// Test the `todoList.deleteTodo` method:
todoList.deleteTodo(101);
// if the `todo` object with `id` `101` was deleted we should not be able to find
// it with our `findTodo` method.
console.log(todoList.findTodo(101) === undefined); // => true;
// and the total length of our `todoList` collection should be equal to 4:
console.log(todoList.allTodos().length === 4); // => true

// Let's test out our `todoList.updateTodo` method by updating a few of the
// `todo` objects on our list:
let found103 = todoList.findTodo(103);
console.log(found103.month === '' && found103.completed === false); // => true
todoList.updateTodo(103, { month: '1', completed: true });
let updated103 = todoList.findTodo(103);
console.log(updated103.month === '1' && updated103.completed === true); // => true

let found104 = todoList.findTodo(104);
console.log(found104.year === ''); // => true
todoList.updateTodo(104, { year: '2019' });
let updated104 = todoList.findTodo(104);
console.log(updated104.year === '2019'); // => true

// Let's check to see if we are able to update `todo` object `id` properties. If we
// can then it would be possible to set a `todo` object's `id` to a non-unique `id`.
// For example, if we take the `todo` object with `id` 103 and try to set its `id`
// to 102, then we would have two `todo` objects with the same `id`. Our test should
// verify that an error is thrown since we have defined our `id` property
// in such a way that it is a read only property.

try {
  todoList.updateTodo(103, { id: 102 });
} catch (e) {
  if (e instanceof TypeError) {
    console.log("TypeError: Cannot assign to read only property 'id' of object '[object Object]'");
  } else {
    throw e;
  }
}
// Expected output to console:
// => "TypeError: Cannot assign to read only property 'id' of object '[object Object]'"
// And now we will double check that the `todo` object with `id` 103 still has an `id`
// of 103:
console.log(todoList.findTodo(103).id === 103); // => true

// Enough testing the updates, but let's update one more:
todoList.updateTodo(105, { month: '4', year: '2021', completed: true });

// Test to ensure that we cannot access the `todoList` collection directly through the
// `todos` variable
console.log(todoList.todos === undefined); // => true

// Let's now test the methods on our `todoManager`

// Let's test the `todoManager.allTodos` method, which should return a list of
// copies of our `todo` objects.
console.log(todoManager.allTodos());
// Expected return value:
// [
//   {
//     title: 'Buy Milk',
//     month: '1',
//     year: '2017',
//     description: 'Milk for baby',
//     completed: false,
//     id: 102
//   },
//   {
//     title: 'Buy Apples',
//     month: '1',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: true,
//     id: 103
//   },
//   {
//     title: 'Buy chocolate',
//     month: '1',
//     year: '2019',
//     description: 'For the cheat day',
//     completed: false,
//     id: 104
//   },
//   {
//     title: 'Buy Veggies',
//     month: '4',
//     year: '2021',
//     description: 'For the daily fiber needs',
//     completed: true,
//     id: 105
//   }
// ]

// Since the `todoManager.allTodos` method interfaces with the `todoList` object
// and relies on the `todoList.allTodos()` method, we can assume that the list of
// objects are also copies rather than references to the original objects.

// Let's test the `todosWithMonthYear` method:
let todosWithMonthYearList = todoManager.todosWithMonthYear('1', '2017');
console.log(todosWithMonthYearList.length === 2 && todosWithMonthYearList.every(todo => todo.month === '1' && todo.year === '2017')); // => true
// returns an empty array when no object meets the specified criteria:
let emptyArr = todoManager.todosWithMonthYear('0', '2018');
console.log(Array.isArray(emptyArr) && emptyArr.length === 0); // => true

// Let's test the `completedTodosWithMonthYear` method:
let completedTodosWithMonthYearList = todoManager.completedTodosWithMonthYear('1', '2017');
console.log(completedTodosWithMonthYearList.length === 1 && completedTodosWithMonthYearList.every(todo => todo.completed && todo.month === '1' && todo.year === '2017')); // => true
// returns an empty array when no object meets the specified criteria:
let emptyArr1 = todoManager.completedTodosWithMonthYear('10', '2016');
console.log(Array.isArray(emptyArr1) && emptyArr1.length === 0); // => true

// Let's test the `completedTodos` method:
let completedList = todoManager.completedTodos();
console.log(completedList.length === 2 && completedList.every(todo => todo.completed)); // => true
// returns an empty array when no object meets the specified criteria:
todoList.updateTodo(103, { completed: false });
todoList.updateTodo(105, { completed: false });
let emptyArr2 = todoManager.completedTodos();
console.log(Array.isArray(emptyArr2) && emptyArr2.length === 0); // => true
