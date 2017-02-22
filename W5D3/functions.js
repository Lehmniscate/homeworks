function madLib(verb, adj, noun) {
  return "We shall " + verb + " the " + adj + " " + noun + ".";
};

result = madLib('make', 'best', 'guac');
console.log(result);

function isSubstring(searchString, subString) {
  return searchString.search(subString) != -1;
};

console.log(isSubstring("time to program", "time"));
console.log(isSubstring("Jump for joy", "joys"));

function fizzBuzz(array) {
  var result = [];
  for(var i = 0; i < array.length; i++) {
    if((array[i] % 3 == 0) != (array[i] % 5 == 0)) {
      result += array[i];
    };
  }
  return result;
};

console.log(fizzBuzz([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18]))

function isPrime(number) {

};

function sumOfNPrimes(n) {

};
