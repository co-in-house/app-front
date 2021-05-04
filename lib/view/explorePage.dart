import 'package:Inhouse/component/sampleMessage.dart';
import 'package:Inhouse/model/sample.dart';
import 'package:Inhouse/service/sampleService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: InputDecoration(hintText: 'Enter Your Name !'),
        ),
        ElevatedButton(
          child: Text('Submit'),
          onPressed: () {
            context.read<SampleService>().call(_controller.text);
          },
        ),
        SampleMessage(sample: context.select((Sample sample) => sample)),
      ],
    );
  }
}
