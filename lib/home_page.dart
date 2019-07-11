import 'package:flutter/material.dart';
import 'package:form_controls_provider/base_widget.dart';
import 'package:form_controls_provider/home_presenter.dart';
import 'package:form_controls_provider/router.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomePresenter>(
        model: HomePresenter(),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text('Home Page'),
            ),
            body: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("Simple Controls"),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutePaths.Simple);
                      },
                    ),
                    RaisedButton(
                      child: Text("Challenging Controls"),
                      onPressed: () {
                         Navigator.pushNamed(context, RoutePaths.Challenging);
                      },
                    )
                  ],
                ),
              ),
            )));
  }
}
