import 'dart:math';
import 'dart:io';

const String _kTooLow = 'Too low';
const String _kTooHigh = 'Too high';
const String _kLittleLow = 'A little low';
const String _kLittleHigh = 'A little high';
const int _kBigThreshold = 50;
const int _kSmallThreshold = 50;

void main(){

  final int randomNumber = Random().nextInt(100) + 1;
  print('A random number between 1 and 100 (inclusive) was generated. Try to guess it!');
  int i = 0;
  int diff = 0;
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
    if(userGuess != null){
      diff = userGuess - randomNumber;
      if (diff >= _kBigThreshold){
        print(_kTooHigh);
      }else if (diff >= 0){
        print(_kLittleHigh);
      }else if (diff >= -_kSmallThreshold){
        print(_kLittleLow);
      }else {
        print(_kTooLow);
      }
    }
    i++;
  }
    
}