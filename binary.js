class BinaryTree {
  constructor(data) {
    this.data = data;
    this.left = null;
    this.right = null;
  }
  addLeft(data) {
    this.left = data instanceof BinaryTree ? data : new BinaryTree(data);
    return this;
  }
  addRight(data) {
    this.right = data instanceof BinaryTree ? data : new BinaryTree(data);
    return this;
  }
  postOrder() {
    let output = this.data;
    let left = this.left == null ? "" : this.left.postOrder();
    let right = this.right == null ? "" : this.right.postOrder();
    return left + right + output;
  }
  inOrder() {
    let output = this.data;
    let left = this.left == null ? "" : this.left.inOrder();
    let right = this.right == null ? "" : this.right.inOrder();
    return left + output + right;
  }
  preOrder() {
    let output = this.data;
    let left = this.left == null ? "" : this.left.preOrder();
    let right = this.right == null ? "" : this.right.preOrder();
    return output + left + right;
  }
  breadthFirst() {
    return this.bfs(this);
  }
  bfs(node, queue = [node]) {
    if (node === undefined) return "";
    let shifted = queue.shift();
    let output = shifted.data;
    if (node.left !== null) queue.push(node.left);
    if (node.right !== null) queue.push(node.right);
    return output + this.bfs(queue[0], queue);
  }
  height() {
    let leftHeight = this.left === null ? 0 : this.left.height(),
      rightHeight = this.right === null ? 0 : this.right.height();
    return 1 + Math.max(leftHeight, rightHeight);
  }
}

const values = "FDJBEGKACIH".split(""),
  tree = values.map(v => new BinaryTree(v)),
  [f, d, j, b, e, g, k, a, c, i, h] = tree;

f.addLeft(d).addRight(j);
d.addLeft(b).addRight(e);
b.addLeft(a).addRight(c);
j.addLeft(g).addRight(k);
g.addRight(i);
i.addLeft(h);

const tree1 = f;

console.log("Breadth-First: ", f.breadthFirst());
console.log("Pre-Order: ", f.preOrder());
console.log("In-Order: ", f.inOrder());
console.log("Post-Order: ", f.postOrder());
