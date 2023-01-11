import 'package:nyttprojektlen/databas.dart';
import 'package:nyttprojektlen/task.dart';
import 'package:path/path.dart';
import 'home.dart';
import 'addknapp.dart';
import 'package:flutter/material.dart';

class uppgift extends StatefulWidget {
  final int id;

  uppgift({@required this.id, String title});

  @override
  State<uppgift> createState() => _uppgiftState();
}

class _uppgiftState extends State<uppgift> {
  @override
  void initState() {
    print("ID: ${widget.id}");
    super.initState();
  }

  final textkontroll = new TextEditingController();
  Databasehelper _dbHelper = Databasehelper();
  String value = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Hemma()),
            //MaterialPageRoute(builder: (context) => uppgift(id: 0,)),
          ).then((value) {
            setState(() {});
          }),
        ),
        title: const Text('Todo App'),
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 10.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //ksk ta bort
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 5.0),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: textkontroll,
                        onChanged: (value) =>
                            setState(() => this.value = textkontroll.text),
                        /* 
                        onSubmitted: (value) async {
                          if (value != "") {
                            //  if (widget.id == null) {
                            minuppgift _nyuppgifyt =
                                minuppgift(title: value, isDone: 0);
                            await _dbHelper.addUppgift(_nyuppgifyt);
                            setState(() {});
                            print("Ny uppgift skapad!");
                          }
                        },
                        //   } */
                        decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: 'Vad vill du göra?',
                            suffixIcon: IconButton(
                                onPressed: () {
                                  textkontroll.clear();
                                },
                                icon: const Icon(Icons.clear))),
                        style: TextStyle(fontSize: 20),
                      ),
                    )
                  ],
                ),
                //addera(),
                buildButton(this.value),
              ],
            )),
      ),
    );
  }

  Widget buildButton(value) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                if (value != "") {
                  //   if (widget.id != 0) {
                  minuppgift _nyuppgifyt = minuppgift(
                    title: value,
                    isDone: 0, /* id: widget.id*/
                  );
                  await _dbHelper.addUppgift(_nyuppgifyt);
                  setState(() {});
                  print('lagt till ny uppgift');
                  textkontroll.clear();
                  //Navigator.pop(context);
                  //     Navigator.push(
                  //     context,
                  //   MaterialPageRoute(builder: (context) => Hemma()),
                  //MaterialPageRoute(builder: (context) => uppgift(id: 0,)),
                  //  );
                }
              },
              //  },
              child: Text("+ LÄGG TILL"),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.black),
            ),
          ],
        ));
  }
}
