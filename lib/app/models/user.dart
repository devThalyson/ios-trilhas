class User {
  String? id;
  String? name;
  String? birthDate;
  String? email;
  String? password;
  String? authMethod;

  User({
    this.id,
    this.name,
    this.birthDate,
    this.email,
    this.password,
    this.authMethod,
  });

  User.fromJson(Map<String, dynamic> json) {
    birthDate = json['birthDate'];
    name = json['name'];
    email = json['email'];
    authMethod = json['auth_method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['birthDate'] = this.birthDate;
    data['name'] = this.name;
    data['email'] = this.email;

    return data;
  }
}
