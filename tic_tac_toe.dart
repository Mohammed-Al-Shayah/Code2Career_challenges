import 'dart:io';

List<List<String>> board = List.generate(3, (_) => List.filled(3, ' '));
String currentPlayer = 'X';

void main() {
  print('Welcome to Tic-Tac-Toe!');

  while (true) {
    playGame();
    print('Do you want to play again? (y/n)');
    String? response = stdin.readLineSync();
    if (response?.toLowerCase() != 'y') break;
    resetBoard();
  }
}

void playGame() {
  bool gameEnded = false;
  int moves = 0;

  while (!gameEnded) {
    printBoard();
    print("Player $currentPlayer, enter your move (1-9): ");
    String? input = stdin.readLineSync();

    if (input == null || int.tryParse(input) == null) {
      print("Invalid input. Please enter a number between 1 and 9.");
      continue;
    }

    int position = int.parse(input);
    if (position < 1 || position > 9) {
      print("Invalid position. Please enter a number between 1 and 9.");
      continue;
    }

    int row = (position - 1) ~/ 3;
    int col = (position - 1) % 3;

    if (board[row][col] != ' ') {
      print("Cell already taken. Choose another one.");
      continue;
    }

    board[row][col] = currentPlayer;
    moves++;

    if (checkWinner(row, col)) {
      printBoard();
      print("Player $currentPlayer wins!");
      gameEnded = true;
    } else if (moves == 9) {
      printBoard();
      print("It's a draw!");
      gameEnded = true;
    } else {
      currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
    }
  }
}

void printBoard() {
  print("");
  for (int i = 0; i < 3; i++) {
    print(" ${board[i][0]} | ${board[i][1]} | ${board[i][2]} ");
    if (i < 2) print("---+---+---");
  }
  print("");
}

bool checkWinner(int row, int col) {
  // Check row
  if (board[row].every((cell) => cell == currentPlayer)) return true;
  // Check column
  if (board.every((r) => r[col] == currentPlayer)) return true;
  // Check diagonals
  if (row == col && [0, 1, 2].every((i) => board[i][i] == currentPlayer))
    return true;
  if (row + col == 2 &&
      [0, 1, 2].every((i) => board[i][2 - i] == currentPlayer)) return true;

  return false;
}

void resetBoard() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j] = ' ';
    }
  }
  currentPlayer = 'X';
}
