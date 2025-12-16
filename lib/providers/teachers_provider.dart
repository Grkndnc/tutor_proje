import 'package:flutter/foundation.dart';
import 'package:tutorapp_deneme/models/teacher.dart';

class TeachersProvider with ChangeNotifier {
  // Favori öğretmenler listesi
  final List<Teacher> _favoriteTeachers = [];
  Teacher? _currentTeacher;

// Örnek bir Kullanıcı (Öğretmen) verileri UI doğru akitmasi için
  final Teacher _defaultTeacher = Teacher(
    id: '4',
    name: 'Gürkan',
    surname: "DİNÇ",
    subject: 'Matematik',
    rating: '4.7',
    price: '350 TRY/Sa',
    education: 'ODTÜ Matematik, Yüksek Lisans - Eğitim Bilimleri',
    experience: '7 yıl özel ders deneyimi',
    location: 'İstanbul / Online',
    email: 'gurkan.dinc@email.com',
    phone: '+90 555 123 45 67',
    availableDays: ['Pazartesi', 'Çarşamba', 'Cuma', 'Cumartesi'],
    secondarySubjects: [
      'Fizik',
      'Biyoloji',
      'Kimya',
    ],
  );

  // Örnek öğretmenler (gerçek uygulamada API'den gelecek)
  final List<Teacher> _allTeachers = [
    Teacher(
      id: '1',
      name: 'Gürkan',
      surname: "DİNÇ",
      subject: 'Matematik',
      rating: '4.7',
      price: '350 TRY/Sa',
      image: 'images/quantum-computer_12608409.png',
      education: 'ODTÜ Matematik, Yüksek Lisans - Eğitim Bilimleri',
      experience: '7 yıl özel ders deneyimi',
      location: 'İstanbul / Online',
      email: 'gurkan.dinc@email.com',
      phone: '+90 555 123 45 67',
      secondarySubjects: [
        'Fizik',
        'Biyoloji',
        'Kimya',
        'Edebiyat',
        'Tarih',
        'Coğrafya',
        'İngilizce'
      ],
    ),
    Teacher(
      id: '2',
      name: 'Ayşe',
      surname: "DİNÇ",
      subject: 'Fizik',
      rating: '4.9',
      price: '400 TRY/Sa',
      image: 'images/Teacher 1.png',
      education: 'İTÜ Fizik Mühendisliği',
      experience: '5 yıl özel ders deneyimi',
      location: 'Ankara / Online',
      availableDays: [
        'Pazartesi',
        'Çarşamba',
      ],
      email: 'ayse.yilmaz@email.com',
      phone: '+90 555 987 65 43',
      secondarySubjects: ['Matematik', 'Kimya'],
    ),
    Teacher(
      id: '3',
      name: 'Mehmet',
      surname: "KAYA",
      subject: 'Kimya',
      rating: '4.5',
      price: '300 TRY/Sa',
      image: 'images/quantum-computer_12608409.png',
      education: 'Hacettepe Üniversitesi Kimya',
      experience: '3 yıl özel ders deneyimi',
      location: 'İzmir / Online',
      email: 'mehmet.kaya@email.com',
      phone: '+90 555 456 78 90',
      availableDays: [
        'Pazartesi',
        'Çarşamba',
      ],
      secondarySubjects: ['Biyoloji', 'Fizik'],
    ),
  ];

  // Getter'lar
  List<Teacher> get favoriteTeachers => _favoriteTeachers;
  List<Teacher> get allTeachers => _allTeachers;
  int get favoriteCount => _favoriteTeachers.length;
  Teacher? get currentTeacher => _currentTeacher;

  TeachersProvider() {
    _currentTeacher = _defaultTeacher;
  }

  bool get isLoggedIn => _currentTeacher != null;

  // Öğretmenin favori olup olmadığını kontrol etme
  bool isFavorite(String teacherId) {
    return _favoriteTeachers.any((teacher) => teacher.id == teacherId);
  }

  ///////////////Musait gunler sectirme fonksiyonu/////////////////////////
  void toggledays(d) {
    final days = List<String>.from(currentTeacher!.availableDays ?? []);
    if (days.contains(d)) {
      days.remove(d);
    } else {
      days.add(d);
    }
    final updated = _currentTeacher!.copyWith(availableDays: days);

    // allteachers listesinden ve availabledays kismini guncelle !!
    updateTeacher(updated);

    notifyListeners();
  }

  // Favorilere ekleme
  void addToFavorites(Teacher teacher) {
    if (!isFavorite(teacher.id)) {
      _favoriteTeachers.add(teacher);
      notifyListeners(); // UI'ı güncelle
    }
  }

  // Favorilerden çıkarma
  void removeFromFavorites(String teacherId) {
    _favoriteTeachers.removeWhere((teacher) => teacher.id == teacherId);
    notifyListeners(); // UI'ı güncelle
  }

  // Favori durumunu değiştirme (toggle)
  void toggleFavorite(Teacher teacher) {
    if (isFavorite(teacher.id)) {
      removeFromFavorites(teacher.id);
    } else {
      addToFavorites(teacher);
    }
  }

  // ID'ye göre öğretmen bulma
  Teacher? getTeacherById(String teacherId) {
    try {
      return _allTeachers.firstWhere((teacher) => teacher.id == teacherId);
    } catch (e) {
      return null;
    }
  }

/////////////////////////////////////////  Güncellemeler  ///////////////////////////////

  void updateTeacherDetails({
    String? name,
    String? surname,
    String? email,
    String? phone,
    String? education,
    String? experience,
    String? location,
    String? price,
    String? bio,
    String? subject,
    List<String>? availableDays,
    List<String>? secondarySubjects,
  }) {
    if (_currentTeacher == null) return;
    final uptadedTeacher = _currentTeacher!.copyWith(
      name: name ?? currentTeacher!.name,
      surname: surname ?? _currentTeacher!.surname,
      email: email ?? _currentTeacher!.email,
      phone: phone ?? _currentTeacher!.phone,
      education: education ?? _currentTeacher!.education,
      experience: experience ?? _currentTeacher!.experience,
      location: location ?? _currentTeacher!.location,
      price: price ?? _currentTeacher!.price,
      bio: bio ?? _currentTeacher!.bio,
      subject: subject ?? _currentTeacher!.subject,
      availableDays: availableDays ?? _currentTeacher!.availableDays,
      secondarySubjects:
          secondarySubjects ?? _currentTeacher!.secondarySubjects,
    );
    updateTeacher(uptadedTeacher);
    notifyListeners();
  }

// Listedeki ogrtetmeni bulur
  void uptadeTeacherInList(Teacher uptadedTeacher) {
    final index = _allTeachers.indexWhere((t) => t.id == uptadedTeacher.id);
    if (index != -1) {
      _allTeachers[index] = uptadedTeacher;
    }
  }

//listedeki ogretmeni guceller
  void updateTeacher(Teacher teacher) {
    _currentTeacher = teacher;
    uptadeTeacherInList(teacher);
    notifyListeners();
  }

//----------------------------------- - - - - -- - - ---------------------------------------------
  // Favori öğretmenleri temizleme
  void clearFavorites() {
    _favoriteTeachers.clear();
    notifyListeners();
  }

  void addTeacher(Teacher teacher) {
    final exists = _allTeachers.any((existing) => existing.id == teacher.id);
    if (exists) return;
    _allTeachers.add(teacher);
    notifyListeners();
  }
}
