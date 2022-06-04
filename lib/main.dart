import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MaterialApp(
    home: IdCard(),
  ));
}

class IdCard extends StatefulWidget {
  const IdCard({Key? key}) : super(key: key);

  @override
  State<IdCard> createState() => _IdCardState();
}

class _IdCardState extends State<IdCard> {

  Future<String> getData() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/users"),
        headers: {
          "Accept": "application/json"
    }
    );

    return(response.body);
  }

  int codingLevel = 0;


    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text("ID Card"),
        centerTitle: true,
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 0),
        child: Row(
        children: [
          FloatingActionButton(
            onPressed: getData,
            child: const Icon(Icons.accessibility_rounded),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 260.0),
            child: FloatingActionButton(
              onPressed: () {
                setState((){
                  codingLevel += 1;
                });
              },
              backgroundColor: Colors.grey[800],
              child:  const Icon(Icons.add),
            ),
          ),
        ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/F.png'),
                radius: 40.0,
                backgroundColor: Colors.white,
              ),
            ),
            const Divider(
              height: 90.0,
              color: Colors.white,
            ),
            const Text(
              'NAME',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0,),
            const Text(
              'John Fuller',
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0,),
            const Text(
              'CURRENT CODING LEVEL',
              style: TextStyle(
                color: Colors.amber,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0,),
            Text(
              '$codingLevel',
              style: const TextStyle(
                color: Colors.amberAccent,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                 const SizedBox(width: 10.0),
                 Text(
                  'jfuller@gmail.com',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}




