import 'dart:io';


void main(){
  stdout.write('Enter some information: ');
  String? inputText = stdin.readLineSync();
  stdout.writeln('Information entered: $inputText');

}