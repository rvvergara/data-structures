class Node {
  constructor(data = null) {
    this.data = data;
    this.next = null;
  }
}

class LinkedList {
  constructor(data) {
    this.head = null;
    this.length = this.head === null ? 0 : 1;
    this.commit(data);
  }

  commit(data) {
    const newNode = new Node(data);
    this.head === null
      ? undefined
      : this.head.data === null
      ? undefined
      : (newNode.next = this.head);
    this.head = newNode;
    this.head.data === null ? undefined : this.length++;
    return this;
  }

  insert(depth, data) {
    if (depth === 1) this.commit(data), this.length--;
    else this.add_middle(this.head, depth, data);
    this.length++;
    return this;
  }

  push(data) {
    this.length === 0
      ? (this.commit(data), this.length--)
      : this.add_last(this.head, data, this.length);
    this.length++;
    return this;
  }

  pop() {
    let removed_data = this.get(this.length);
    this.remove_at(this.length);
    return removed_data;
  }

  reset() {
    this.head = this.head.next;
    this.length--;
    return this;
  }

  remove_at(depth) {
    if (depth === 1) return this.reset();
    this.length--;
    return this.delete_node(this.head, depth);
  }

  get(depth) {
    return this.nth(this.head, depth);
  }

  nth(node, depth, i = 1) {
    return i === depth ? node.data : this.nth(node.next, depth, i + 1);
  }

  add_middle(head, depth, data, i = 1) {
    const newNode = new Node(data);
    if (i === depth - 1) {
      let prevNode = head,
        nextNode = head.next;
      newNode.next = nextNode;
      prevNode.next = newNode;
    } else this.add_middle(head.next, depth, data, i + 1);
  }

  add_last(head, data, length, i = 1) {
    let newNode = new Node(data);
    if (i === length) {
      head.next = newNode;
    } else this.add_last(head.next, data, length, i + 1);
  }

  delete_node(head, depth, i = 1) {
    if (head.next === null) {
      let targetData = head.data;
      head.data = null;
      return targetData;
    }
    if (i === depth - 1) {
      let prevNode = head,
        targetNode = head.next,
        targetNodeData = targetNode.data,
        newNext = head.next.next;
      prevNode.next = newNext;
      return targetNodeData;
    } else this.delete_node(head.next, depth, i + 1);
  }
}

const list = new LinkedList();

function do_stuff(a, b, list) {
  switch (a) {
    case -9:
      list.push(b);
      break;
    case -6:
      list.get(b + 1);
      break;
    case -1:
      list.remove_at(b + 1);
      break;
    default:
      list.insert(a + 1, b);
  }
}

const tasksArr = [
    [-9, 3],
    [-9, 5],
    [-9, 7],
    [-6, 1],
    [-9, 4],
    [-6, 3],
    [-6, 0]
  ],
  completeTasks = [
    [-9, 3],
    [-9, 5],
    [1, 11],
    [2, 13],
    [-6, 1],
    [-6, 3],
    [-1, 2],
    [-1, 0],
    [-1, 1],
    [-6, 0]
  ];

tasksArr.forEach(task => do_stuff(task[0], task[1], list));
