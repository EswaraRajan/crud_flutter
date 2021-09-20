import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_flutter/Update_delete.dart';

import 'package:firebase_core/firebase_core.dart';
/*import 'package:firebase_demo/alldata.dart';*/
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var sampledata1 = new TextEditingController();

  var sampledata2 = new TextEditingController();

  var sampledata3 = new TextEditingController();

  var sampledata4 = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Text("CRUD",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45,letterSpacing: 5,),),
      ),
      body: ListView(
        children: [ Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: sampledata1,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Employee Name',
                    labelText: 'Employee Name',
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: sampledata2,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Salary',
                    labelText: 'Salary',
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: sampledata3,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Designation',
                    labelText: 'Designation',
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: sampledata4,
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  autofocus: true,
                  decoration: new InputDecoration(
                    border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    hintText: 'Mobile No',
                    labelText: 'Mobile No',
                  )
              ),
              SizedBox(
                height: 20.0,
              ),
              FlatButton(
                onPressed: () {
                  Map<String, dynamic> data = {
                    "field1": sampledata1.text,
                    "field2": sampledata2.text,
                    "field3": sampledata3.text,
                    "field4": sampledata4.text,
                  };
                  // Firestore.instance.collection("test").add(data);
                  FirebaseFirestore.instance.collection("Emp").add(data);
                },
                child: Text("Submit",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,),),
                color: Colors.blue.shade300,
              ),
               FlatButton(
                 onPressed: () {
                   Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) => updatedelete()),
                   );
                 },
                 child: Text("Get all Data",style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,),),
                 color: Colors.blue.shade300,
               )
            ],
          ),
        ),],
      ),
    );
  }
}
