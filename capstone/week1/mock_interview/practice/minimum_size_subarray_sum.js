"use strict"

function minSubArrayLen(target, nums) {
  let minimumSize;

  for (let anchor = 0; anchor < nums.length; anchor += 1) {
    let runner = anchor;
    let sum = 0;

    while (runner < nums.length && sum < target) {
      sum += nums[runner];
      runner += 1;
    }

    if (sum === target && (minimumSize === undefined || minimumSize > runner - anchor)) {
      minimumSize = runner - anchor;
    }
  }

  if (minimumSize === undefined) {
    return 0;
  }

  return minimumSize;
}

console.log(minSubArrayLen(7, [2, 3, 1, 2, 4, 3]));
console.log(minSubArrayLen(4, [1, 4, 4]));
console.log(minSubArrayLen(11, [1, 1, 1, 1, 1, 1, 1, 1]));