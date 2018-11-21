require "./stack.js"
// Array version
function do_stuff(arr, k, output = "") {
  if (arr.length === k) return Math.max(...arr)
  const arr2 = arr.slice(0, k);
  return output += Math.max(...arr2) + " " + do_stuff(arr.slice(1), k, output);
}

// Linked List version
function do_stuff_list(arr, k, output = "") {
  const stack = new Stack;
  arr.slice(0, k).forEach(v => stack.push(v));
  const next = arr.slice(1).length < k ? "" : do_stuff_list(arr.slice(1), k, output)
  return output += stack.max() + " " + next;
}

const [k, input] = [3, [1, 3, 5, 7, 9, 2]]