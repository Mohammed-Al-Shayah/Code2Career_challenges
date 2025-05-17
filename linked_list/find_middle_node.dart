
class Node {
  int value;
  Node? next;

  Node(this.value);
}

Node? findMiddle(Node? head) {
  Node? slow = head;
  Node? fast = head;

  while (fast != null && fast.next != null) {
    slow = slow?.next;
    fast = fast.next?.next;
  }

  return slow;
}

void main() {
  final node1 = Node(10);
  final node2 = Node(20);
  final node3 = Node(30);
  final node4 = Node(40);
  final node5 = Node(50);

  node1.next = node2;
  node2.next = node3;
  node3.next = node4;
  node4.next = node5;

  final middle = findMiddle(node1);
  print(middle?.value); // Output: 30
}
