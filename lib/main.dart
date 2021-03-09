import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Mail.dart';
import 'db/Database.dart';
import 'form/EditDialog.dart';

void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => MyApp(), // Login()
      // When navigating to the "/second" route, build the SecondScreen widget.
      //'/mail': (context) => Mail(),
    },
  ));
}

class MyApp extends StatelessWidget {
  static final Firestore _db = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    final title = 'Global message';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.green,
        ),
        body: _getTasks(),
        //
        // GridView.count(
        //   crossAxisCount: 2, reverse: true,
        //   // Generate 100 widgets that display their index in the List.
        //   children: List.generate(105, (index) {
        //     return Center(
        //       child: Column(
        //         children: [
        //
        //           index.isEven
        //               ? Text(
        //                   'Profile',
        //                   style: Theme.of(context).textTheme.headline6,
        //                 )
        //               : Text(
        //                   'mail',
        //                   style: Theme.of(context).textTheme.headline6,
        //                 ),
        //           RaisedButton(
        //               color: index.isEven ? Colors.green : Colors.red,
        //               child: index.isEven
        //                   ? Icon(
        //                       Icons.person,
        //                       color: Colors.white,
        //                     )
        //                   : Icon(
        //                       Icons.send,
        //                       color: Colors.white,
        //                     ),
        //               onPressed: () {
        //                 index.isEven
        //                     ? Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => Profile('$index')),
        //                       )
        //                     : Navigator.push(
        //                         context,
        //                         MaterialPageRoute(
        //                             builder: (context) => Mail('$index')),
        //                       );
        //               }),
        //         ],
        //       ),
        //     );
        //   }),
        // ),
        drawer: Drawer(
          child: Column(
            children: [
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
              Text('rakib'),
            ],
          ),
        ),

        /*drawer: Drawer(
          child: GridView.count(
            crossAxisCount: 2, reverse: true,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(105, (index) {
              return Center(
                child: Column(
                  children: [
                    index.isEven
                        ? Text(
                            'Profile',
                            style: Theme.of(context).textTheme.headline6,
                          )
                        : Text(
                            'mail',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                    RaisedButton(
                        color: index.isEven ? Colors.green : Colors.red,
                        child: index.isEven
                            ? Icon(
                                Icons.person,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          index.isEven
                              ? Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile('$index')),
                                )
                              : Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Mail('$index')),
                                );
                        }),
                  ],
                ),
              );
            }),
          ),
        ),*/

        floatingActionButton: FloatingActionButton(
          splashColor: Colors.green,
          backgroundColor: Colors.red,
          onPressed: () {
            _displayDialog(context);
          },
          child: Icon(
            Icons.add,
            size: 45,
          ),
          tooltip: 'Add Doctors',
        ),
      ),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text('T #$index'),
            leading: Icon(Icons.thumb_up),

          );
        });
  }

  Widget _getTasks() {
    return StreamBuilder(
        stream: Firestore.instance
            .collection('doctors')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return GridView.count(crossAxisCount: 1, children: [
              ListView.builder(
                padding: const EdgeInsets.all(10.0),
                itemBuilder: (BuildContext context, int index) => Center(
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width - 20,
                    color: Colors.green[300],
                    child: ListTile(
                      leading: Icon(Icons.label),
                      title: Text( snapshot.data.documents[index]['content'],style: TextStyle(fontSize: 30.0),),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(snapshot.data.documents[index]['content'])),
                        );
                      },
                    ),
                  ),
                ),
                itemCount: snapshot.data.documents.length,
              ),
            ]);
          } else {
            return Container();
          }
        });
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return EditDialog(
              title: 'Add Doctor',
              positiveAction: 'ADD',
              negativeAction: 'CANCEL',
              submit: _handleDialogSubmission);
        });
  }

//https://medium.com/flutterdevs/using-firebase-firestore-in-flutter-b0ea2c62bc7
  void _handleDialogSubmission(String value) {
    var doctor = <String, dynamic>{
      'content': value,
      'timestamp': DateTime.now().millisecondsSinceEpoch
    };
    Database.addTask(doctor);
  }

// ListView ->  List.generator  -> Navigator -> dynamic Widget
  //https://flutter.dev/docs/cookbook/navigation/passing-data
} // ListView ->  List.generator -> ? : -> Navigator -> dynamic Widget
// ListView ->  Firebase -> ? : -> Navigator -> dynamic Widget

class Profile extends StatelessWidget {
  String no;
  Profile(this.no);
// recive data this.no arg
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Route"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Text(this.no + ' ', style: TextStyle(fontSize: 40),),
          RaisedButton(
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Mail(this.no + ' rakib')),
              );
            }, // display here
            child: Text(' Mail page'), //this.no +
          ),
          RaisedButton(
            color: Colors.green,
            textColor: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }, // display here
            child: Text( ' Go back!'), //this.no +
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(),
    );
  }
}
