class Student {
  final String id;
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String address;
  final String educationLevel; // "Lise", "Üniversite", "Ortaokul" vb.
  final String school;
  final String grade; // "11. Sınıf", "2. Sınıf" vb.
  final String image;
  final List<String> interests; // İlgi alanları/dersler
  final String bio; // Hakkında kısa açıklama

  Student({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.address,
    required this.educationLevel,
    required this.school,
    required this.grade,
    required this.image,
    required this.interests,
    required this.bio,
  });

  // JSON'dan Student objesi oluşturma
  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      address: json['address'] ?? '',
      educationLevel: json['educationLevel'] ?? '',
      school: json['school'] ?? '',
      grade: json['grade'] ?? '',
      image: json['image'] ?? '',
      interests: List<String>.from(json['interests'] ?? []),
      bio: json['bio'] ?? '',
    );
  }

  // Student objesini JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'address': address,
      'educationLevel': educationLevel,
      'school': school,
      'grade': grade,
      'image': image,
      'interests': interests,
      'bio': bio,
    };
  }

  // Student objesini kopyalama
  Student copyWith({
    String? id,
    String? name,
    String? surname,
    String? email,
    String? phone,
    String? address,
    String? educationLevel,
    String? school,
    String? grade,
    String? image,
    List<String>? interests,
    String? bio,
  }) {
    return Student(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      educationLevel: educationLevel ?? this.educationLevel,
      school: school ?? this.school,
      grade: grade ?? this.grade,
      image: image ?? this.image,
      interests: interests ?? this.interests,
      bio: bio ?? this.bio,
    );
  }

  // Tam ad getter'ı
  String get fullName => '$name $surname';
}
