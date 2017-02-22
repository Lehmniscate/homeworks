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
  if(number <= 2) {
    return true;
  };
  if(number % 2 == 0) {
    return false;
  };
  num2 = number / 2;
  for(var i = 3; i < num2; i += 2) {
    if(number % i == 0) {
      return false;
    }
  }
  return true;
};
//prime
console.log(isPrime(59));
console.log(isPrime(7919));
console.log(isPrime(15485863));
console.log(isPrime(982451653));
//not prime
console.log(isPrime(3548563));
console.log(isPrime(12317));

function sumOfNPrimes(n) {
  sum = 0;
  i = 0;
  num = 2;
  while(i < n) {
    if(isPrime(num)) {
      sum += num;
      i++;
    }
    num++;
  }
  return sum;
};

console.log(sumOfNPrimes(0));
console.log(sumOfNPrimes(1));
console.log(sumOfNPrimes(4));
