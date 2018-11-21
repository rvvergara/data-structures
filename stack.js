// Stack implemented using linked list as internal data structure
require './singlyLinkedList.js';

class Stack {
  constructor() {
    this.list = new LinkedList;
    this.least = null;
    this.most = null;
    this.minList = new LinkedList;
    this.maxList = new LinkedList;
    this.size = this.list.length;
  }
  push(data) {
    this.list.push(data);
    this.least === null || this.minList.head === null || data < this.least ? (this.minList.commit(data), this.least = data) : undefined;
    this.most === null || this.maxList.head === null || data > this.most ? (this.maxList.commit(data), this.most = data) : undefined;
    this.size++;
    return this;
  }
  pop() {
    const popped = this.list.pop();
    popped === this.minList.head.data ? (this.minList.reset(), this.least = this.minList.head === null ? null : this.minList.head.data) : undefined;
    popped === this.maxList.head.data ? (this.maxList.reset(), this.most = this.maxList.head === null ? null : this.maxList.head.data) : undefined;
    this.size--;
    return popped;
  }
  min() {
    return this.least;
  }
  max() {
    return this.most;
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