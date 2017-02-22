function isSubstring(searchString, subString) {
  return searchString.search(subString) != -1;
};

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));
