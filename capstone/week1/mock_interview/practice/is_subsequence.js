"use strict";

function isSubsequence(s, t) {
  if (s.length == 0) {
    return true;
  }
  
  let ptr1 = 0;
  let ptr2 = 0;

  while (ptr1 < t.length) {
    if (t[ptr1] === s[ptr2]) {
      ptr2 += 1;

      if (ptr2 === s.length) {
        return true;
      }
    }

    ptr1 += 1;
  }

  return false;
}

console.log(isSubsequence("abc", "ahbgdc"));
console.log(isSubsequence("axc", "ahbgdc"));