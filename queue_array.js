// Queue implemented using array as an internal data structure
class Queue {
  constructor() {
    this.array = new Array;
  }
  queue(data) {
    this.array.push(data);
    return this;
  }
  poll() {
    if (this.array.length === 0)
      return "Queue is empty"
    const data = this.array[0];
    this.array.shift();
    return data === undefined ? -1 : data;
  }
  peek() {
    return this.array.length === 0 ? "No data in queue" : this.array[0]
  }
}

const input = [3, 5, -1, 6, -1, -1, -1];

function do_stuff(arr) {
  let [tmp, output] = [new Queue, ""];
  arr.forEach(v => v === -1 ? output += " " + tmp.poll() : tmp.queue(v));
  return output;
}