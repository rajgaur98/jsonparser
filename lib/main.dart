import 'package:flutter/material.dart';
import 'package:jsonparser/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var data;
  bool loading = false;

  void fetch() async {
    setState(() {
      loading = true;
    });
    final services = Services();
    data = await services.fetch();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Load Json App'),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'User ID: ' + data[index]['userId'].toString(),
                            ),
                            Text(
                              'ID: ' + data[index]['id'].toString(),
                            ),
                            Text(
                              'Title: ' + data[index]['title'],
                            ),
                            Text(
                              'Completed: ' +
                                  data[index]['completed'].toString(),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                    itemCount: data.length),
              ),
            ),
    );
  }
}
