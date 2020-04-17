import 'dart:io';
import 'dart:async';
import 'dart:convert';

adminNewCourseBranchElective() async{
  final file = File('BranchElectives.txt');
  var contents = await file.readAsString();
  var  content = contents.split(', ');

  print('Enter Branch');
  String branch=stdin.readLineSync();
  print('Enter Year');
  String year=stdin.readLineSync();

  int place;
  for(int i=0;i<content.length;i++)
    if(content[i]=='Branch:$branch')
      for(i++;i<content.length;i++)
        if(content[i]=='year:$year') {
          place = i + 1;
          break;
        }
  print('Enter new coursename ');
  String coursename=stdin.readLineSync();
  print('Enter new coursecode ');
  String coursecode=stdin.readLineSync();

  if(place == null) {
    print('wrong info');
    return;

  }
     String newfile = content[0]+', ';
     for(int i=1;i<place;i++)
       newfile = newfile + content[i] + ', ';
     newfile = newfile + coursename + ' ' + coursecode + ', ';
     for(int i=place;i<content.length;i++)

       newfile = newfile + content[i] + ', ';
     await file.writeAsString(newfile);
     print("\nNew Course Added\n");



}

adminNewCourseOpenElective() async
{
  final file = File('OpenElectives.txt');
  var contents = await file.readAsString();
  print('Enter new coursename ');
  String coursename=stdin.readLineSync();
  print('Enter new coursecode ');
  String coursecode=stdin.readLineSync();

  contents = contents + ', ' + coursename + ' ' +coursecode;

  await file.writeAsString(contents);
  print("\nNew Course Added\n");
}

studentReadCourses(String branch,String year ) async
{
  final openElectivefile = File('OpenElectives.txt');
  final branchElectivefile = File('BranchElectives.txt');
  var openElectiveContents = await openElectivefile.readAsString();
  var branchElectiveContents = await branchElectivefile.readAsString();

  print('list of Open Elective Courses:');
  var openElectiveContent = openElectiveContents.split(', ');
  for( var i = 0 ; i < openElectiveContent.length ; i++ )
    {
      print('${i+1}'+'. '+openElectiveContent[i]);
    }
  int j;
  print('\nList of Branch Electives:');
 var branchElectiveContent = branchElectiveContents.split(', ');
 for(var i = 0 ; i < branchElectiveContent.length ; i++)
   {
     if(branchElectiveContent[i]=='Branch:$branch')
       for( i++ ; i < branchElectiveContent.length-1 ; i++) {
         if (branchElectiveContent[i] == 'year:$year') {
           j = 0;
           for (j = i + 1; j < branchElectiveContent.length; j++) {
             if (branchElectiveContent[j] == 'year:${int.parse(year) + 1}' ||
                 branchElectiveContent[j] == 'end_of_branch') {
               break;
             }
             print('${j - i}' + '. ' + branchElectiveContent[j]);
           }
         }
         if(j!=null)
           break;
       }
     if(j!=null)
       break;
   }

}

main() async
{
  String course_type,user_type,course,year;
  while(true)
    {
      print('Enter the Type of User 1.Admin 2.User ');
      user_type = stdin.readLineSync();
      if(user_type != '1' && user_type !='2') {
        print('Incorect Input Re-Enter Type of User\n');
        continue;

      }
      while(user_type == '1')
        {
          print('Enter Course type 1.Open Elective 2.Branch Elective');
          course_type = stdin.readLineSync();
          if(course_type != '1' && course_type !='2')
            {
              print('Incorrect Course_type Please Re-enter');
              continue;
            }
          if(course_type == '1')
            {
              await adminNewCourseOpenElective();
            }
          if(course_type == '2')
            {
              await adminNewCourseBranchElective();
            }
          print('Do u want to add more courses? 1.yes 2.no');
          String stat = stdin.readLineSync();
          if(stat != '1')
            {
              break;
            }
        }
      if(user_type == '2')
        {
          print("Enter Branch: ");
          course = stdin.readLineSync();
          print('Enter Year:');
          year = stdin.readLineSync();
          await studentReadCourses(course,year);
        }

      print("DO u want to exit program 1.Exit");
      String exit = stdin.readLineSync();
      if(exit == '1')
        {
          print("\nBye\n");
          return;
        }
    }


}