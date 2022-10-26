class UserProfile {
  final String uid;
  final String image;
  final String gender;

  UserProfile({
    required this.uid,
    required this.image,
    required this.gender,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'image': image,
      'gender': gender,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      uid: map['uid'] ?? '',
      image: map['image'] ?? '',
      gender: map['gender'] ?? '',
    );
  }
}
