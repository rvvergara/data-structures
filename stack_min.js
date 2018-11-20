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
    return this.least;
  }
  pop() {
    const popped = this.list.pop();
    popped === this.minList.head.data ? (this.minList.reset(), this.least = this.minList.head === null ? null : this.minList.head.data) : undefined;
  }
  min() {
    return this.minList.head.data;
  }
}

const inputMin = [3, 5, -1, -1, 7, 2, 11, -1, -1, 9];

function do_stuff_min(arr) {
  let [stack, output] = [new Stack, ""];
  arr.forEach(v => v === -1 ? stack.pop() : output += stack.push(v) + " ");
  return output;
}