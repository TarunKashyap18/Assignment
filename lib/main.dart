import 'package:assignment/screens/add_new_record.dart';
import 'package:assignment/screens/delete_record.dart';
import 'package:assignment/screens/show_all_record.dart';
import 'package:assignment/screens/update_record.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assignment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Student Record'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text("Show records"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => ShowRecord())));
              },
            ),
            const Divider(),
            ElevatedButton(
              child: const Text("Add new record"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => AddRecord())));
              },
            ),
            const Divider(),
            ElevatedButton(
              child: const Text("Update a record"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => UpdateRecord())));
              },
            ),
            // ignore: prefer_const_constructors
            const Divider(),
            ElevatedButton(
              child: const Text("Delete a record"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => DeleteRecord())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
