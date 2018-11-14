class Tree {
  constructor(data) {
    this.data = data;
  }
}

const values = "FDJBEGKACI".split(""),
  tree = values.map(v => new Tree(v)),
  [f, d, j, b, e, g, k, a, c, i] = tree;

(f.left = d), (f.right = j);
(d.left = b), (d.right = e);
(e.left = null), (e.right = null);
(b.left = a), (b.right = c);
(a.left = null), (a.right = null);
(c.left = null), (c.right = null);
(j.left = g), (j.right = k);
(g.left = null), (g.right = i);
(k.left = null), (k.right = null);
(i.left = null), (i.right = null);

let tree2 = {
  data: "F",
  left: {
    data: "D",
    left: {
      data: "B",
      left: {
        data: "A",
        left: null,
        right: null
      },
      right: {
        data: "C",
        left: null,
        right: null
      }
    },
    right: {
      data: "E",
      left: null,
      right: null
    }
  },
  right: {
    data: "J",
    left: {
      data: "G",
      left: null,
      right: {
        data: "I",
        left: {
          data: "H",
          left: null,
          right: null
        },
        right: null
      }
    },
    right: {
      data: "K",
      left: null,
      right: null
    }
  }
};

let tree3 = {
  data: 9,
  left: {
    data: 4,
    left: {
      data: 3,
      left: null,
      right: null
    },
    right: {
      data: 6,
      left: {
        data: 5,
        left: null,
        right: null
      },
      right: {
        data: 7,
        left: null,
        right: null
      }
    }
  },
  right: {
    data: 17,
    left: {
      data: 10,
      left: null,
      right: null
    },
    right: {
      data: 22,
      left: {
        data: 20,
        left: null,
        right: null
      },
      right: null
    }
  }
};

function postorder(list) {
  let output = list.data;
  let left = list.left == null ? "" : postorder(list.left);
  let right = list.right == null ? "" : postorder(list.right);
  return left + right + output;
}

function inorder(list) {
  let output = list.data;
  let left = list.left == null ? "" : inorder(list.left);
  let right = list.right == null ? "" : inorder(list.right);
  return left + output + right;
}

function preorder(list) {
  let output = list.data;
  let left = list.left == null ? "" : preorder(list.left);
  let right = list.right == null ? "" : preorder(list.right);
  return output + left + right;
}

function bfs(node, queue = [node]) {
  if (node === undefined) return "";
  let shifted = queue.shift();
  let output = shifted.data;
  if (node.left !== null) queue.push(node.left);
  if (node.right !== null) queue.push(node.right);
  return output + bfs(queue[0], queue);
}

bfs(tree2);
