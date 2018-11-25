function do_stuff(arr) {
  let heights = [];
  for (let i = arr.length - 1; i >= 0; i--) {
    let height = arr[i] === 0 ? 0 : 1,
      leftHt = heights[heights.length - i - 1] || 0,
      rightHt = heights[heights.length - i - 2] || 0;
    height += Math.max(leftHt, rightHt);
    heights.push(height);
  }
  return heights[heights.length - 1];
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
  ]
];

do_stuff(inputs[0]);
do_stuff(inputs[1]);
