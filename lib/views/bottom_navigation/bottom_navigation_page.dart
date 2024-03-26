import 'package:flutter/material.dart';
import 'package:twitter/views/my_page/my_page.dart';
import 'package:twitter/views/all_list/all_list_page.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({super.key});

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int currentIndex =0;
  List children =[
      TodoAllListPage(),
      MyPage(),
    ];
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: children[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int value) {
          currentIndex = value;
          setState(() {
            
          });
        },
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:todo_test/views/my_done_task_list/my_done_task_list_page.dart';
// import 'package:todo_test/views/my_page/my_page.dart';
// import 'package:todo_test/views/todo_all_list/todo_all_list_page.dart';

// class BottomNavigationPage extends StatefulWidget {
//   const BottomNavigationPage({super.key});

//   @override
//   State<BottomNavigationPage> createState() => _BottomNavigationPageState();
// }

// class _BottomNavigationPageState extends State<BottomNavigationPage> {
//   List children = [
//     const TodoAllListPage(),
//     const MyDoneTaskListPage(),
//     const MyPage(),
//   ];
//   int currentIndex = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: children[currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (int value) {
//           currentIndex = value;
//           setState(() {});
//         },
//         currentIndex: currentIndex,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'みんな',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.check),
//             label: '完了済み',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'マイページ',
//           ),
//         ],
//       ),
//     );
//   }
// }