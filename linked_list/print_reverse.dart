
class Node {
  int value;
  Node? next;

  Node(this.value);
}

void printInReverse(Node? head) {
  if (head == null) return;
  printInReverse(head.next);
  print(head.value);
}

void main() {
  final node1 = Node(1);
  final node2 = Node(2);
  final node3 = Node(3);
  node1.next = node2;
  node2.next = node3;

  printInReverse(node1);
}
