
void reverseList(List<int> list) {
  final stack = <int>[];
  for (var item in list) {
    stack.add(item);
  }
  while (stack.isNotEmpty) {
    print(stack.removeLast());
  }
}

void main() {
  final numbers = [10, 20, 30, 40, 50];
  reverseList(numbers);
}
