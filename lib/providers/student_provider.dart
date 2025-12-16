import 'package:flutter/foundation.dart';
import 'package:tutorapp_deneme/models/student.dart';

class StudentProvider with ChangeNotifier {
  // Mevcut öğrenci bilgileri
  Student? _currentStudent;

  // Örnek öğrenci (gerçek uygulamada API'den gelecek)
  final Student _defaultStudent = Student(
    id: '1',
    name: 'Ahmet',
    surname: 'YILMAZ',
    email: 'ahmet.yilmaz@email.com',
    phone: '+90 555 123 45 67',
    address: 'İstanbul, Kadıköy',
    educationLevel: 'Lise',
    school: 'Kadıköy Anadolu Lisesi',
    grade: '11. Sınıf',
    image: 'images/student 1.png',
    interests: [
      'Matematik',
      'Fizik',
      'Kimya',
      'İngilizce',
      'Tarih',
      'Coğrafya'
    ],
  );

  // Getter'lar
  Student? get currentStudent => _currentStudent;
  Student get defaultStudent => _defaultStudent;

  // Constructor - varsayılan öğrenciyi yükle
  StudentProvider() {
    _currentStudent = _defaultStudent;
  }

  // Öğrenci bilgilerini güncelleme
  void updateStudent(Student updatedStudent) {
    _currentStudent = updatedStudent;
    notifyListeners();
  }

  // Öğrenci bilgilerini sıfırlama
  void resetStudent() {
    _currentStudent = _defaultStudent;
    notifyListeners();
  }

  // Öğrenci bilgilerini temizleme (çıkış yapma)
  void clearStudent() {
    _currentStudent = null;
    notifyListeners();
  }

  // Öğrenci giriş yapmış mı kontrol etme
  bool get isLoggedIn => _currentStudent != null;

  // Öğrenci adını güncelleme
  void updateName(String name) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(name: name);
      notifyListeners();
    }
  }

  // Öğrenci soyadını güncelleme
  void updateSurname(String surname) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(surname: surname);
      notifyListeners();
    }
  }

  // Öğrenci email'ini güncelleme
  void updateEmail(String email) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(email: email);
      notifyListeners();
    }
  }

  // Öğrenci telefonunu güncelleme
  void updatePhone(String phone) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(phone: phone);
      notifyListeners();
    }
  }

  // Öğrenci adresini güncelleme
  void updateAddress(String address) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(address: address);
      notifyListeners();
    }
  }

  // Öğrenci eğitim seviyesini güncelleme
  void updateEducationLevel(String educationLevel) {
    if (_currentStudent != null) {
      _currentStudent =
          _currentStudent!.copyWith(educationLevel: educationLevel);
      notifyListeners();
    }
  }

  // Öğrenci okulunu güncelleme
  void updateSchool(String school) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(school: school);
      notifyListeners();
    }
  }

  // Öğrenci sınıfını güncelleme
  void updateGrade(String grade) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(grade: grade);
      notifyListeners();
    }
  }

  // Öğrenci bio'sunu güncelleme
  void updateBio(String bio) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(bio: bio);
      notifyListeners();
    }
  }

  // Öğrenci ilgi alanlarını güncelleme
  void updateInterests(List<String> interests) {
    if (_currentStudent != null) {
      _currentStudent = _currentStudent!.copyWith(interests: interests);
      notifyListeners();
    }
  }

  // İlgi alanı ekleme
  void addInterest(String interest) {
    if (_currentStudent != null &&
        !_currentStudent!.interests.contains(interest)) {
      final updatedInterests = List<String>.from(_currentStudent!.interests)
        ..add(interest);
      _currentStudent = _currentStudent!.copyWith(interests: updatedInterests);
      notifyListeners();
    }
  }

  // İlgi alanı çıkarma
  void removeInterest(String interest) {
    if (_currentStudent != null) {
      final updatedInterests = List<String>.from(_currentStudent!.interests)
        ..remove(interest);
      _currentStudent = _currentStudent!.copyWith(interests: updatedInterests);
      notifyListeners();
    }
  }
}
