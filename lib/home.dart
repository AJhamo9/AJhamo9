import 'package:flutter/material.dart';
import 'package:nyttprojektlen/databas.dart';
import 'package:nyttprojektlen/meny.dart';
import 'package:nyttprojektlen/textruta.dart';
import 'startknappar.dart';

class Hemma extends StatefulWidget {
  @override
  State<Hemma> createState() => _HemmaState();
}

class _HemmaState extends State<Hemma> {
  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: meny(),
        appBar: AppBar(
          title: const Text("Todo App"),
          iconTheme: IconThemeData(color: Colors.black), //ev t abort gö vit
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: FutureBuilder(
                                initialData: [],
                                future: _dbHelper.getUppgifter(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  return ListView.builder(
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () async {
                                          id:
                                          snapshot.data[index].id; //ev ta bort
                                          if (snapshot.data[index].isDone ==
                                              0) {
                                            await _dbHelper.updatetaskisdone(
                                                snapshot.data[index].id, 1);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Bra jobbat, denna uppgift är klar!'),
                                                  backgroundColor:
                                                      Colors.pinkAccent),
                                            );

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
                                          isDone:
                                              snapshot.data[index].isDone == 0
                                                  ? false
                                                  : true,
                                        ),
                                      );
                                    },
                                  );
                                }))
                      ]),
                  Positioned(
                    child: knapp(),
                  ),
                  Positioned(
                    child: radera(),
                  ),
                ],
              )),
        ));
  }
}
/*
class Hemma extends StatefulWidget {
  @override
  State<Hemma> createState() => _HemmaState();
}

class _HemmaState extends State<Hemma> {
  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TIG333 Att Göra'),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 25),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Stack(
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: FutureBuilder(
                                initialData: [],
                                future: _dbHelper.getTasks(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  return ListView.builder(
                                      itemCount: snapshot.data.length,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        uppgift(
                                                          id: snapshot.data[index].id,
                                                        )));
                                          },
                                          child: taskk(
                                            title: snapshot.data[index].title,
                                          ),
                                        );
                                      });
                                })),
                      ]),
                  Positioned(
                    child: knapp(),
                  )
                ],
              )),
        ));
  }
}
*/
