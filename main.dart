import 'dart:convert';

// void main() {
// var num = 40;
// if (num>30) {
//   print('Number is greater than 30');
// };

// int age = 16;
// if(age>18){
//   print('You can drive');
// }else{
//   print('You cant drive');
// }

// var marks = 74;
// if (marks>85) {
//   print("A Grade");
// }else if(marks>75){
//   print('B grade');
// }else{
//   print('C grade');
// }

// int a=10,b=200,c=30;
// if (a>b) {
//   if (a>c) {
//     print('A is greater');
//   }
//   else{
//     print('C is greater');
//   }
// }else if(b>c){
//   print('B is greater');
// }else{
//   print('C is greater');
// }

// int roll_no = 2201065;
// switch (roll_no) {
//   case 220100:
//     print('ABC');
//     break;
//   case 220101:
//     print('AJF');
//     break;
//   case 2201065:
//     print("Aakash");
//     break;
//   default:
//     print("no students found");
// }

// int num = 1;
// for(num;num<11;num++){
//   print(num);
// }

// var list = [1,2,3,4,5,6,7,8];
// for(int i in list){
//   print(i);
// }

// var a=1;
// while (a<11) {
//   print(a);
//   a++;
// }

// int a = 1;
// do {
//   print(a);
//   a++;
// } while (a<5);

// for (var i = 0; i < 10; i++) {
//   print(i);
// }

// var a=2;
// for (var i = 1; i <= 10; i++) {
//   print("${a}*${i}=${a*i}");
// }

// int a = 1;
// while (a < 11) {
//   print(a);
//   a++;
// }

// int a = 1;
// int b= 5;
// while (a<=4&&b<=10) {
//   print("number1:${a} and number2:${b}");
//   a++;
//   b++;
// }

// int a=1;
// do {
//   print(a);
//   a++;
// } while (a<11);

// bool check;
// check = 20>10;
// print("Value of check is ${check}");

// int mul(int a, int b) {
//   int result;
//   result = a * b;
//   return result;
// }

// var c= mul(3,4);
// print("Print multiplication of 3,4 is ${c}");

// String greeting() {
//   return 'hello';
// }

// print(greeting());

// void evenodd(int a) {
//   if (a % 2 == 0) {
//     print("Number is even");
//   } else {
//     print("Number is odd");
//   }
// }

// evenodd(40);

// var sum = (int x, int y) {
//   return x + y;
// };
// print(sum(10, 20));

// int fact(int x) {
//   if (x <= 1) {
//     return 1;
//   } else {
//     return x * fact(x - 1);
//   }
// }
// int result = fact(5);
// print(result);

// Future<int>.delayed(
//   Duration(seconds: 3),
//   () {
//     return 100;
//   },
// ).then(
//   (value) {
//     print(value);
//   },
// );
// print('waiting');

// Future<int>.delayed(
//   Duration(seconds: 3),
//   () {
//     throw 'ERROR';
//   },
// ).then(
//   (value) {
//     print(value);
//   },
// ).catchError(
//   (err) {
//     print(err);
//   },
// ).whenComplete((){
//   print('All Completed');
// });
// print('Waiting');

// Future<int> sumStream(Stream<int> stream) async {
//   var sum = 0;
//   await for (var value in stream) {
//     sum += value;
//   }
//   return sum;
// }

// final stream = Stream<int>.fromIterable([1, 2, 3, 4, 5]);
// final sum = await sumStream(stream);
// print('Sum: $sum');

// String str = '';
// for (int i = 1; i <= 4; i++) {
//   for (int j = 1; j <= i; j++) {
//     str = str + " " + j.toString();
//   }
//   str = str + "\n";
// }
// print(str);

// }
// void main() {
//   for (var i = 1; i <= 5; i++) {
//   String str = ' ';
//   for (var j = 1; j <= 5-i; j++) {
//     str += ' ';
//   }
//   for (var k = 1; k<=i; k++) {
//     str+= '$k';
//   }
//   print(str);
//   }

////////////////// String Operations //////////////////

// String str = 'Single quotes string';
// String str1 = "Double quotes string";
// String str2 = '''Multi
// line
// string''';
// print(str);
// print(str1);
// print(str2);

// int a = 10;
// int b = 20;

// print("The sum is ${a + b}");

// String s1 = 'Good';
// String s2 = 'Morning';
// print(s1 + " " + s2);

// Interpolation
// String s1 = 'Go';
// String s2 = 'Fast';
// String str = s1 + " " + s2;
// print(str);

// Methods
// String name = 'John Doe ';
// String name2 = 'John DJJJJJoe ';
// String name1 = 'John Doe ';
// int num = 10;

// print(name.toLowerCase());
// print(name.toUpperCase());
// print(name.trim());
// print(name.compareTo(name1));
// print(name2.replaceAll('J', 'j'));
// print(name.split(' '));
// print(name.substring(1,4));
// print(num.toString());
// print(num.toString().split(''));
// print(name.codeUnitAt(0));
// print(name.isEmpty);
// print(name.isNotEmpty);
// print(name.length);
// print(name.runtimeType);
// print(num.runtimeType);
// print(name.endsWith(' '));
// print(name.endsWith('c'));

