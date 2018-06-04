import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String _memo;

  Detail(this._memo);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Detail'),
        ),
        body: new TextField(
          maxLines: 10,
          decoration: new InputDecoration(
              hintText:"My Text String."
          ),
          controller: new TextEditingController(text: _memo),
        )
    );
  }
}
