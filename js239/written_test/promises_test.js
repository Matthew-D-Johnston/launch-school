// function getData() {
//   console.log("2. Getting data from internet, please wait.");
//   return new Promise(function(resolve) {
//     setTimeout(function() {
//       console.log("3. Returning data from internet.");
//       resolve([{name: "Avi"}, {name: "Grace"}]);
//     }, 3000);
//   });
// }

// async function main() {
//   console.log("1. Starting Script");
//   const data = await getData();
//   console.log(`4. Data is currently ${JSON.stringify(data)}`);
//   console.log("5. Script Ended");
// }

// main();

// const myFirstPromise = new Promise(function(resolve) {
//   setTimeout(function() {
//     resolve("Success!");
//   }, 3000);
// });

// async function main() {
//   const returnValueOfPromise = await myFirstPromise;
//   console.log("Yay! " + returnValueOfPromise);
// }

// main();


// let promise = new Promise((resolve, reject) => {
//   let a = 1 + 2;

//   if (a === 2) {
//     resolve('Success');
//   } else {
//     reject('Failed');
//   }
// });

// promise.then((message) => {
//   console.log('This is in the then ' + message);
// }).catch((message) => {
//   console.log('This is in the catch ' + message);
// });
