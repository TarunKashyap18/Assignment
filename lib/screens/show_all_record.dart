import 'package:assignment/util/student_template.dart';
import 'package:flutter/material.dart';

import '../util/database_helper.dart';

class ShowRecord extends StatefulWidget {
  ShowRecord({Key? key}) : super(key: key);

  @override
  State<ShowRecord> createState() => _ShowRecordState();
}

class _ShowRecordState extends State<ShowRecord> {
  var db = DatabaseHelper.instance;

  final List<Student> student_list = <Student>[];
  @override
  void initState() {
    _readList();
    super.initState();
  }

  _readList() async {
    List listItems = await db.getStudents();
    listItems.forEach((listItem) {
      setState(() {
//        _passwordList.add(Item.map(listItems));
        student_list.add(Student.map(listItem));
      });
    });
  }

  _deleteItem(String name, int index) async {
    debugPrint("Deleted item");
    await db.deleteStudent(name);
    setState(() {
      student_list.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Records"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
                itemCount: student_list.length,
                itemBuilder: (_, int index) {
                  return Card(
                      child: ListTile(
                    title: student_list[index],
                    // title: Text("Index: $index"),
                    trailing: Listener(
                      key: Key(student_list[index].name),
                      child: const Icon(
                        Icons.remove_circle,
                      ),
                      onPointerDown: (pointerEvent) =>
                          _deleteItem(student_list[index].name, index),
                    ),
                  ));
                }),
          ),
        ],
      ),
    );
  }
}
