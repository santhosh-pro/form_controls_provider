import 'package:flutter/material.dart';
import 'package:form_controls_provider/base_widget.dart';
import 'package:form_controls_provider/challenging_controls_presenter.dart';

class ChallengingControlsPage extends StatefulWidget {
  @override
  _ChallengingControlsPageState createState() =>
      _ChallengingControlsPageState();
}

class _ChallengingControlsPageState extends State<ChallengingControlsPage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<ChallengingContolsPresenter>(
        model: ChallengingContolsPresenter(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('Challenging Contols Page'),
            ),
            body: Container(child: Center(child: Text("Comming Soon")))));
  }
}
