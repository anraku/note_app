import 'package:flutter/material.dart';
import 'package:todo_list/entity/memo.dart';

class Create extends StatelessWidget {
  final Memo _memo;

  Create(this._memo);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Create new note'),
      ),
      body: new ListView(children: <Widget>[
        new TextField(
            decoration: new InputDecoration(
                hintText:"Write title."
            ),
            controller: new TextEditingController(text: _memo.title),
            onChanged: (String newTitle) {
              _memo.title = newTitle;
            }
        ),
        new TextField(
            maxLines: 10,
            decoration: new InputDecoration(
                hintText:"Write memo."
            ),
            controller: new TextEditingController(text: _memo.body),
            onChanged: (String newBody) {
              _memo.body = newBody;
            }
        ),
        Center(
          child: new Container(
            margin: const EdgeInsets.all(10.0),
            height: 75.0,
            width: 150.0,

            child: new FlatButton(
              child: new Text('save memo'),
              color: Colors.lightBlue,
              textColor: Colors.black45,
              onPressed: () {
                Navigator.pop(context);
              }
            )
          )
        )
      ])
    );
  }
}
