require './singlyLinkedList.js';

class Stack {
  constructor() {
    this.list = new LinkedList;
  }
  push(data) {
    return this.list.push(data);
  }
  pop() {
    return this.list.pop();
  }
}

const stack = new Stack,
      input = [3,5,-1,-1,2,7,11,-1,-1];

function do_stuff(arr){
  let [temp, output] = [[],""];

  arr.forEach( v => v === -1 ? output += " " + temp.pop() : temp.push(v));

  return output;
}