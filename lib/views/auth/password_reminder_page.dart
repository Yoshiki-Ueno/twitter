import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PassWordReminderPage extends StatelessWidget {
  const PassWordReminderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('パスワード再設定'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextFormField(
                controller: emailController,
                validator: (value) {
                  if (value == null || value == '') {
                    return '未入力です';
                  }
                  return null;
                },
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                    print("パスワードリセット用のメールを送信しました");
                  } catch (e) {
                    print(e);
                  }
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Text('パスワード再設定メールを送信する'),
              ),
            )
          ],
        ),
      ),
    );
  }
}




// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:todo_test/common_widget/margin_sizedbox.dart';

// class PassWordReminderPage extends StatelessWidget {
//   const PassWordReminderPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//     final TextEditingController emailController = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('パスワード再設定'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 validator: (value) {
//                   if (value == null || value == '') {
//                     return '未入力ですよ';
//                   }
//                   return null;
//                 },
//               ),
//               MarginSizedBox.bigHeightMargin,
//               ElevatedButton(
//                 onPressed: () async {
//                   if (formKey.currentState!.validate()) {
//                     //成功
//                     try {
//                       await FirebaseAuth.instance
//                           .sendPasswordResetEmail(email: emailController.text);
//                       print("パスワードリセット用のメールを送信しました");
//                     } catch (e) {
//                       print(e);
//                     }
//                   }
//                 },
//                 child: const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 16.0),
//                   child: Text('パスワード再設定メールを送信する'),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }