import 'package:flutter/material.dart';
import 'api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:uuid/uuid.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _command;

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "RedHatv8 command shell",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          leading: Image.asset("images/redhatlogo.png"),
        ),
        body: Builder(
          builder: (context) => Container(
            padding: EdgeInsets.only(top: 10.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  onChanged: (value) => {
                    _command = value,
                  },
                  autocorrect: false,
                  showCursor: true,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "date",
                    labelText: "Command",
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                    helperText: "Enter the command to execute",
                    helperStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                  child: MaterialButton(
                    onPressed: () async {
                      WidgetsFlutterBinding.ensureInitialized();
                      Firebase.initializeApp();
                      var fs = FirebaseFirestore.instance;
                      var uuid = Uuid();
                      var ex = uuid.v1();
                      var snack = await linuxcommand(command: _command);
                      fs.collection("command").add({
                        "cmd": _command,
                        "data": snack,
                        "exno": ex,
                      });
                      fs
                          .collection("command")
                          .where("exno", isEqualTo: ex)
                          .get()
                          .then((value) => {
                                value.docs.forEach((element) {
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(element.get('data')),
                                    elevation: 5.0,
                                    shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    action: SnackBarAction(
                                        label: "Close", onPressed: () {}),
                                  ));
                                })
                              });
                    },
                    child: Text(
                      "Execute",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
