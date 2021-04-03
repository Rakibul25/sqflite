import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test sqf'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton(
                onPressed: () {}, child: Text('Insert'), color: Colors.red),
            FlatButton(
                onPressed: () {}, child: Text('query'), color: Colors.blue),
            FlatButton(
                onPressed: () {}, child: Text('Update'), color: Colors.green),
            FlatButton(
                onPressed: () {}, child: Text('Delete'), color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
