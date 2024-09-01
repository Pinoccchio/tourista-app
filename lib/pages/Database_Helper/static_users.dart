class User {
  final String firstName;
  final String lastName;
  final String studentNumber;
  final String password;
  final String profilePictureUrl;

  User({
    required this.firstName,
    required this.lastName,
    required this.studentNumber,
    required this.password,
    required this.profilePictureUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'studentNumber': studentNumber,
      'password': password,
      'profilePictureUrl': profilePictureUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      firstName: map['firstName'],
      lastName: map['lastName'],
      studentNumber: map['studentNumber'],
      password: map['password'],
      profilePictureUrl: map['profilePictureUrl'] ?? '', // Default to empty if not present
    );
  }
}