/////////////////////// JSON////////////////////////////////
// var abc = {
//   'name': 'Aakash',
//   'empid': 0035,
//   'present': true,
//   'null': null,
// };
// print(abc['name']);
// print(abc['empid']);
// print(abc['present']);
// print(abc['null']);

// var x = [{
//   'name': 'Aakash',
//   'empid': 0035,
//   'present': true,
// },
// {
//   'name': 'XYZ',
//   'empid': 4012,
//   'present': false,
// }];

// print(x[0]['name']);
// print(x[1]['empid']);

// dynamic x = {
//   "song": {
//     "title": "Hey Dude",
//     "artist": "The Beatles",
//     "musicians": ["John Lennon", "Paul McCratney", "Ringo Starr"]
//   }
// };

// print(x['song']);
// print(x['song']['title']);
// print(x.toString());

// dynamic a = {
//   "employees": [
//     {"name": "Shyam", "email": "shyamjaiswal@gmail.com"},
//     {"name": "Bob", "email": "bob32@gmail.com"},
//     {"name": "Jai", "email": "jai87@gmail.com"}
//   ],
//   "students": [
//     {"name": "Aakash", "email": "aakash@setoo.co"},
//     {"name": "XYZ", "email": "xyz@setoo.co"}
//   ]
// };
// print(a['employees'][0]['name']);
// print(a['students'][0]['name']);
// print(a['students'][1]['email']);

// dynamic
//  a = {
//   "menu": {
//     "id": "file",
//     "value": "File",
//     "popup": {
//       "menuitem": [
//         {"value": "New", "onclick": "CreateDoc()"},
//         {"value": "Open", "onclick": "OpenDoc()"},
//         {"value": "Save", "onclick": "SaveDoc()"}
//       ]
//     }
//   }
// };

// // print(a["menu"]);
// // print(a["menu"]['id']);
// // print(a["menu"]['popup']);
// print(a["menu"]['popup']['menuitem'][0]);

//   dynamic x = {
//     "song": {
//       "title": "Hey Dude",
//       "artist": "The Beatles",
//       "musicians": ["John Lennon", "Paul McCratney", "Ringo Starr"]
//     }
//   };

// // String a= jsonDecode(x);
// print(x.toString());

// }

