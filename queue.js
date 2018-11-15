// Queue implemented using linked list as internal data structure
require './singlyLinkedList.js';

class Queue {
  constructor() {
    this.list = new LinkedList;
  }
  push(data) {
    this.list.push(data);
    return data;
  }
  poll() {
    const data = this.list.head.data;
    this.list.reset();
    return data;
  }
}

const stack = new Stack,
  input = [3, 5, -1, -1, 2, 7, 11, -1, -1];

function do_stuff(arr) {
  let [temp, output] = [
    [], ""
  ];

  arr.forEach(v => v === -1 ? output += " " + temp.poll() : temp.push(v));

  return output;
}