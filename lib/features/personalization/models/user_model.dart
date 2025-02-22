class UserModel {
  final String id;
  String name;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phoneNumber,
      required this.profilePicture});

  static UserModel empty() => UserModel(
      id: '', name: '', email: '', phoneNumber: '', profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'Profile Picture': profilePicture
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }
}
