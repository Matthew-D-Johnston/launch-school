# README

## Todo App

### Assumptions:

---

#### General Assumptions:

For most methods, I generally assumed that all arguments would be expected values and of the correct data type. None of the methods verify whether the arguments are of the right data type or whether there are missing arguments. I believe this is warranted considering that "The application does not include getting inputs from a user".

---

#### `Todo`

- Made use of the pseudo-classical pattern for constructing `todo` objects with a `Todo` constructor.
- Also made use of an immediately invoked function expression so as to create a private `id` variable that would keep track of the current `todo` object `id`s. Having it private makes it inaccessbile to be changed unintentionally. 
- The `consructor` method takes an object with the following properties: `title`, `month`, `year`, and `description`. We assume that all argument objects have these properties specified.
- The `constructor` then assigns the default value of `false` to the `completed` property.
- The `constructor` method also assigns an `id` property by incrementing the private `id` variable by one and then assigning it to `this.id`. This is the only place where we change the private `id` variable and assign it to the `id` property of our `todo` objects, ensuring that each one gets a unique `id` when created. To ensure that `id` properties on individual `todo` objects cannot be changed, we use the `Object.defineProperty` method for the `id` property and set the `writable` property to `false`, thus making `id` a read only property.
- We also define an `isWithinMonthYear` method that will be shared by all `todo` objects.

---

#### `todoList`

* I took the liberty to assume that the statement, "The `todoList` object supports the following operations", does not exclude the `todoList` from supporting some other operations as well. Specifically, I wanted to add an `allTodos` method that would return copies of all the `todo` objects in the `todoList` collection, which I declare as a `todos` private variable by using an immediately invoked function expression. Having this access to copies of the `todo` objects via an `allTodos` method will make for simpler interfacing with the `todoManager`.
* I interpreted the statement, "Initializes the collection with `todo` objects", to mean that to initialize the `todos` private variable as a collection we need to invoke an `initialize` method that takes an array of any number of `todoData` objects (i.e. objects with the properties `title`, `month`, `year`, and `description`). Thus, even before being able to add `todo` objects using an `addTodo` method, we must first initialize the collection with an array of initial `todoData` objects. However, an array of just a single `todoData` object is enough to perform the initialization.
* The update method, which we've named `updateTodo`, is defined with two parameters: `id` and `props`. The `props` parameter will take an object argument with the properties that are to be updated for the `todo` object that matches the given `id` argument. We assume that the object argument does not contain any properties that do not already exist on the `todo` objects.

---

#### `todoManager`

* The methods defined on the `todoManager` were fairly straightforward. The `allTodos` method directly interfaces with the `todoList` object while the `completedTodos` and the `todosWithMonthYear` methods leverage the functionality of the `allTodos` methods and the `completedTodosWithMonthYear` method leverages the `todosWithMonthYear` method.

