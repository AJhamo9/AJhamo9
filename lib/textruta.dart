import 'package:flutter/material.dart';
import 'databas.dart';
import 'home.dart';

class taskk extends StatelessWidget {
  final String title;
  final bool isDone;
  final int id;
  taskk({this.title, @required this.isDone, @required this.id});

  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3.5, color: Colors.black),
            borderRadius: BorderRadius.circular(20)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              icon: isDone
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
              iconSize: 30),
          Padding(padding: EdgeInsets.only(right: 10)),
          Expanded(
            child: Text(title,
                textAlign: TextAlign.start, //??
                //        'INGET NAMN', //ifall man inte skriver en titel blir heter tasken såhär
                style: TextStyle(
                  color: isDone ? Colors.red : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: isDone ? TextDecoration.lineThrough : null,
                )),
          ),
          GestureDetector(
            child: IconButton(
              icon: Icon(Icons.delete_forever),
              padding: EdgeInsets.only(left: 10),
              iconSize: 30,
            ),
            onTap: () {
              return showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: const Text('Vill du radera uppgift?'),
                        actions: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    await _dbHelper.raderatask(id);
                                    print("raderat uppgift med id: '$id'");
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
          ),
        ]));
  }
}



/*
----kod med statefull widget. 

class taskk extends StatefulWidget {
  final String title;
  final bool isDone;
  final int id;
  taskk({this.title, @required this.isDone, @required this.id});

  @override
  State<taskk> createState() => _taskkState();
}

class _taskkState extends State<taskk> {
  @override
  void initState() {
    print("ID: ${widget.id}");
    print('isDone: ${widget.isDone}');
    print('title: ${widget.title}');
    super.initState();
  }

  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 22,
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(40)),
        child: Row(children: [
          IconButton(
              icon: widget.isDone
                  ? Icon(Icons.check_box)
                  : Icon(Icons.check_box_outline_blank),
              iconSize: 30),
          Padding(padding: EdgeInsets.only(right: 10)),
          Flexible(
            child: Text(
                widget.title ??
                    'INGET NAMN', //ifall man inte skriver en titel blir heter tasken såhär
                style: TextStyle(
                  color: widget.isDone ? Colors.red : Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: widget.isDone ? TextDecoration.lineThrough : null,
                )),
          ),
          GestureDetector(
            child: IconButton(
              icon: Icon(Icons.delete_forever),
              padding: EdgeInsets.only(left: 10),
              iconSize: 30,
            ),
            onTap: () {
              return showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Vill du radera uppgift?'),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  await _dbHelper.raderatask(widget.id);
                                  setState(() {});
                                  print('raderat uppgift');
                                  Navigator.pop(context);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Hemma()));
                                  setState(() {});
                                },
                              ),
                            )
                          ],
                        )
                      ],
                    );
                  });
            },
            /*
            onTap: () async {
              await _dbHelper.raderatask(title);
              print('raderat uppgift');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Hemma()));
            },*/
          )
        ]));
  }
}










          IconButton(
            alignment: Alignment.centerRight,
            icon: isDone ? Icon(Icons.check_box)
            : Icon(Icons.check_box_outline_blank),
            iconSize: 30   
            ),
          ]
        ),
      ),
    );
  }
}


Positioned(
            child: Container(
                child: Stack(children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                      alignment: Alignment.centerRight,
                      icon: isDone
                          ? Icon(Icons.check_box)
                          : Icon(Icons.check_box_outline_blank),
                      iconSize: 30)),



class taskk extends StatelessWidget {
  final String title;
  final bool isDone;
  taskk({this.title, this.isDone});

  Databasehelper _dbHelper = Databasehelper();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            color: Colors.pink,
            border: Border.all(width: 3, color: Colors.black),
            borderRadius: BorderRadius.circular(25)),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  child: Text(
                    title ??
                        'INGET NAMN', //ifall man inte skriver en titel blir heter tasken såhär
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: isDone ? TextDecoration.lineThrough : null,
                    ),
                  )),
              IconButton(
                  icon: isDone
                      ? Icon(Icons.check_box)
                      : Icon(Icons.check_box_outline_blank),
                  iconSize: 30),
              GestureDetector(
                  child: IconButton(
                    icon: Icon(Icons.delete_forever),
                    iconSize: 30,
                  ),
                  onTap: () async {
                    await _dbHelper.raderatask(title);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Hemma()));
                  })
            ],
          ),
        ));
  }
}
*/
