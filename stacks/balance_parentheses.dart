
bool isBalanced(String input) {
  final stack = <String>[];
  for (final char in input.split('')) {
    if (char == '(') {
      stack.add(char);
    } else if (char == ')') {
      if (stack.isEmpty) return false;
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

void main() {
  print(isBalanced("()()"));     // true
  print(isBalanced("((()))"));   // true
  print(isBalanced("(()"));      // false
  print(isBalanced("())("));     // false
}
