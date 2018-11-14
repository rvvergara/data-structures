# Tests for singly_linked_list.rb
require_relative '../singly_linked_list.rb'
RSpec.describe LinkedList do
  list = LinkedList.new

  #test initialize
  describe '#initialize' do
    it 'creates an empty linked list if passed no data' do
      expect(list.head.data).to be(nil)
      expect(list.head.next).to be(nil)
      expect(list.length).to eql(0)
    end
  end

  # test commit method
  describe "#commit" do
    it 'adds a new node to the front of the linked list' do
      list.commit("first commit")
      list.commit("third commit")
      expect(list.head.data).to eql("third commit")
      expect(list.head.next.data).to eql("first commit")
    end
  end

  # test insert method
  describe '#insert' do
    it 'inserts a new node in between two other nodes in the linked list' do
      list.insert(2, "second commit")
      expect(list.head.next.data).to eql("second commit")
    end
  end

  #test get method
  describe '#get' do
    it 'returns the data of a given depth inside the linked list' do
      expect(list.get(1)).to eql("third commit")
      expect(list.get(2)).to eql("second commit")
      expect(list.get(3)).to eql("first commit")
    end
  end

  # test push method
  describe '#push' do
    it 'adds a new node at the tail end of the linked list' do
      list.push("zeroth commit")
      expect(list.length).to eql(4)
      expect(list.get(4)).to eql("zeroth commit")
    end

    another_list = LinkedList.new

    it 'adds a node to an empty list' do
      expect(another_list.push("data").head.data).to eql("data")
    end

  end

  #test pop method
  describe '#pop' do
    it 'removes the last node of the linked list ' do
      expect(list.pop()).to eql("zeroth commit")
      expect(list.pop()).to eql("first commit")
      expect(list.pop()).to eql("second commit")
    end

    it 'removes the only node inside a 1 deep linked list' do
      expect(list.pop()).to eql("third commit")
      expect(list.length).to eql(0)
    end
  end

end
