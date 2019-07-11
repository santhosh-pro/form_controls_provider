import 'package:flutter/material.dart';
import 'package:form_controls_provider/simple_form_request.dart';
import 'dart:convert' as convert;

class SimpleContolsPresenter extends ChangeNotifier {
  SimpleFormRequest simpleFormRequest;
  String json;
  void submit(SimpleFormRequest simpleFormRequest) {
    json = convert.jsonEncode(simpleFormRequest.toJson());

    notifyListeners();
  }
}
