import 'package:flutter/foundation.dart';
import 'package:tutorapp_deneme/models/teacher.dart';

class TeachersProvider with ChangeNotifier {
  // Favori öğretmenler listesi
  final List<Teacher> _favoriteTeachers = [];

  // Örnek öğretmenler (gerçek uygulamada API'den gelecek)
  final List<Teacher> _allTeachers = [
    Teacher(
      id: '1',
      name: 'Gürkan DİNÇ',
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
      name: 'Ayşe YILMAZ',
      subject: 'Fizik',
      rating: '4.9',
      price: '400 TRY/Sa',
      image: 'images/Teacher 1.png',
      education: 'İTÜ Fizik Mühendisliği',
      experience: '5 yıl özel ders deneyimi',
      location: 'Ankara / Online',
      email: 'ayse.yilmaz@email.com',
      phone: '+90 555 987 65 43',
      secondarySubjects: ['Matematik', 'Kimya'],
    ),
    Teacher(
      id: '3',
      name: 'Mehmet KAYA',
      subject: 'Kimya',
      rating: '4.5',
      price: '300 TRY/Sa',
      image: 'images/quantum-computer_12608409.png',
      education: 'Hacettepe Üniversitesi Kimya',
      experience: '3 yıl özel ders deneyimi',
      location: 'İzmir / Online',
      email: 'mehmet.kaya@email.com',
      phone: '+90 555 456 78 90',
      secondarySubjects: ['Biyoloji', 'Fizik'],
    ),
  ];

  // Getter'lar
  List<Teacher> get favoriteTeachers => _favoriteTeachers;
  List<Teacher> get allTeachers => _allTeachers;
  int get favoriteCount => _favoriteTeachers.length;

  // Öğretmenin favori olup olmadığını kontrol etme
  bool isFavorite(String teacherId) {
    return _favoriteTeachers.any((teacher) => teacher.id == teacherId);
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

  // Favori öğretmenleri temizleme
  void clearFavorites() {
    _favoriteTeachers.clear();
    notifyListeners();
  }
}
