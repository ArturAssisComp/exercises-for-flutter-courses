import 'dart:math';
import 'dart:io';

void main(){

  final int randomNumber = Random().nextInt(100) + 1;
  print('A random number between 1 and 100 (inclusive) was generated. Try to guess it!');
  int i = 0;
  String? userInput;
  int? userGuess;
  while(true){
    stdout.write('Guess the number: ');
    userInput = stdin.readLineSync();
    userGuess = int.tryParse(userInput ?? '');
    if (userGuess == randomNumber){
      print('You found the correct answer: $userGuess');
      print('Correct guess after ${i + 1} tries.');
      return;
    }
    i++;
  }
    
}