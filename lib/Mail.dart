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
        child: Column(
          children: [
            Text(this.no,style: TextStyle(fontSize: 35),),
            RaisedButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(' Go back!'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(




      ),
    );
  }
}
