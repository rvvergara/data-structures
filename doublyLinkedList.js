// Linked List wherein each node has reference to its previous node and next node

class LinkedList {
  constructor(data = null) {
    this.prev = null;
    this.data = data;
    this.next = null;
    this.length = this.data === null ? 0 : 1;
  }

  add_one(data) {
    this.data === null ?
      (this.data = data) :
      this.next === null ?
      ((this.next = new LinkedList(data)), (this.next.prev = this)) :
      this.next.add_one(data);
    this.length++;
    return this;
  }

  add(index, data, i = 0) {
    let newNode = new LinkedList(this.data);
    newNode.prev = this;
    i === index ?
      ((this.next = newNode), (this.data = data)) :
      this.next.add(index, data, i + 1);
    this.length++;
    return this;
  }

  get(index, i = 0) {
    return i === index ? this.data : this.next.get(index, i + 1);
  }

  remove(index, i = 0) {
    i === index ?
      this.prev === null ?
      this.next === null ?
      (this.data = null) :
      ((this.data = this.next.data), (this.next = this.next.next)) :
      (this.prev.next = this.next) :
      this.next.remove(index, i + 1);
    this.length > 0 ? this.length-- : (this.length = 0);
    return this;
  }
}