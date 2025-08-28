class Teacher {
  final String id;
  final String name;
  final String subject;
  final String rating;
  final String price;
  final String image;
  final String education;
  final String experience;
  final String location;
  final List<String> secondarySubjects;

  Teacher({
    required this.id,
    required this.name,
    required this.subject,
    required this.rating,
    required this.price,
    required this.image,
    required this.education,
    required this.experience,
    required this.location,
    required this.secondarySubjects,
  });

  // JSON'dan Teacher objesi oluşturma
  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      subject: json['subject'] ?? '',
      rating: json['rating'] ?? '',
      price: json['price'] ?? '',
      image: json['image'] ?? '',
      education: json['education'] ?? '',
      experience: json['experience'] ?? '',
      location: json['location'] ?? '',
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
      'secondarySubjects': secondarySubjects,
    };
  }

  // Teacher objesini kopyalama
  Teacher copyWith({
    String? id,
    String? name,
    String? subject,
    String? rating,
    String? price,
    String? image,
    String? education,
    String? experience,
    String? location,
    List<String>? secondarySubjects,
  }) {
    return Teacher(
      id: id ?? this.id,
      name: name ?? this.name,
      subject: subject ?? this.subject,
      rating: rating ?? this.rating,
      price: price ?? this.price,
      image: image ?? this.image,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      location: location ?? this.location,
      secondarySubjects: secondarySubjects ?? this.secondarySubjects,
    );
  }
}
