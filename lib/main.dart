import 'package:flutter/material.dart';
import 'package:testsqf/bdhelper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: frontend(),
    );
  }
}

class frontend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test sqf'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: () async {
                  int i = await DataBaseHelper.instance.insert({
                    DataBaseHelper.columnName: "Rakib",
                    DataBaseHelper.columnId: 11
                  });
                  print('inserted id is $i');
                },
                child: Text('Insert'),
                color: Colors.red),
            FlatButton(
                onPressed: () async {
                  List<Map<String, dynamic>> queryRows =
                      await DataBaseHelper.instance.queryAll();
                  print(queryRows);
                },
                child: Text('query'),
                color: Colors.blue),
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
