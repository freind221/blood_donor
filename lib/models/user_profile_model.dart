class UserProfile {
  final String uid;
  final String? image;
  final String gender;
  final String bloodGroup;

  UserProfile({
    required this.uid,
    this.image,
    required this.gender,
    required this.bloodGroup,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'image': image,
      'gender': gender,
      'bloodGroup': bloodGroup,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
        uid: map['uid'] ?? '',
        image: map['image'],
        gender: map['gender'] ?? '',
        bloodGroup: map['bloodGroup'] ?? '');
  }
}
