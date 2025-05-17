
class Node {
  int value;
  Node? next;

  Node(this.value);
}

Node? reverseLinkedList(Node? head) {
  Node? prev = null;
  Node? current = head;

  while (current != null) {
    final nextTemp = current.next;
    current.next = prev;
    prev = current;
    current = nextTemp;
  }

  return prev;
}

void printList(Node? head) {
  while (head != null) {
    print(head.value);
    head = head.next;
  }
}

void main() {
  final node1 = Node(5);
  final node2 = Node(10);
  final node3 = Node(15);
  node1.next = node2;
  node2.next = node3;

  final reversed = reverseLinkedList(node1);
  printList(reversed);
}
