import 'package:flutter/material.dart';
import 'package:flutter_application_1/publicAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screen/publicNavBar.dart';
import 'package:flutter_application_1/to-do use/homeAppBar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter_application_1/to-do use/appBar.dart';
import 'package:flutter_application_1/to-do use/addTaskBox.dart';

// Create Model
class ToDo {
  // String id;
  String toDoAct;
  String toDoNote;
  String toDoTime;
  bool isDone;

  ToDo({
    // required this.id,
    required this.toDoAct,
    required this.toDoNote,
    required this.toDoTime,
    this.isDone = false,
  });
}

// POP-UP ADD-TASK
class AddTaskBox extends StatefulWidget {
  const AddTaskBox({super.key});

  @override
  State<AddTaskBox> createState() => _AddTaskBoxState();
}

class _AddTaskBoxState extends State<AddTaskBox> {
  final List<ToDo> _list = [];

  final TextEditingController titleController = TextEditingController();
  final TextEditingController subtitleController = TextEditingController();
  final TextEditingController trailingController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    trailingController.dispose();
    super.dispose();
  }

  void addItemToList() {
    setState(() {
      _list.add(ToDo(
          toDoAct: titleController.text,
          toDoNote: subtitleController.text,
          toDoTime: trailingController.text));
      titleController.clear();
      subtitleController.clear();
      trailingController.clear();
    });
  }

  // void addToDoItem() {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Tambahkan Tugas',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: 'Nunito',
              color: Color(0xFF2585DE),
            ),
          ),
          SizedBox(height: 35),

          // Input Activity
          TextField(
            controller: titleController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Kegiatan',
                fillColor: Color(0xFF2585DE)),
          ),
          SizedBox(height: 15),

          // Input Keterangan Tambahan
          TextField(
            controller: subtitleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Keterangan',
            ),
          ),
          SizedBox(height: 15),

          // Input Waktu
          TextField(
            controller: trailingController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Jam',
            ),
          ),
          SizedBox(height: 20),

          // Tombol save
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
                onPressed: addItemToList,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'Simpan',
                  style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  // final List<ListTile> items;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ToDo> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              // AppBar
              HomeAppBar(elevation: 0, flexibleSpace: Container()),

              // ListView.builder(itemBuilder: itemBuilder),

              // Body Page
              Expanded(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: _list.map((e) {
                    return ListTile(
                      leading: Icon(Icons.pending_actions),
                      title: Text(
                        e.toDoAct,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Text(
                        e.toDoNote,
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Text(
                        e.toDoTime,
                        style: TextStyle(
                          color: Color(0xFF8C8C8C),
                          fontFamily: 'Nunito',
                        ),
                      ),
                    );
                  }).toList(),
                ),
                // child: ListView.builder(
                //   itemCount: widget.,
                //   itemBuilder: (context, int index) {
                //     return widget.items[index];
                //   },
                // ),
              )),
            ],
          ),

          // Add-task Button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(
                right: 20,
                bottom: 75,
              ),
              child: FloatingActionButton(
                // Adding task
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return AddTaskBox();
                    }),
                child: Icon(Icons.post_add_rounded),
              ),
            ),
          ),
        ],
      ),
      // appBar: buildAppBar(), (Gajadi pake appbar)
    );
  }
}
