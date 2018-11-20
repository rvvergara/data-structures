// Stack implemented using array as internal data structure
class Stack {
  constructor() {
    this.array = new Array;
    this.min = null;
  }
  push(data) {
    this.array.push(data);
    this.min = Math.min(...this.array);
    return this.min;
  }
  pop() {
    this.array.pop();
  }
  min() {
    return this.min;
  }
}

const inputMin = [3, 5, -1, -1, 7, 2, 11, -1, -1, 9];

function do_stuff_min(arr) {
  let [stack, output] = [new Stack, ""];
  arr.forEach(v => v === -1 ? stack.pop() : output += stack.push(v) + " ");
  return output;
}