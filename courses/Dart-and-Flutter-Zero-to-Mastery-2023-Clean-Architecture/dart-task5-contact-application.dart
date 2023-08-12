import 'dart:io';

class Contact{
  final String id;
  final String name;
  final String number;

  const Contact({required this.id, required this.name, required this.number});

  @override
  String toString() {
    return '($id) $name ($number)';
  }

  Contact copyWith({String? id, String? name, String? number}){
    return Contact(id: id ?? this.id, name: name ?? this.name, number: number ?? this.number);
  }

}

class ContactOrganizer {
  final Map<String, Contact> _contacts = {};
  int _id = 0;

  void addNewContact({required String name, required String number}){
    Contact newContact = Contact(id: (_id++).toString(), name: name, number: number);
    _contacts[newContact.id] = newContact;
    print('Contact: ${newContact.toString()} added successfully!');
  }

  List<Contact> get contacts {
    List<Contact> answer = [];
    answer.addAll(_contacts.values);
    return answer;
  }

  Contact? getById(String id){
    if(_contacts.containsKey(id)) {
      return _contacts[id];
    }
    return null;
  }

  bool deleteById(String id){
    if(_contacts.containsKey(id)) {
       _contacts.remove(id);
       return true;
    }
    return false;
  }

}

void main(){
  final ContactOrganizer contactOrganizer = ContactOrganizer();
  while(true){
    print('''
          Welcome to the Contact Application!
          Choose one of the following options:
          1. Add new contact
          2. Display all contacts
          3. Delete a specific contact
          4. Exit

          '''
    );
    String? rawAnswer = stdin.readLineSync();
    if (rawAnswer != null){
      int? answer  = int.tryParse(rawAnswer);
      switch(answer){
        case 1:
          addNewContact(contactOrganizer: contactOrganizer);
          break;
        case 2:
          listAllContacts(contactOrganizer: contactOrganizer);
          break;
        case 3:
          deleteContact(contactOrganizer: contactOrganizer);
          break;
        case 4:
          print('Exit app!');
          return;
        default:
          print('Invalid input!');
          break;
      }
      print('-----------------------');
      print('\n');
      stdout.write('Press ENTER');
      stdin.readLineSync();
      print('\n\n');
    }
  }
}

void addNewContact({required ContactOrganizer contactOrganizer}){
  // add new contact
  print('Enter the information of the contact:');
  stdout.write('- Name: ');
  String? name = stdin.readLineSync();
  if (name == null){
    print('Invalid name!');
    return;
  }
  stdout.write('- Number: ');
  String? number = stdin.readLineSync();
  if (number == null){
    print('Invalid number!');
    return;
  }
  contactOrganizer.addNewContact(name: name, number: number);
}

void listAllContacts({required ContactOrganizer contactOrganizer}){
  List<Contact> allContacts = contactOrganizer.contacts;
  print('List of contacts: ');
  allContacts.forEach((element) => print(' - $element'));

}


void deleteContact({required ContactOrganizer contactOrganizer}){
  stdout.write('Enter the id to delete: ');
  String? id = stdin.readLineSync();
  if(id != null){

    final Contact? contact = contactOrganizer.getById(id);

    if(contact != null && contactOrganizer.deleteById(id)) {
      print('Contact $contact deleted successfully!');
      return;
    }
    print('Contact with id $id not found');
    return;
  }
  print('Invalid id');

}
