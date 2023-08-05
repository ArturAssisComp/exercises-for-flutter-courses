import 'dart:io';


void main(){

  stdout.write('Enter an integer greater or equal to 0: ');
  String? userInput = stdin.readLineSync();

  if (userInput == null){
    print('No input received.');
  }else{
    int? userInputNumber = int.tryParse(userInput);
    if (userInputNumber == null){
      print('Invalid input ($userInput). It should be an integer');
    }else{
      if(userInputNumber < 0){
        print('Invalid input ($userInputNumber). It must be greater or equal to 0.');
      }else{
        int factorialResult = factorial(userInputNumber);
        print('The result is $factorialResult');
      }
    }
  }

}

int factorial(int n){
  int result = 1;
  while (n > 1){
    result *= n--;
  }
  return result;
}
