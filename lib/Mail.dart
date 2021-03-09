import 'package:flutter/material.dart';

class Mail extends StatelessWidget {

  String no;

  Mail(this.no);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mail Route"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: RaisedButton(
          color: Colors.red,
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(this.no+ ' Go back!'),
        ),
      ),
      floatingActionButton: FloatingActionButton(




      ),
    );
  }
}
