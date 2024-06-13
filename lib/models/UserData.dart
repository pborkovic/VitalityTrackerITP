class UserData {
  final String name;
  final String dob;
  final String email;
  final String password;

  UserData({
    required this.name,
    required this.dob,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'dob': dob,
      'email': email,
      'password': password,
    };
  }
}
