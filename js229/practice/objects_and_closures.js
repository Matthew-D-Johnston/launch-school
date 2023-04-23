"use strict";

function makeList() {
  let items = [];
  return {
    list() {
      if (items.length === 0) {
        console.log('The list is empty.');
      } else {
        items.forEach(item => console.log(item));
      }
    },

    add(item) {
      if (items.indexOf(item) === -1) {
        items.push(item);
        console.log(item + ' added!');
      } else {
        console.log(item + ' is already on the list.');
      }
    },

    remove(item) {
      let idx = items.indexOf(item);
      
      if (idx === -1) {
        console.log('Cannot remove item that is not on the list.');
      } else {
        items.splice(idx, 1);
        console.log(item + ' removed!');
      }
    },
  };
}

let list = makeList();

list.add('peas');
list.list();
list.add('peas');
list.add('corn');
console.log(list.items);
list.list();
list.remove('peas');
list.remove('peas');
list.list();
console.log(list.items);

