class Teacher {
  final String id;
  final String name;
  final String surname;
  final String subject;
  final String? rating;
  final String? price;
  final String? image;
  final String? education;
  final String? experience;
  final String? location;
  final String email;
  final String phone;
  final String? bio;
  final List<String>? secondarySubjects;

  Teacher({
    required this.id,
    required this.name,
    required this.surname,
    required this.subject,
    this.bio,
    this.rating,
    this.price,
    this.image,
    this.education,
    this.experience,
    this.location,
    required this.email,
    required this.phone,
    this.secondarySubjects,
  });

  // JSON'dan Teacher objesi oluşturma
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      surname: json['name'] ?? '',
      subject: json['subject'] ?? '',
      rating: json['rating'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
      education: json['education'] ?? '',
      experience: json['experience'] ?? '',
      location: json['location'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      secondarySubjects: List<String>.from(json['secondarySubjects'] ?? []),
    );
  }

  // Teacher objesini JSON'a çevirme
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'subject': subject,
      'rating': rating,
      'price': price,
      'image': image,
      'education': education,
      'experience': experience,
      'location': location,
      'email': email,
      'phone': phone,
      'secondarySubjects': secondarySubjects,
    };
  }

  // Teacher objesini kopyalama
  Teacher copyWith({
    String? id,
    String? name,
    String? surname,
    String? subject,
    String? rating,
    String? price,
    String? image,
    String? education,
    String? experience,
    String? location,
    String? email,
    String? bio,
    String? phone,
    List<String>? secondarySubjects,
  }) {
    return Teacher(
      id: id ?? this.id,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      subject: subject ?? this.subject,
      rating: rating ?? this.rating,
      bio: bio ?? this.bio,
      price: price ?? this.price,
      image: image ?? this.image,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      location: location ?? this.location,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      secondarySubjects: secondarySubjects ?? this.secondarySubjects,
    );
  }

  // Tam ad getter'ı
  String get fullName => '$name $surname';
}
