import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);

  @override
  State<InsertData> createState() => _InsertDataState();
}

class _InsertDataState extends State<InsertData> {
  final characterNameController = TextEditingController();
  final characterPowerController = TextEditingController();
  final characterDescriptionController = TextEditingController();

  // bool isHide = false;
  // late FloatingActionButton btn = FloatingActionButton(onPressed: (){});

  late DatabaseReference dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Anime'); //.child('Anime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserting data'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Inserting data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: characterNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Character Name',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: characterPowerController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Power',
                  hintText: 'Enter Character\'s Power',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: characterDescriptionController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  hintText: 'Enter The Description',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // MaterialButton(
              //   onPressed: () {
              //     Map<String, String> students = {
              //       'name': userNameController.text,
              //       'age': userAgeController.text,
              //       'salary': userSalaryController.text
              //     };
              //
              //     dbRef.push().set(students);
              //
              //   },
              //   child: const Text('Insert Data'),
              //   color: Colors.blue,
              //   textColor: Colors.white,
              //   minWidth: 300,
              //   height: 40,
              // ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                FloatingActionButton(
                  key: Key('incrementCount'),
                  onPressed: () async {
                     Map<String, String> anime = {
                      'name': characterNameController.text,
                      'power': characterPowerController.text,
                      'description': characterDescriptionController.text
                    };
                    // print(dbRef.child('Anime'));
                    // final snapshot = await dbRef.child('Anime').get();
                    // print(snapshot.value);
                    // if (snapshot.exists) {
                    //   print(snapshot.value);
                    // } else {
                    //   print('No data available.');
                    // }
                    dbRef.set(anime).asStream();
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.tealAccent,
                  splashColor: Colors.black,
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
