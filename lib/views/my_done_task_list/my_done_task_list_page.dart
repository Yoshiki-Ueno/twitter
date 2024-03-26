// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:todo_test/common_widget/confirm_dialog.dart';
// import 'package:todo_test/common_widget/margin_sizedbox.dart';
// import 'package:todo_test/data_models/todo/todo.dart';
// import 'package:todo_test/data_models/user_data/userdata.dart';
// import 'package:todo_test/functions/global_functions.dart';

// class MyDoneTaskListPage extends StatelessWidget {
//   const MyDoneTaskListPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('完了済みの自分のタスク')),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('todos')
//               .where('isCompleted', isEqualTo: true)
//               .where('userId',
//                   isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//               .orderBy('createdAt', descending: true)
//               .snapshots(),
//           builder: (context,
//               AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//             print(snapshot);
//             if (snapshot.hasData == false) {
//               return const SizedBox.shrink();
//             }

//             final QuerySnapshot<Map<String, dynamic>> querySnapshot =
//                 snapshot.data!;

//             final List<QueryDocumentSnapshot<Map<String, dynamic>>> listData =
//                 querySnapshot.docs;

//             return ListView.builder(
//                 itemCount: listData.length,
//                 itemBuilder: (context, index) {
//                   final QueryDocumentSnapshot<Map<String, dynamic>>
//                       queryDocumentSnapshot = listData[index];

//                   Map<String, dynamic> mapData = queryDocumentSnapshot.data();
//                   Todo todo = Todo.fromJson(mapData);

//                   return Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: StreamBuilder(
//                         stream: FirebaseFirestore.instance
//                             .collection('users')
//                             .doc(todo.userId)
//                             .snapshots(),
//                         builder: (context,
//                             AsyncSnapshot<
//                                     DocumentSnapshot<Map<String, dynamic>>>
//                                 userSnapshot) {
//                           if (userSnapshot.hasData == false) {
//                             return Container();
//                           }
//                           final DocumentSnapshot<Map<String, dynamic>>
//                               documentSnapshot = userSnapshot.data!;
//                           final Map<String, dynamic> userMap =
//                               documentSnapshot.data()!;
//                           final UserData postUser = UserData.fromJson(userMap);
//                           return ListTile(
//                             leading: (postUser.imageUrl != '')
//                                 ? ClipOval(
//                                     child: Image.network(
//                                       postUser.imageUrl,
//                                       width: 50,
//                                       height: 50,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   )
//                                 :
//                                 //imageUrlが空文字だったら
//                                 ClipOval(
//                                     child: Image.asset(
//                                       'assets/images/default_user_icon.png',
//                                       width: 50,
//                                       height: 50,
//                                       fit: BoxFit.cover,
//                                     ),
//                                   ),
//                             title: Text(todo.taskName),
//                             subtitle: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     Text(postUser.userName),
//                                     MarginSizedBox.smallWidthMargin,
//                                     Text(
//                                       todo.createdAt
//                                           .toDate()
//                                           .toString()
//                                           .substring(0, 16),
//                                     ),
//                                   ],
//                                 ),
//                                 Text((todo.isCompleted) ? '完了済み' : '未完了')
//                               ],
//                             ),
//                           );
//                         }),
//                   );
//                 });
//           }),
//     );
//   }
// }