// Tests:

// We begin by initializing our `todoList` object with a collection of `todo`
// objects using the provided Data Set.

todoSet.forEach(todoData => {
  let todo = new Todo(todoData);
  todoList.addTodo(todo);
});

// Test to see that we now have a list of `todo` objects by invoking the
// `allTodos()` method of the `todoManager`.
// Expected return value:
// [
//   Todo {
//     title: 'Buy Milk',
//     month: '1',
//     year: '2017',
//     description: 'Milk for baby',
//     completed: false,
//     id: 101
//   },
//   Todo {
//     title: 'Buy Apples',
//     month: '',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: false,
//     id: 102
//   },
//   Todo {
//     title: 'Buy chocolate',
//     month: '1',
//     year: '',
//     description: 'For the cheat day',
//     completed: false,
//     id: 103
//   },
//   Todo {
//     title: 'Buy Veggies',
//     month: '',
//     year: '',
//     description: 'For the daily fiber needs',
//     completed: false,
//     id: 104
//   }
// ]

// Test to see that each object has a unique `id`.
// To do this, we will first create an array of the `id`s of each `todo` object
let ids = todoManager.allTodos().map(todo => todo.id);
// Then, we can iterate over the ids and check to see if every id has the same
// return value for `indexOf` and `lastIndexOf` method calls on the array.
console.log(ids.every(id => ids.indexOf(id) === ids.lastIndexOf(id)));
// Expected return value:
// true

// Test to see that each `todo` object only has the specified properties:
const allowedProps = ['title', 'month', 'year', 'description', 'completed', 'id'];
console.log(todoManager.allTodos().every(todo => {
  let todoProps = Object.getOwnPropertyNames(todo);
  return todoProps.every(prop => allowedProps.includes(prop));
}));
// Expected return value:
// true

// Test to see that each `todo` object has the `isWithinMonthYear(month, year)`
// method, but that the property is not an own property.
console.log(todoManager.allTodos());
console.log(todoManager.allTodos().every(todo => {
  return typeof todo.isWithinMonthYear === 'function' && !todo.hasOwnProperty('isWithinMonthYear');
}));
// Expected return value:
// true

// Test to see that the `addTodo` method on our `todoList` object adds an object.
// Since we have made the `todos` collection private, we can use the `findTodo`
// method to verify that the `todo` object we tried to add was indeed added. This
// simultaneously checks to see that our `findTodo` method works correctly.
let todo1 = new Todo({ title: 'Buy cheese', month: '2', year: '2019', description: 'cheese for the pizza' });

let todo2 = { title: 'Buy broccoli', month: '3', year: '2019', description: 'trying to be healthy', completed: false, id: Todo.id };
todoList.addTodo(todo2);
console.log(todoList.findTodo(105));
// Expected return value:
// Todo {
//   title: 'Buy cheese',
//   month: '2',
//   year: '2019',
//   description: 'cheese for the pizza',
//   completed: false,
//   id: 105
// }

// Test `findTodo` when there is no `todo` object with the specified `id`:
console.log(todoList.findTodo(107) === undefined);
// Expected return value:
// true

// Test that `findTodo` returns a copy of the `todo` object and not the
// original object:
// For this, let's define a method that returns `true` if two objects
// have the same key-value pairs.
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
// Now create a method to see if one object is a copy of another object
// rather than the same object
function areCopies(obj1, obj2) {
  return (obj1 !== obj2) && sameKeysAndValues(obj1, obj2);
}
console.log(areCopies(todoList.findTodo(105), todo1));
// Expected return value:
// true
console.log(areCopies(todoList.findTodo(106), todo1));
// Expected return value:
// false
// `areCopies` should also return `false` when two different variables
// reference the same object:
let todo3 = todo1;
console.log(areCopies(todo1, todo3));
// Expected return value:
// false

// Test that the `deleteTodo` method on the `todoList` object removes
// the `todo` object with the specified `id` from the collection.
todoList.deleteTodo(105);
console.log(todoManager.allTodos());
// Expected return value:
// [
//   Todo {
//     title: 'Buy Milk',
//     month: '1',
//     year: '2017',
//     description: 'Milk for baby',
//     completed: false,
//     id: 101
//   },
//   Todo {
//     title: 'Buy Apples',
//     month: '',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: false,
//     id: 102
//   },
//   Todo {
//     title: 'Buy chocolate',
//     month: '1',
//     year: '',
//     description: 'For the cheat day',
//     completed: false,
//     id: 103
//   },
//   Todo {
//     title: 'Buy Veggies',
//     month: '',
//     year: '',
//     description: 'For the daily fiber needs',
//     completed: false,
//     id: 104
//   },
//   Todo {
//     title: 'Buy broccoli',
//     month: '3',
//     year: '2019',
//     description: 'trying to be healthy',
//     completed: false,
//     id: 106
//   }
// ]

// notice that the `todo` object with an `id` of 105 is no longer present in
// the collection.

// Test that the `updateTodo` method on the `todoList` object updates the
// appropriate object as intended:

todoList.updateTodo(102, { month: '1', completed: true });
console.log(todoList.findTodo(102));
// Expected return value:
// Todo {
//   title: 'Buy Apples',
//   month: '1',
//   year: '2017',
//   description: 'An apple a day keeps the doctor away',
//   completed: true,
//   id: 102
// }
// note that the `month` property now has a value of "2" and the `completed`
// property now has a value of `true`.

// Let's now test some of the other methods defined on the `todoManager` object
// Test the `completedTodos` method.
// to test let's first update one of the `todo` objects so that we will have
// two completed todos.
todoList.updateTodo(104, { month: '3', year: '2019', completed: true });
console.log(todoManager.completedTodos());
// Expected return value:
// [
//   Todo {
//     title: 'Buy Apples',
//     month: '1',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: true,
//     id: 102
//   },
//   Todo {
//     title: 'Buy Veggies',
//     month: '3',
//     year: '2019',
//     description: 'For the daily fiber needs',
//     completed: true,
//     id: 104
//   }
// ]

// Test `todosWithMonthYear` method:
console.log(todoManager.todosWithMonthYear('1', '2017'));
// Expected return value:
// [
//   Todo {
//     title: 'Buy Milk',
//     month: '1',
//     year: '2017',
//     description: 'Milk for baby',
//     completed: false,
//     id: 101
//   },
//   Todo {
//     title: 'Buy Apples',
//     month: '1',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: true,
//     id: 102
//   }
// ]

// Test `todosWithMonthYear` returns empty array when there is no `todo` object
// with the given `month` and `year` arguments:
console.log(todoManager.todosWithMonthYear('10', '2010'));
// Expected return value:
// []

// Test `completedTodosWithMonthYear`
console.log(todoManager.completedTodosWithMonthYear('1', '2017'));
// Expected return value:
// [
//   Todo {
//     title: 'Buy Apples',
//     month: '1',
//     year: '2017',
//     description: 'An apple a day keeps the doctor away',
//     completed: true,
//     id: 102
//   }
// ]
