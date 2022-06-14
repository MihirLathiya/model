class MyName {
  String? firstName;
  String? name;
  String? uid;

  MyName({this.firstName, this.name, this.uid});

  MyName.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    name = json['name'];
    uid = json['uid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstName'] = firstName;
    data['name'] = name;
    data['uid'] = uid;
    return data;
  }
}
