// import 'package:flutter/material.dart';
// //import 'package:google_sign_in/google_sign_in.dart';
//
//
// class Login extends StatefulWidget {
//   @override
//   _LoginState createState() => _LoginState();
// }
//
// class _LoginState extends State<Login> {
//   bool _isLoggedIn = false;
//  // GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
//
//   _login() async {
//     try {
//       await _googleSignIn.signIn();
//       setState(() {
//         _isLoggedIn = true;
//       });
//     } catch (err) {
//       print(err);
//     }
//   }
//
//   _logout() {
//   //  _googleSignIn.signOut();
//     setState(() {
//       _isLoggedIn = false;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//             child: _isLoggedIn
//                 ? Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.network(
//                         _googleSignIn.currentUser.photoUrl ,
//                         height: 50.0,
//                         width: 50.0,
//                       ),
//                       Text(_googleSignIn.currentUser.displayName),
//                       Text(_googleSignIn.currentUser.email),
//                       OutlineButton(
//                         child: Text('Logout'),
//                         onPressed: () {
//                           _logout();
//                         },
//                       )
//                     ],
//                   )
//                 : OutlineButton(
//                     child: Text('Login with Google'),
//                     onPressed: () {
//                       _login();
//                     },
//                   )),
//       ),
//     );
//   }
// }
// //
//
// //
