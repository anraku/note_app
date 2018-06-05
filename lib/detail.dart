import 'package:flutter/material.dart';
import 'package:todo_list/entity/memo.dart';

class Detail extends StatelessWidget {
  final Memo _memo;

  Detail(this._memo);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Detail'),
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
        )
      ]),
    );
  }
}
