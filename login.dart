import 'dart:io' ;

void main()
{
  var users = {
    'ram' : 'sita',
    'arjun' : 'bheem',
    'allah' : 'akbar' ,
    'rohit' : 'rahim',
    'allah' : 'akbar'
  };
  print('Enter User Name:');
  String username = stdin.readLineSync();
  print('Enter Password:');

  String password = stdin.readLineSync();

  print('checking credentials...');
  sleep(const Duration(seconds:7));
  var choice ;
  while ( users[username] != password || users[username]==null) {
    print('invalid user name and password combination\n');
    print('Enter "1" to Retry or Enter any other number to Exit  ');
    choice = stdin.readLineSync();
    if (choice != '1')
      {
        print('See u again..');
        return;
      }
    print('Enter User Name');
     username = stdin.readLineSync();
    print('Enter Password');

    password = stdin.readLineSync();

    print('Checking Credentials...');
    sleep(const Duration(seconds:7));

  }
  print('login Sucessfull');


}