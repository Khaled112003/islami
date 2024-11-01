class UserModel {
  final String uid;
  final String username;
  final String email;
  final String? profileImage; 

  UserModel({
    required this.uid,
    required this.username,
    required this.email,
    this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'profileImage': profileImage,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      profileImage: map['profileImage'],
    );
  }
}
