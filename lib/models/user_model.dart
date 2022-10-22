class User {
  final String uid;
  final String username;
  final String email;
  final String role;

  User(
      {required this.uid,
      required this.username,
      required this.email,
      required this.role});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        uid: map['uid'] ?? '',
        username: map['username'] ?? '',
        email: map['email'] ?? '',
        role: map['role']);
  }
}
