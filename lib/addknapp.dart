/*

import 'package:flutter/material.dart';
import 'package:nyttprojektlen/task.dart';
import 'databas.dart';


class addera extends StatefulWidget {
  @override
  State<addera> createState() => _adderaState();
}

class _adderaState extends State<addera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
              child: Icon(
            Icons.keyboard,
            size: 30,
          )),
          Text('Klicka ENTER för att lägga till uppgift'),
        ],
      ),
    );
  }
}



(value) async {
                          if (value != "") {
                            //  if (widget.id == null) {
                            minuppgift _nyuppgifyt =
                                minuppgift(title: value, isDone: 0);

                            await _dbHelper.addUppgift(_nyuppgifyt);
                            setState(() {});
                            print("Ny uppgift skapad!");
                          }



class addera extends StatefulWidget {
  @override
  State<addera> createState() => _adderaState();
}

class _adderaState extends State<addera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
            child: Icon(
              Icons.keyboard,
              size: 30,
            ),
          ),
          Text('Klicka ENTER för att lägga till uppgift'),
        ],
      ),
    );
  }
}










class addera extends StatefulWidget {
  @override
  State<addera> createState() => _adderaState();
}

class _adderaState extends State<addera> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          TextButton(
              child: Icon(
            Icons.keyboard,
            size: 30,
          )),
          Text('Klicka ENTER för att lägga till uppgift'),
        ],
      ),
    );
  }
}


leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Hemma()),
            //MaterialPageRoute(builder: (context) => uppgift(id: 0,)),
          ).then((value) {
            setState(() {});
          }),
        ),
        
*/
