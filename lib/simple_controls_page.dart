import 'package:flutter/material.dart';
import 'package:form_controls_provider/base_widget.dart';
import 'package:form_controls_provider/form_validator.dart';
import 'package:form_controls_provider/simple_controls_presenter.dart';
import 'package:form_controls_provider/simple_form_request.dart';

class SimpleControlsPage extends StatefulWidget {
  @override
  _SimpleControlsPageState createState() => _SimpleControlsPageState();
}

class _SimpleControlsPageState extends State<SimpleControlsPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> _colors = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';
  int selectedRadio = 0;

  SimpleFormRequest simpleFormRequest = SimpleFormRequest();
  @override
  Widget build(BuildContext context) {
    return BaseWidget<SimpleContolsPresenter>(
        model: SimpleContolsPresenter(),
        builder: (context, model, child) => Scaffold(
              key: _scaffoldKey,
              appBar: AppBar(
                title: Text('Simple Contols Page'),
              ),
              body: Container(
                  child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 23.0),
                      child: Form(
                          key: _formKey,
                          autovalidate: false,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                Divider(color: Colors.transparent),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "First Name",
                                    prefixIcon: Icon(Icons.person_pin),
                                    labelText: 'First Name',
                                  ),
                                  onSaved: (val) {
                                    simpleFormRequest.firstName = val;
                                  },
                                  validator: FormValidator().validateIsRequired,
                                ),
                                Divider(color: Colors.transparent),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Last Name",
                                    prefixIcon: Icon(Icons.person),
                                    labelText: 'Last Name',
                                  ),
                                  onSaved: (val) {
                                    simpleFormRequest.lastName = val;
                                  },
                                  validator: FormValidator().validateIsRequired,
                                ),
                                Divider(color: Colors.transparent),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.calendar_today),
                                    hintText: 'DD/MM/YYYY',
                                    labelText: 'Date of Birth',
                                  ),
                                  onSaved: (val) {
                                    simpleFormRequest.dob = val;
                                  },
                                  validator: FormValidator().validateIsRequired,
                                  keyboardType: TextInputType.datetime,
                                ),
                                Divider(color: Colors.transparent),
                                FormField(
                                  initialValue: _color,
                                  builder: (FormFieldState state) {
                                    return InputDecorator(
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          prefixIcon: Icon(Icons.color_lens),
                                          labelText: 'Favourite Color',
                                          errorText: state.errorText),
                                      isEmpty: _color == '',
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          value: _color,
                                          isDense: true,
                                          onChanged: (String newValue) {
                                            setState(() {
                                              simpleFormRequest.favouriteColor =
                                                  newValue;
                                              _color = newValue;
                                              state.didChange(newValue);
                                            });
                                          },
                                          items: _colors.map((String value) {
                                            return DropdownMenuItem(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    );
                                  },
                                  validator:FormValidator().validateIsRequired,
                                ),
                                Divider(color: Colors.transparent),
                                FormField(
                                    validator: (val) {
                                      if (val == 0) {
                                        return "Gender is Required";
                                      } else {
                                        return null;
                                      }
                                    },
                                    initialValue: 0,
                                    builder: (FormFieldState state) {
                                      return InputDecorator(
                                        decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            prefixIcon: Icon(Icons.gesture),
                                            labelText: 'Gender',
                                            errorText: state.errorText),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Radio(
                                              value: 1,
                                              groupValue: selectedRadio,
                                              onChanged: (val) {
                                                setState(() {
                                                  selectedRadio = val;
                                                  state.didChange(val);
                                                });
                                                simpleFormRequest.gender = val;
                                              },
                                            ),
                                            Text(
                                              'Male',
                                              style: TextStyle(fontSize: 16.0),
                                            ),
                                            Radio(
                                              value: 2,
                                              groupValue: selectedRadio,
                                              onChanged: (val) {
                                                setState(() {
                                                  selectedRadio = val;
                                                  state.didChange(val);
                                                });
                                                simpleFormRequest.gender = val;
                                              },
                                            ),
                                            Text(
                                              'Female',
                                              style: TextStyle(
                                                fontSize: 16.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                Divider(color: Colors.transparent),
                                Text(model.json != null ? model.json : ""),
                                Container(
                                    child: RaisedButton(
                                  child: Text('Submit'),
                                  onPressed: () async {
                                    final FormState form =
                                        _formKey.currentState;
                                    if (!form.validate()) {
                                      SnackBar snackBar = new SnackBar(
                                      content:
                                          new Text("Validation error"));
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                    } else {
                                      form.save();
                                      model.submit(simpleFormRequest);
                                      SnackBar snackBar = new SnackBar(
                                      content:
                                          new Text("You Can see Input as Json"));
                                  _scaffoldKey.currentState
                                      .showSnackBar(snackBar);
                                    }
                                  },
                                )),
                              ],
                            ),
                          )))),
            ));
  }
}
