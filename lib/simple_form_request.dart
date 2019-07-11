class SimpleFormRequest {
  String firstName;
  String lastName;
  String dob;
  String favouriteColor;
  int gender;

  SimpleFormRequest();

  SimpleFormRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    dob = json['dob'];
    favouriteColor = json['favouriteColor'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['dob'] = this.dob;
    data['favouriteColor'] = this.favouriteColor;
    data['gender'] = this.gender;
    return data;
  }
}
