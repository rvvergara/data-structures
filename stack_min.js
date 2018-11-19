// Stack implemented using linked list as internal data structure
require './singlyLinkedList.js';

class Stack {
  constructor() {
    this.list = new LinkedList;
    this.least = null;
    this.minList = new LinkedList;
  }
  push(data) {
    this.list.push(data);
    this.least === null || this.minList.head === null || data < this.least ? (this.minList.commit(data), this.least = data) : undefined;
  }
  pop() {
    const popped = this.list.pop();
    popped === this.minList.head.data ? this.minList.reset() : undefined;
  }
  min() {
    return this.minList.head.data;
  }
}

const stack = new Stack,
  input = [3, 5, -1, -1, 2, 7, 11, -1, -1];

function do_stuff(arr) {
  let [temp, output] = [
    [], ""
  ];

  arr.forEach(v => v === -1 ? output += " " + temp.pop() : temp.push(v));

  return output;
}