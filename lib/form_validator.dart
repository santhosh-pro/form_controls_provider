class FormValidator {
  String validateIsRequired(String value) {
    if (value.isEmpty) {
      return "Field is Required";
    } else {
      return null;
    }
  }
}
