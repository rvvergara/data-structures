// Stack implemented using linked list as internal data structure
require './singlyLinkedList.js';
require './stack.js'

const inputMin = [3, 5, -1, -1, 7, 2, 11, -1, -1, 9];

function do_stuff_min(arr) {
  let [stack, output] = [new Stack, ""];
  arr.forEach(v => v === -1 ? stack.pop() : (stack.push(v), output += stack.min() + " "));
  return output;
}