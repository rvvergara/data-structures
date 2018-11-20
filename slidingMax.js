function do_stuff(arr, k, output = "") {
  if (arr.length === k) return Math.max(...arr)
  const arr2 = arr.slice(0, k);
  return output += Math.max(...arr2) + " " + do_stuff(arr.slice(1), k, output);
}

const [k, input] = [3, [1, 3, 5, 7, 9, 2]]