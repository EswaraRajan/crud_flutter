import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class updatedelete extends StatefulWidget {
  const updatedelete({Key? key}) : super(key: key);

  @override
  _updatedeleteState createState() => _updatedeleteState();
}

class _updatedeleteState extends State<updatedelete> {
  CollectionReference ref = FirebaseFirestore.instance.collection('Emp');
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController designation = new TextEditingController();
  TextEditingController mobileno = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Update & delete data"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Emp').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Text("no value");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                var doc = snapshot.data!.docs[index];
                return Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Name : " + doc['field1']),
                            Text("Salary : " + doc['field2']),
                            Text("Designation : " + doc['field3']),
                            Text("Mobile No : " + doc['field4']),
                          ],
                        ),
                      ),
                      ButtonBar(
                        children:[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                namecontroller.text = doc['field1'];
                                salary.text = doc['field2'];
                                designation.text = doc['field3'];
                                mobileno.text = doc['field4'];
                                showDialog(
                                    context: context,
                                    builder: (context) => Dialog(
                                      child: Container(
                                        height: 450,
                                        padding: EdgeInsets.all(50.0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            TextFormField(
                                                controller: namecontroller,
                                                decoration: new InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                                  hintText: 'Employee Name',
                                                  labelText: 'Employee Name',
                                                )
                                            ),
                                            SizedBox(height: 15,),
                                            TextFormField(
                                                controller: salary,
                                                decoration: new InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                                  hintText: 'Salary',
                                                  labelText: 'Salary',
                                                )
                                            ),
                                            SizedBox(height: 15,),
                                            TextFormField(
                                                controller: designation,
                                                decoration: new InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                                  hintText: 'Designation',
                                                  labelText: 'Designation',
                                                )
                                            ),
                                            SizedBox(height: 15,),
                                            TextFormField(
                                                controller: mobileno,
                                                decoration: new InputDecoration(
                                                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                                                  hintText: 'Mobile No',
                                                  labelText: 'Mobile No',
                                                )
                                            ),
                                            SizedBox(height: 20,),
                                            FlatButton(
                                              onPressed: () {
                                                snapshot.data!.docs[index]
                                                    .reference
                                                    .update({
                                                  "field1":
                                                  namecontroller.text,
                                                  "field2": salary.text,
                                                  "field3": designation.text,
                                                  "field4": mobileno.text,
                                                }).whenComplete(() =>
                                                    Navigator.pop(
                                                        context));
                                              },
                                              child: Text("Update",style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25,),),
                                              color: Colors.blue.shade300,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
                            RaisedButton(
                              onPressed: () {
                                snapshot.data!.docs[index].reference.delete();
                              },
                              child: Text("Delete",style: TextStyle(fontSize: 15),),
                            )
                          ],
                        ),
                        ]
                      ),
                    ],
                  ),
                );
              }
          );
        },
      ),
    );
  }
}
