function findHeight(arr) {
  // 0 Declare heights array that will store the heights of individual subtree (node)
  const heights = [];
  // 1 Iterate through the input array starting from last element down to first
  for (let i = arr.length - 1; i >= 0; i--) {
    // Test initial height - if element is 0 then initial height is 0, otherwise it's 1
    let initialHeight = arr[i] === 0 ? 0 : 1,
      // 3 Find index in heights array of the height of element's left child -> If left child exists then it's equal to heights.length - i - 1, otherwise it's undefined
      leftHeightIndex = arr[2 * i + 1] === undefined ? undefined : heights.length - i - 1,
      // 4 Same logic for index in heights of element's right child
      rightHeightIndex = arr[2 * i + 2] === undefined ? undefined : leftHeightIndex - 1,
      // 5 Height of element's left child is 0 if left child doesn't exist, otherwise it's heights[left_height_index]
      leftHeight = leftHeightIndex === undefined ? 0 : heights[leftHeightIndex],
      // 6 Same logic for right_height
      rightHeight = rightHeightIndex === undefined ? 0 : heights[rightHeightIndex],
      //  7 Total height is equal to initial height plus the maximum between left and right heights
      totalHeight = initialHeight + Math.max(leftHeight, rightHeight);
    // 8 Push total height to heights array
    heights.push(totalHeight);
  }
  console.log(heights[heights.length - 1]);
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

// do_stuff(inputs[0]);
// do_stuff(inputs[1]);
// do_stuff(inputs[2]);
// do_stuff(inputs[3]);
// do_stuff(inputs[4]);

// Function to log heights of inputs array
function doStuff(arr) {
  arr.forEach(v => console.log(findHeight(v)));
}

console.time("tree height computation - looping")
doStuff(inputs);
console.timeEnd("tree height computation - looping")