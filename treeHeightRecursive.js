const findHeight = (arr, i = 0) => {
  // S1 - Check if zero: If arr[index] is zero or undefined then simply return 0
  if (arr[i] === undefined || arr[i] === 0) return 0
  // S2 - Left child height: Run find_height with arr and 2*index + 1 as agruments
  const leftHeight = findHeight(arr, 2 * i + 1),
    // S3 - Right child height: Run find_height with arr and 2*index + 2 as agruments
    rightHeight = findHeight(arr, 2 * i + 2),
    // S4 Total height is 1 plus the bigger between left child height and right_child height
    totalHeight = 1 + Math.max(leftHeight, rightHeight);

  return totalHeight;
}

let inputs = [
  [2, 7, 5, 2, 6, 0, 9],
  [1, 7, 5, 2, 6, 0, 9, 3, 7, 5, 11, 0, 0, 4, 0],
  [5, 3, 2, 9, 0, 0, 7, 0, 0, 0, 0, 0, 0, 5, 0],
  [
    1,
    2,
    3,
    4,
    0,
    5,
    6,
    7,
    8,
    0,
    0,
    9,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    10,
    0,
    0,
    0,
    0,
    0,
    0
  ],
  [2, 7, 5, 2, 6, 0, 9, 0, 0, 5, 11, 0, 0, 4, 0]
];

// Function to log heights of inputs array
function doStuff(arr) {
  arr.forEach(v => console.log(findHeight(v)));
}

console.time("tree height computation - recursive")
doStuff(inputs);
console.timeEnd("tree height computation - recursive")