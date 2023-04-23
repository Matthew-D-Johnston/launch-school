"use strict"

function lengthOfLongestSubstring(str) {
  let anchor = 0;
  let runner = 0;
  let charIndexes = {};
  let longest = 0;

  while (runner < str.length) {
    let currentChar = str[runner]
    if (charIndexes[currentChar] !== undefined && charIndexes[currentChar] >= anchor) {
      let length = runner - anchor;
      if (length > longest) {
        longest = length;
      }
      anchor = charIndexes[currentChar] + 1;
    } else if (runner === str.length - 1) {
      let length = (runner + 1) - anchor;
      if (length > longest) {
        longest = length;
      }
    }
    charIndexes[currentChar] = runner;
    runner += 1;
  }

  return longest;
}

console.log(lengthOfLongestSubstring("abcabcbb"));
console.log(lengthOfLongestSubstring("bbbbb"));
console.log(lengthOfLongestSubstring("pwwkew"));
console.log(lengthOfLongestSubstring("pwwkef"));
console.log(lengthOfLongestSubstring("tmmzuxt"));
