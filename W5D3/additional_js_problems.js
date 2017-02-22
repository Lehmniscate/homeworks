function titleize(names, callback) {
  for(var i = 0; i < names.length; i++) {
    callback(names[i]);
  }
};

function printCallback(string) {
  console.log("Mx. " + string + " Jingleheimer Schmidt");
};

titleize(["Mary", "Brian", "Leo"], printCallback);

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(this.name + " the elephant goes 'phrRRRRRRRRRRR!!!!!!!'");
}

Elephant.prototype.grow = function() {
  this.height += 12;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks[this.tricks.length] = trick;
}

Elephant.prototype.play = function() {
  console.log(this.name + " is " + this.tricks[Math.floor(this.tricks.length * Math.random())]);
}

mary = new Elephant("Mary", 60, ["blowing water everywhere", "doing a handstand"]);

mary.trumpet();
mary.grow();
console.log(mary.height);
mary.addTrick("playing dead");
mary.play();
mary.play();
mary.play();
mary.play();

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

function paradeHelper(elephant) {
  console.log(elephant.name + " is trotting by!");
}

herd.forEach(paradeHelper);

function dinerBreakfast() {
  this.order = "I'd like cheesy scrambled eggs please";
}
