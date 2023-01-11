import 'package:flutter/material.dart';
import 'package:nyttprojektlen/home.dart';
import 'package:nyttprojektlen/textruta.dart';
import 'databas.dart';

class meny extends StatelessWidget {
  //get checkbox => null;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Meny',
              style: TextStyle(
                  color: Colors.pink,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text(
              'Alla',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Hemma(), //(context) => NySida()
                ),
              )
            },
          ),
          ListTile(
            title: Text(
              'Gjorda',
              style: TextStyle(fontSize: 18),
            ),
            onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => gjorda(),
              ))
            },
          ),
          ListTile(
              title: Text(
                'Ogjorda',
                style: TextStyle(fontSize: 18),
              ),
              onTap: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ogjorda()),
                    ),
                  })
        ],
      ),
    );
  }
}

class gjorda extends StatefulWidget {
  @override
  State<gjorda> createState() => _gjordaState();
}

class _gjordaState extends State<gjorda> {
  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: meny(),
      appBar: AppBar(
        title: const Text('Todo App'),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      child: FutureBuilder(
                          initialData: [],
                          future: _dbHelper.getDoneTasks(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    id:
                                    snapshot.data[index].id; //ev ta bort
                                    if (snapshot.data[index].isDone == 0) {
                                      await _dbHelper.updatetaskisdone(
                                          snapshot.data[index].id, 1);
                                      print('klar');
                                    } else {
                                      await _dbHelper.updatetaskisdone(
                                          snapshot.data[index].id, 0);
                                      print('ej klar');
                                    }
                                    setState(() {});
                                  },
                                  child: taskk(
                                    title: snapshot.data[index].title,
                                    id: snapshot.data[index].id,
                                    isDone: snapshot.data[index].isDone == 0
                                        ? false
                                        : true,
                                  ),
                                );
                              },
                            );
                          }))
                ]),
              ]))),
    );
  }
}

class ogjorda extends StatefulWidget {
  const ogjorda({Key key}) : super(key: key);

  @override
  State<ogjorda> createState() => _ogjordaState();
}

Databasehelper _dbHelper = Databasehelper();

class _ogjordaState extends State<ogjorda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: meny(),
      appBar: AppBar(
        title: const Text('Todo App'),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Expanded(
                      child: FutureBuilder(
                          initialData: [],
                          future: _dbHelper.getNotDoneTasks(),
                          builder: (context, AsyncSnapshot snapshot) {
                            return ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () async {
                                    id:
                                    snapshot.data[index].id; //ev ta bort
                                    if (snapshot.data[index].isDone == 0) {
                                      await _dbHelper.updatetaskisdone(
                                          snapshot.data[index].id, 1);
                                      print('klar');
                                    } else {
                                      await _dbHelper.updatetaskisdone(
                                          snapshot.data[index].id, 0);
                                      print('ej klar');
                                    }
                                    setState(() {});
                                  },
                                  child: taskk(
                                    title: snapshot.data[index].title,
                                    id: snapshot.data[index].id,
                                    isDone: snapshot.data[index].isDone == 0
                                        ? false
                                        : true,
                                  ),
                                );
                              },
                            );
                          }))
                ]),
              ]))),
    );
  }
}
