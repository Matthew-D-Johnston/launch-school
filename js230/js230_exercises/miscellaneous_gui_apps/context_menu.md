###### JS230 — Front-end Development with JavaScript > Miscellaneous GUI Apps

---

## Context Menu for Todo List

In the previous exercise, you create a todo list application that uses a confirmation dialog when deleting a todo. Make the following changes to your solution.

#### Specifications

The program should function in the same way as the previous version except as follows:

- When the user right clicks a todo item, display a context menu.
- The context menu has three items:
  - Show Details
  - Edit Todo
  - Delete Todo
- You don't need to add functionality for *Show details* and *Edit Todo*.
- When the user clicks the *Delete Todo* option, display the confirmation dialog.

#### My Solution

###### HTML

```html
<!DOCTYPE html>
<html lang="en-US">
  <head>
    <title>Todos</title>
    <meta charset="UTF-8" />
    <link rel="stylesheet" href="context_menu.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.7/handlebars.min.js" integrity="sha512-RNLkV3d+aLtfcpEyFG8jRbnWHxUqVZozacROI4J2F1sTaDqo1dPQYs01OMi1t1w9Y2FdbSCDSQ2ZVdAC8bzgAg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="context_menu.js"></script>
  </head>
  <body>
    <h1>Todos</h1>
    <ul id="todos">
    </ul>
    <div id="dialog">
      <p>Are you sure you want to delete this todo?</p>
      <div class="button">
        <button id="yes" type="button">Yes</button><button id="no" type="button">No</button>
      </div>
    </div>
    <div id="modal"></div>
    <menu type="context" id="menu_options">
      <li id="edit">Edit Todo</li>
      <li id="details">Show Details</li>
      <li id="delete">Delete</li>
    </menu>
    <script id="todo_list" type="text/x-handlebars">
      {{#each todo}}
      {{> todo_template}}
      {{/each}}
    </script>

    <script id="todo_template" data-type="partial" type="text/x-handlebars">
      <li data-id="{{id}}">{{title}}<a href="#">x</a></li>
    </script>
  </body>
</html>

```

###### CSS

```css
@import url("whitespace-reset.css");

body {
  background: #236643;
}



h1 {
  font-size: 30px;
  color: #fff;
  margin: 40px 0 0 25px;
}

ul#todos {
  width: 600px;
  margin-left: 60px;
  margin-top: 20px;
}

ul#todos li {
  font-size: 18px;
  background: #fff;
  padding: 15px;
  margin-bottom: 20px;
  border-radius: 4px;
}

ul#todos a {
  font-family: Arial, Helvetica, sans-serif;
  font-size: 30px;
  position: relative;
  top: -8px;
  color: red;
  text-decoration: none;
  float: right;
}

#modal {
  display: none;
  z-index: 1;
  position: absolute;
  background: black;
  opacity: 30%;
  width: 100%;
  height: 100%;
  top: 0;
}

#dialog {
  display: none;
  position: absolute;
  z-index: 2;
  top: 20%;
  left: 40%;
  width: 450px;
  height: 150px;
  background: #fff;
  border-radius: 4px;
}

menu {
  display: none;
  position: fixed;
  list-style: none;
  z-index: 2;
  background: #fff;
  width: 200px;
  height: 120px;
  font-size: 18px;
  box-sizing: border-box;
  padding: 0;
  border-radius: 4px;
}

menu li {
  box-sizing: border-box;
  width: 100%;
  height: 32.7%;
  background: #CCCCCC;
  padding: 8px 0 5px 10px;
  cursor: pointer;
}

menu li:hover {
  background: #808080;
  color: #fff;
}

li#edit {
  border-radius: 4px 4px 0 0;
  margin-bottom: 1px;
}

li#delete {
  border-radius: 0 0 4px 4px;
  margin-top: 1px;
}

div > p {
  font-size: 18px;
  margin-top: 30px;
  margin-left: 20px;
}

div.button {
  float: right;
  margin-right: 15px;
  margin-top: 50px;
}

div button {
  font-size: 20px;
  font-family: 'Times New Roman', Times, serif;
  color: #fff;
  border: none;
  border-radius: 3px;
  width: 55px;
  height: 30px;
}

div button:hover {
  cursor: pointer;
}

#yes {
  background: #9F1331;
  margin-right: 5px;
}

#no {
  background: #279F36;
}
```

###### JavaScript

```javascript
"use strict";

const todoItems = [
  { id: 1, title: 'Homework' },
  { id: 2, title: 'Shopping' },
  { id: 3, title: 'Calling Mom' },
  { id: 4, title: 'Coffee with John '}
];

document.addEventListener('DOMContentLoaded', () => {
  let todoItemsCopy = createCopyOfTodoItems(todoItems);

  renderTodoList();

  document.getElementById('todos').addEventListener('click', event => {
    let target = event.target;

    if (target.tagName === 'A') {
      let todoId = Number(target.closest('li').dataset.id);

      let dialogBox = document.getElementById('dialog');
      dialogBox.style.display = 'inline-block';

      let modal = document.getElementById('modal');
      modal.style.display = 'inline-block';
      
      document.querySelector('div.button').addEventListener('click', event => {
        let target = event.target;
        
        if (target.id === 'yes') {
          todoItemsCopy = todoItemsCopy.filter(item => {
            return item.id !== todoId;
          });
          renderTodoList();
          dialogBox.style.display = 'none';
          modal.style.display = 'none';
        } else if (target.id === 'no') {
          dialogBox.style.display = 'none';
          modal.style.display = 'none';
          todoId = null;
        }
      });
    }
  });

  document.getElementById('todos').addEventListener('contextmenu', event => {
    let target = event.target;
    let menu = document.getElementById('menu_options');
    let todoId = Number(target.dataset.id);

    if (target.tagName === 'LI') {
      event.preventDefault();

      menu.style.top = `${event.clientY}px`;
      menu.style.left = `${event.clientX}px`;
      menu.style.display = 'block';
    }

    document.addEventListener('click', event => {
      let target = event.target;
      if (target.id === 'delete') {
        menu.style.display = 'none';

        let dialogBox = document.getElementById('dialog');
        dialogBox.style.display = 'inline-block';

        let modal = document.getElementById('modal');
        modal.style.display = 'inline-block';

        document.querySelector('div.button').addEventListener('click', event => {
          let target = event.target;
          
          if (target.id === 'yes') {
            todoItemsCopy = todoItemsCopy.filter(item => {
              return item.id !== todoId;
            });
            renderTodoList();
            dialogBox.style.display = 'none';
            modal.style.display = 'none';
          } else if (target.id === 'no') {
            dialogBox.style.display = 'none';
            modal.style.display = 'none';
            todoId = null;
          }
        });
      } else {
        menu.style.display = 'none';
      }
    });

  });


  function createCopyOfTodoItems(todos) {
    return todos.slice();
  }

  function renderTodoList() {
    let todoList = Handlebars.compile(document.getElementById('todo_list').innerHTML);
    let todoTemplate = Handlebars.compile(document.getElementById('todo_template').innerHTML);
    Handlebars.registerPartial('todo_template', document.getElementById('todo_template').innerHTML);

    let todoListHTML = todoList({ todo: todoItemsCopy });
    
    document.getElementById('todos').innerHTML = todoListHTML;
  }
});
```

