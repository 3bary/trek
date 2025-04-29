class RegisterRequestBody {
  RegisterRequestBody({
      this.name, 
      this.email, 
      this.password,});

  RegisterRequestBody.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }
  String? name;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}