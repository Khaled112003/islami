class UserModel {
  final String uid;
  final String username;
  final String email;

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
  });

  factory UserModel.fromMap(Map<String, dynamic> data, String uid) {
    return UserModel(
      uid: uid,
      username: data['username'] ?? '',
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
    };
  }
}