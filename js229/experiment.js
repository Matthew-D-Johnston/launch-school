"use strict";

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
}

let todoList = (function() {
  let todos;
  return {
    initialize(todoSet) {
      todos = [];
      todoSet.forEach(todo => {
        let todoObject = new Todo(todo);
        this.addTodo(todoObject);
      });

      console.log(todos);
    },

    addTodo(todo) {
      todos.push(todo);
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
      let todo = todos.filter(todo => todo.id === id)[0];
      let todoCopy = Object.create(Todo.prototype);
      todoCopy = Object.assign(todoCopy, todo);
      return todoCopy.id ? todoCopy : undefined;
    },
  };
})();

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

let todo1 = new Todo(todoData1);

console.log(todo1);

todo1.title = 'Buy milk';
console.log(todo1);

try {
  todo1.id = 102;
} catch (e) {
  if (e instanceof TypeError) {
    console.log("TypeError: Cannot assign to read only property 'id' of object '[object Object]'");
  } else {
    throw e;
  }
}

console.log(todo1);



// todoList.initialize(todoSet);

// console.log(todoList.findTodo(101));

