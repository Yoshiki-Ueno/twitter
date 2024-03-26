// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:todo_test/common_widget/close_only_dialog.dart';
// import 'package:todo_test/common_widget/confirm_dialog.dart';
// import 'package:todo_test/common_widget/custom_font_size.dart';
// import 'package:todo_test/common_widget/margin_sizedbox.dart';
// import 'package:todo_test/data_models/user_data/userdata.dart';
// import 'package:todo_test/functions/global_functions.dart';
// import 'package:todo_test/views/my_page/components/blue_button.dart';
// import 'package:todo_test/views/my_page/edit_email/edit_email_page.dart';
// import 'package:todo_test/views/my_page/edit_profile/edit_profile_page.dart';

// class MyPage extends StatefulWidget {
//   const MyPage({super.key});

//   @override
//   State<MyPage> createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   @override
//   Widget build(BuildContext context) {
//     String? myUserEmail = FirebaseAuth.instance.currentUser!.email;
//     String? myUserId = FirebaseAuth.instance.currentUser!.uid;
//     print(myUserId);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('マイページ'),
//         actions: [
//           IconButton(
//             onPressed: () async {
//               await FirebaseAuth.instance.signOut();
//               print('ログアウトしたよ');
//             },
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: SizedBox(
//           width: double.infinity,
//           child: StreamBuilder(
//               stream: FirebaseFirestore.instance
//                   .collection('users')
//                   .doc(myUserId)
//                   .snapshots(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const SizedBox.shrink();
//                 }
//                 if (snapshot.hasData == false) {
//                   return const SizedBox.shrink();
//                 }
//                 final DocumentSnapshot<Map<String, dynamic>>? documentSnapshot =
//                     snapshot.data;
//                 final Map<String, dynamic> userDataMap =
//                     documentSnapshot!.data()!;
//                 final UserData userData = UserData.fromJson(userDataMap);

//                 ///List=[]
//                 ///Map={}
//                 ///DocumentSnapshot = ⭐️⭐️
//                 ///AsyncSnapshot = ⭕️⭕️
//                 ///⭕️
//                 ///⭐️
//                 ///{
//                 /// 'userName':'yoshida',
//                 /// 'imageUrl':'ここにUrlが入っている',
//                 ///}
//                 ///⭐️,
//                 ///接続情報を表すデータとか入ってるよ
//                 ///⭕️
//                 ///userData ==Map
//                 /// userData ={
//                 /// 'userName':'yoshida',
//                 /// 'imageUrl':'ここにUrlが入っている',
//                 /// }
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     if (userData.imageUrl != '')
//                       ClipOval(
//                         child: Image.network(
//                           userData.imageUrl,
//                           width: 200,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       )
//                     else
//                       //imageUrlが空文字だったら
//                       ClipOval(
//                         child: Image.asset(
//                           'assets/images/default_user_icon.png',
//                           width: 200,
//                           height: 200,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     MarginSizedBox.mediumHeightMargin,
//                     Text(
//                       userData.userName,
//                       style: CustomFontSize.mediumFontSize,
//                     ),
//                     MarginSizedBox.smallHeightMargin,
//                     Text(
//                       ///三項演算子
//                       (myUserEmail != null) ? myUserEmail : '',
//                     ),
//                     MarginSizedBox.bigHeightMargin,
//                     BlueButton(
//                       buttonText: 'メールアドレス変更',
//                       onBlueButtonPressed: () async {
//                         print('メールアドレス変更');
//                         await Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return const EditEmailPage();
//                         }));

//                         //画面がpopしてmy_pageに返ってきたときに再度処理が走る
//                         setState(() {});
//                       },
//                     ),
//                     MarginSizedBox.smallHeightMargin,
//                     BlueButton(
//                       buttonText: 'パスワード変更',
//                       onBlueButtonPressed: () async {
//                         print('パスワード変更');
//                         showConfirmDialog(
//                           context: context,
//                           onPressed: () async {
//                             try {
//                               await FirebaseAuth.instance
//                                   .sendPasswordResetEmail(email: myUserEmail!);
//                               showToast("パスワードリセット用のメールを送信しました");
//                               // ignore: use_build_context_synchronously
//                               Navigator.pop(context);
//                             } catch (e) {
//                               showCloseOnlyDialog(
//                                   context, e.toString(), 'メール送信失敗');
//                             }
//                           },
//                           text: 'パスワード再設定メールを送信しますか？',
//                         );
//                       },
//                     ),
//                     MarginSizedBox.smallHeightMargin,
//                     BlueButton(
//                       buttonText: 'プロフィール編集',
//                       onBlueButtonPressed: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) {
//                           return EditProfilePage(
//                             userName: userData.userName,
//                             imageUrl: userData.imageUrl,
//                           );
//                         }));
//                       },
//                     ),
//                   ],
//                 );
//               }),
//         ),
//       ),
//     );
//   }
// }