import 'package:flutter/material.dart';
import 'package:todo_list/detail.dart';
import 'package:todo_list/entity/memo.dart';
import 'package:todo_list/create.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  final memos = <Memo>[
    new Memo('title1', 'memo1'),
    new Memo('title2', 'memo2'),
    new Memo('title3', 'memo3')
  ];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: _list(),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'add note',
        child: new Icon(Icons.add),
        onPressed: () {
          Memo newMemo = new Memo('','');
          memos.add(newMemo);
          Navigator.push(context, new MaterialPageRoute<Null>(
              settings: const RouteSettings(name: "/create"),
              builder: (BuildContext context) => new Create(newMemo)
          ));
        }
      ),
    );
  }

  Widget _list() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          return _buildRow(memos[i]);
        },
        itemCount: memos.length
    );
  }

  Widget _buildRow(Memo memo) {
    return new ListTile(
      title: new Text(
        memo.title,
        style: _biggerFont,
      ),
      onTap: () {
        Navigator.push(context, new MaterialPageRoute<Null>(
            settings: const RouteSettings(name: "/detail"),
            builder: (BuildContext context) => new Detail(memo)
        ));
      },
    );
  }
}
