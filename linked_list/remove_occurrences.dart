
class Node {
  int value;
  Node? next;

  Node(this.value);
}

Node? removeAllOccurrences(Node? head, int target) {
  while (head != null && head.value == target) {
    head = head.next;
  }

  Node? current = head;
  while (current?.next != null) {
    if (current!.next!.value == target) {
      current.next = current.next!.next;
    } else {
      current = current.next;
    }
  }

  return head;
}

void printList(Node? head) {
  while (head != null) {
    print(head.value);
    head = head.next;
  }
}

void main() {
  final node1 = Node(1);
  final node2 = Node(2);
  final node3 = Node(1);
  final node4 = Node(3);
  node1.next = node2;
  node2.next = node3;
  node3.next = node4;

  final cleaned = removeAllOccurrences(node1, 1);
  printList(cleaned); // Output: 2, 3
}
