"use strict";

// function whatIsThis() {
//   console.log(this);
// }

// let boat = {
//   log() {
//     whatIsThis();
//   }
// }

// boat.log();


let boat = {
  log() {
    console.log(this);
  }
}

boat.log();