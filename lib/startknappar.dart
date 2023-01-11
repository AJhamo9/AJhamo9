import 'package:flutter/material.dart';
import 'home.dart';
import 'taskpage.dart';
import 'databas.dart';

class knapp extends StatefulWidget {
  @override
  State<knapp> createState() => _knappState();
}

class _knappState extends State<knapp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              right: 10.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => uppgift(),
                      ));
                },
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 3, color: Colors.black),
                        shape: BoxShape.rectangle,
                        color: Colors.pinkAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Icon(Icons.add, color: Colors.black)),
              ),
            ),
            // addera() //lägger till knappen på homepage
          ],
        ),
      ),
    );
  }
}

class radera extends StatelessWidget {
  final int id;
  radera({@required this.id});

  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 30.0,
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0.0,
              left: 10.0,
              child: GestureDetector(
                onTap: () {
                  return showDialog<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                            title: const Text('Vill du radera alla uppgifter?'),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                      child: const Text('Nej'),
                                      onPressed: (() {
                                        Navigator.pop(context);
                                      })),
                                  GestureDetector(
                                    child: TextButton(
                                      child: const Text('Ja'),
                                      onPressed: () async {
                                        await _dbHelper.raderaallatask(id);
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Hemma()));
                                      },
                                    ),
                                  ),
                                ],
                              )
                            ]);
                      });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.black),
                      shape: BoxShape.rectangle,
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(Icons.delete_forever, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
