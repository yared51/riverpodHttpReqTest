class UserModel {
  final int id;

  final String email;

  final String name;

  final String username;

  UserModel({
    required this.name,
    required this.username,
    required this.id,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        name: json['name'],
        username: json['username'],
        id: json['id'],
        email: json['email']);
  }
}
