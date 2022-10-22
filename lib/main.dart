import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';

void main() {
  runApp(MyApp(title: 'Flutter Demo Home Page'));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: MyTabbedPage(),
    );
  }
}

class MyTabbedPage extends StatefulWidget {
  MyTabbedPage({Key? key}) : super(key: key);

  @override
  _MyTabbedPageState createState() => _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage> {
  int _i = 0;
  int _i2 = 0;
  int _i3 = 0;
  late double heightScreen, widthScreen;
  @override
  Widget build(BuildContext context) {
    heightScreen =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(title: Text("Teste view")), body: createScreen());
  }

  Widget mainScreen() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        margin: const EdgeInsets.only(
          top: (10),
          bottom: (10),
        ),
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Color(4293454064), spreadRadius: 1.5),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ExpandablePanel(
                header: const Text("Only teste"),
                collapsed: Column(
                  children: const [Text("Test Sub title")],
                ),
                expanded: createScreen(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget createScreen() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _i++;
                  });
                },
                child: const Text('Buttom +'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _i--;
                  });
                },
                child: const Text('Buttom -'),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _i,
            itemBuilder: (BuildContext ctxt, int index) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.blueGrey[500],
                  // height: 100,
                  child: createScreen2(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget createScreen2() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _i2++;
                  });
                },
                child: const Text('Buttom +'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _i2--;
                  });
                },
                child: const Text('Buttom -'),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _i2,
            itemBuilder: (BuildContext ctxt, int index) {
              return Expanded(
                child: Container(
                  margin: EdgeInsets.all(10),
                  color: Colors.red[500],
                  // height: 100,
                  child: createScreen3(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget createScreen3() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _i3++;
                  });
                },
                child: const Text('Buttom +'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _i3--;
                  });
                },
                child: const Text('Buttom -'),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _i3,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                margin: EdgeInsets.all(10),
                color: Colors.yellow[500],
                height: 100,
                // child: createScreen(),
              );
            },
          ),
        ],
      ),
    );
  }
}
