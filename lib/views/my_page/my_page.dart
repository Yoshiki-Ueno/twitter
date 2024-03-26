import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:twitter/common_widget/custom_font_size.dart';
import 'package:twitter/common_widget/margin_sizedbox.dart';
import 'package:twitter/data_models/user_data/userdata.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String? myUserEmail = FirebaseAuth.instance.currentUser!.email;
    final String? myUserId = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
        appBar: AppBar(
          title: const Text('プロフィール'),
          actions: [
            IconButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  print('ログアウト完了');
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text('メールアドレス変更'),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              MarginSizedBox.mediumHeightMargin,
              ListTile(
                title: Text('パスワード変更'),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              MarginSizedBox.mediumHeightMargin,
              ListTile(
                title: Text('プロフィール変更'),
                onTap: () {
                  // Do something
                  Navigator.pop(context);
                },
              ),
              MarginSizedBox.mediumHeightMargin,
              ListTile(
                title: Text('ログアウト'),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  print('ログアウト完了');
                  // Do something
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: SizedBox(
          width: double.infinity,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('users')
                  .doc(myUserId)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox.shrink();
                }

                if (snapshot.hasData == false) {
                  return const SizedBox.shrink();
                }
                final DocumentSnapshot<Map<String, dynamic>>? documentSnapshot =
                    snapshot.data;
                final Map<String, dynamic> userDataMap =
                    documentSnapshot!.data()!;
                final UserData userData = UserData.fromJson(userDataMap);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if(userData.imageUrl!='')
                    ClipOval(
                      child: Image.network(
                        userData.imageUrl,
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                    else
                    ClipOval(
                      child: Image.network(
                        'https://t3.ftcdn.net/jpg/05/53/79/60/360_F_553796090_XHrE6R9jwmBJUMo9HKl41hyHJ5gqt9oz.jpg',
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                    MarginSizedBox.mediumHeightMargin,
                    Text(
                      userData.userName, 
                      style: CustomFontSize.mediumFontSize),
                    MarginSizedBox.smallHeightMargin,

                    Text(myUserEmail ?? ''),
                    MarginSizedBox.smallHeightMargin,
                    const Text('mail'),
                  ],
                );
              }),
        ));
  }
}