/////////////////////////// Json Parsing //////////////////////////
void main() {
  dynamic object = {
    "students": [
      {
        "id": 1,
        "name": "Alice Johnson",
        "age": 18,
        "grade": "12th",
        "percentage": 92,
        "subjects": ["Math", "Science", "English"],
        "section": "A",
        "class": "Senior",
        "attendance": "95%"
      },
      {
        "id": 2,
        "name": "Bob Smith",
        "age": 17,
        "grade": "11th",
        "percentage": 88,
        "subjects": ["History", "Math", "Biology"],
        "section": "B",
        "class": "Junior",
        "attendance": "90%"
      },
      {
        "id": 3,
        "name": "Charlie Davis",
        "age": 18,
        "grade": "12th",
        "percentage": 94,
        "subjects": ["Math", "Physics", "Chemistry"],
        "section": "A",
        "class": "Senior",
        "attendance": "98%"
      },
      {
        "id": 4,
        "name": "Diana Miller",
        "age": 16,
        "grade": "10th",
        "percentage": 89,
        "subjects": ["English", "History", "Geography"],
        "section": "C",
        "class": "Sophomore",
        "attendance": "92%"
      },
      {
        "id": 5,
        "name": "Ethan Wilson",
        "age": 17,
        "grade": "11th",
        "percentage": 85,
        "subjects": ["Biology", "Chemistry", "Math"],
        "section": "B",
        "class": "Junior",
        "attendance": "93%"
      },
      {
        "id": 6,
        "name": "Fiona Brown",
        "age": 18,
        "grade": "12th",
        "percentage": 90,
        "subjects": ["Physics", "Math", "Computer Science"],
        "section": "A",
        "class": "Senior",
        "attendance": "96%"
      },
      {
        "id": 7,
        "name": "George Clark",
        "age": 16,
        "grade": "10th",
        "percentage": 87,
        "subjects": ["Art", "English", "History"],
        "section": "C",
        "class": "Sophomore",
        "attendance": "89%"
      },
      {
        "id": 8,
        "name": "Hannah Rodriguez",
        "age": 17,
        "grade": "11th",
        "percentage": 91,
        "subjects": ["Computer Science", "Math", "Physics"],
        "section": "B",
        "class": "Junior",
        "attendance": "95%"
      },
      {
        "id": 9,
        "name": "Ian Martinez",
        "age": 16,
        "grade": "10th",
        "percentage": 93,
        "subjects": ["Geography", "Science", "English"],
        "section": "C",
        "class": "Sophomore",
        "attendance": "94%"
      },
      {
        "id": 10,
        "name": "Julia Hernandez",
        "age": 18,
        "grade": "12th",
        "percentage": 96,
        "subjects": ["Math", "Biology", "Chemistry"],
        "section": "A",
        "class": "Senior",
        "attendance": "97%"
      },
      {
        "id": 11,
        "name": "Kyle Moore",
        "age": 17,
        "grade": "11th",
        "percentage": 82,
        "subjects": ["Physics", "Chemistry", "Math"],
        "section": "B",
        "class": "Junior",
        "attendance": "88%"
      },
      {
        "id": 12,
        "name": "Liam Jackson",
        "age": 16,
        "grade": "10th",
        "percentage": 84,
        "subjects": ["History", "English", "Biology"],
        "section": "C",
        "class": "Sophomore",
        "attendance": "91%"
      },
      {
        "id": 13,
        "name": "Mia Lee",
        "age": 18,
        "grade": "12th",
        "percentage": 95,
        "subjects": ["English", "Math", "Physics"],
        "section": "A",
        "class": "Senior",
        "attendance": "99%"
      },
      {
        "id": 14,
        "name": "Noah Harris",
        "age": 17,
        "grade": "11th",
        "percentage": 86,
        "subjects": ["Chemistry", "Biology", "Math"],
        "section": "B",
        "class": "Junior",
        "attendance": "90%"
      },
      {
        "id": 15,
        "name": "Olivia Martin",
        "age": 16,
        "grade": "10th",
        "percentage": 88,
        "subjects": ["Math", "Science", "English"],
        "section": "C",
        "class": "Sophomore",
        "attendance": "93%"
      },
      {
        "id": 16,
        "name": "Peyton Thompson",
        "age": 18,
        "grade": "12th",
        "percentage": 92,
        "subjects": ["Biology", "Math", "English"],
        "section": "A",
        "class": "Senior",
        "attendance": "95%"
      },
      {
        "id": 17,
        "name": "Quinn Garcia",
        "age": 17,
        "grade": "11th",
        "percentage": 89,
        "subjects": ["History", "Physics", "Chemistry"],
        "section": "B",
        "class": "Junior",
        "attendance": "87%"
      },
      {
        "id": 18,
        "name": "Riley Wilson",
        "age": 16,
        "grade": "10th",
        "percentage": 90,
        "subjects": ["Computer Science", "Math", "Physics"],
        "section": "C",
        "class": "Sophomore",
        "attendance": "92%"
      },
      {
        "id": 19,
        "name": "Sophia Martinez",
        "age": 18,
        "grade": "12th",
        "percentage": 97,
        "subjects": ["Math", "Chemistry", "Biology"],
        "section": "A",
        "class": "Senior",
        "attendance": "98%"
      },
      {
        "id": 20,
        "name": "Tyler Evans",
        "age": 17,
        "grade": "11th",
        "percentage": 83,
        "subjects": ["English", "History", "Math"],
        "section": "B",
        "class": "Junior",
        "attendance": "89%"
      }
    ]
  };
  List<dynamic> students = object['students'];

  students.sort((a, b) => a['name'].compareTo(b['name']));
  students.forEach((student) => print(student['name']));

  students.sort(
    (a, b) => b['percentage'].compareTo(a['percentage']),
  );
  students.forEach((element) => print(element['percentage']));
  var secondHighest = students[2];
  print(
      "The student with the second highest percentage is ${secondHighest['name']}");
  // students.forEach((student) {
  //   var attend = int.parse(student['attendance'].replaceAll('%', ''));
  //   if (attend > 90) {
  //     print(student['name']);
  //   }
  // });

  // dynamic section_B =
  //     students.where((student) => student['section'] == 'B');

  // print(section_B);
  // section_B.forEach((student) {
  //   print(student['name']);
  // });

  // students.forEach((student) {
  //   if (student['subjects'] != null &&
  //       student['section'] == 'B' &&
  //       int.parse(student['attendance'].replaceAll('%', '')) > 90) {
  //     if (student['subjects'].contains('Math')) {
  //       // print(student['name']);
  //       print(
  //           "Name : ${student['name']}\n Section : ${student['section']}\n Subject : Math\n Attendance : ${student['attendance']}");
  //     }
  //   }
  // });

  //////////////////////////////////////// Day 3 ////////////////////////////////

  // var arr = [56, 1543, 2992, 495, 6];
  // var n = arr.length;
  // List<int> swap(arr, n) {
  //   for (var i = 0; i < n; i++) {
  //     for (var j = i + 1; j < n; j++) {
  //       if (arr[i]>arr[j]) {
  //         var temp = arr[i];
  //         arr[i] = arr[j];
  //         arr[j] = temp;
  //       }
  //     }
  //   }
  //   return arr;
  // }

  // print("Sorted array is ${swap(arr, n)}");

  // dynamic object1 ={
  //   'a' :53,
  //   'b' :4555,
  //   'c' :555,
  // };
  // dynamic n = object1.length;

  // List<dynamic> keys = object1.kyes.toList();
  // swap(arr, n) {
  //   for(var i = 0; i < n; i++) {
  //     for (var j = i; j < n; j++) {
  //       if(arr[i]>arr[j]){
  //         var temp = arr[i];
  //         arr[i]=arr[j];
  //         arr[j]=temp;
  //       }
  //     }
  //   }
  //   return arr;
  // }

  // print("Sorted object is $swap(object1, n)");
}
