import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:tutorapp_deneme/components/about_section.dart';
import 'package:tutorapp_deneme/components/day_selector.dart';
import 'package:tutorapp_deneme/components/my_appbar_button.dart';
import 'package:tutorapp_deneme/components/my_second_button.dart';
import 'package:tutorapp_deneme/components/my_second_teacher_card.dart';
import 'package:tutorapp_deneme/components/my_show_dialog.dart';
import 'package:tutorapp_deneme/models/teacher.dart';
import 'package:tutorapp_deneme/providers/teachers_provider.dart';

enum InfoCardType {
  education,
  experience,
  location,
  price,
}

extension InfoCardTypeExtension on InfoCardType {
  String get title {
    switch (this) {
      case InfoCardType.education:
        return 'Eğitim';
      case InfoCardType.experience:
        return 'Deneyim';
      case InfoCardType.location:
        return 'Konum';
      case InfoCardType.price:
        return 'Ders Ücreti';
    }
  }

  IconData get icon {
    switch (this) {
      case InfoCardType.education:
        return Icons.school;
      case InfoCardType.experience:
        return Icons.work_history;
      case InfoCardType.location:
        return Icons.location_on;
      case InfoCardType.price:
        return Icons.monetization_on;
    }
  }

  String? initialValue(Teacher teacher) {
    switch (this) {
      case InfoCardType.education:
        return teacher.education;
      case InfoCardType.experience:
        return teacher.experience;
      case InfoCardType.location:
        return teacher.location;
      case InfoCardType.price:
        return teacher.price;
    }
  }
}

class TeacherCreateCardPage extends StatefulWidget {
  const TeacherCreateCardPage({
    super.key,
  });

  @override
  State<TeacherCreateCardPage> createState() => _TeacherCreateCardPageState();
}

class _TeacherCreateCardPageState extends State<TeacherCreateCardPage> {
  late TextEditingController aboutController;

  bool editMode = false;
  final List<InfoCardType> _activeCardTypes = [];
  final Map<InfoCardType, TextEditingController> _controllers = {};
  final Map<InfoCardType, String> _cardValues = {};
  bool showContactInfo = true;

  _initializeControllers() {
    final teacher = context.read<TeachersProvider>().currentTeacher;
    if (teacher != null) {
      aboutController = TextEditingController(text: teacher.bio);
    }
  }

  @override
  void initState() {
    _initializeControllers();
    super.initState();
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }

    aboutController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.secondary),
        centerTitle: true,
        title: Text(
          "Kart Oluştur",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          MyAppBarButton(
            icon: editMode ? CupertinoIcons.check_mark : CupertinoIcons.pencil,
            onTap: _handleEditModeToggle,
          ),
        ],
      ),
      body: Consumer<TeachersProvider>(
        builder: (context, provider, child) {
          final teacher = provider.currentTeacher!;

          return Padding(
            padding: EdgeInsets.only(top: 25.r),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.r),
                  topRight: Radius.circular(50.r),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Yeni MySecondTeacherCard component'i
                      MySecondTeacherCard(
                        onToggleContact: () {
                          setState(() {
                            // İletişim bilgilerini göster/gizle
                            showContactInfo = !showContactInfo;
                          });
                        },
                        showIcons: false,
                        showContactInfo: showContactInfo,
                        editmode: editMode,
                        teacher: teacher,
                      ),
                      AboutSection(
                        aboutText: teacher.bio,
                        editMode: editMode,
                        aboutController: aboutController,
                      ),
                      AnimatedSwitcher(
                        duration: Duration(milliseconds: 400),
                        child: _buildDynamicInfoCards(teacher),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 6.w, vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Müsaitlik Takvimi",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium),
                                Row(
                                  children: [
                                    Container(
                                      height: 16.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      ': Müsait',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Container(
                                      height: 16.h,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade400),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      ': Müsait değil',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            DaySelector(
                              currenTeacher: teacher,
                              editable: editMode,
                            ),
                            SizedBox(height: 18.h),
                            MySecondButton(
                              text: "Kartini olustur",
                              icon: CupertinoIcons.add_circled,
                              onPressed: () {
                                if (editMode) {
                                  return;
                                }
                                MyShowDialog.show(
                                    context: context,
                                    title: "Kartınız oluşturuluyor...",
                                    content:
                                        "Kartınız oluşturulacak onaylıyor musunuz ?",
                                    onConfirm: () {
                                      // Kosullar eklenecek  /////...............

                                      showDialog(
                                        barrierDismissible: false,
                                        context: context,
                                        builder: (context) => AlertDialog(
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Tamam",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium,
                                              ),
                                            ),
                                          ],
                                          title: Text("Başarılı"),
                                          content: Text(
                                              "Kartınız başarıyla oluşturuldu."),
                                          icon: Animate(
                                            effects: [
                                              ScaleEffect(
                                                  duration: Duration(
                                                      milliseconds: 800)),
                                              FadeEffect()
                                            ],
                                            child: Icon(
                                              size: 48.sp,
                                              Icons
                                                  .check_circle_outline_rounded,
                                              color: Colors.green.shade600,
                                            ),
                                          ),
                                        ),
                                      );

                                      provider.addTeacher(teacher);
                                    },
                                    confirmText: "Onayla",
                                    cancelText: "İptal");
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// HAKKIMDA BÖLÜMÜ

// Edit modu geçişini yönetir
  void _handleEditModeToggle() {
    final provider = context.read<TeachersProvider>();
    if (editMode) {
      FocusScope.of(context).unfocus();
      _persistCardValues(provider);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: Text('Kart Bilgileri Güncellendi'),
        ),
      );
    }

    setState(() {
      editMode = !editMode;
    });
  }

// Kart değerlerini sağlayıcıya kaydeder
  void _persistCardValues(TeachersProvider provider) {
    final teacher = provider.currentTeacher;
    if (teacher == null) return;

    String valueFor(InfoCardType type) {
      final controller = _controllers[type];
      final latest = controller?.text ??
          _cardValues[type] ??
          type.initialValue(teacher) ??
          '';
      final trimmed = latest.trim();
      _cardValues[type] = trimmed;
      return trimmed;
    }

    provider.updateTeacherDetails(
      bio: aboutController.text,
      education: _activeCardTypes.contains(InfoCardType.education)
          ? valueFor(InfoCardType.education)
          : '',
      experience: _activeCardTypes.contains(InfoCardType.experience)
          ? valueFor(InfoCardType.experience)
          : '',
      location: _activeCardTypes.contains(InfoCardType.location)
          ? valueFor(InfoCardType.location)
          : '',
      price: _activeCardTypes.contains(InfoCardType.price)
          ? valueFor(InfoCardType.price)
          : '',
    );
  }

// Dinamik bilgi kartlarını oluşturur
  Widget _buildDynamicInfoCards(Teacher teacher) {
    if (_activeCardTypes.isEmpty) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 12.h),
        child: GestureDetector(
          onTap: () => editMode ? _showCardPicker(teacher) : {},
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(28.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    CupertinoIcons.add,
                    size: 28.sp,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                SizedBox(height: 18.h),
                Text('Yeni bilgi kartı ekle',
                    style: Theme.of(context).textTheme.titleMedium),
                SizedBox(height: 8.h),
                Text(
                    'Eğitim, deneyim, konum gibi kartları oluşturmak için dokunun.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleSmall),
              ],
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        ..._activeCardTypes.map(
          (type) => Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: editMode
                ? _EditableInfoCard(
                    type: type,
                    controller:
                        _controllers[type] ?? _createController(type, teacher),
                    onRemove: () => _removeCard(type),
                  )
                : _ReadOnlyInfoCard(
                    type: type,
                    value: (type.initialValue(teacher) ?? '').trim(),
                  ),
          ),
        ),
        if (editMode)
          MySecondButton(
              text: "Bilgi Kartı Ekle",
              icon: Icons.add_circle_outline,
              onPressed: () => _showCardPicker(teacher)),
      ],
    );
  }

// Dinamik düzenlenebilir bilgi kartı widget'ı
  // ignore: non_constant_identifier_names
  Widget _EditableInfoCard({
    required InfoCardType type,
    required TextEditingController controller,
    required VoidCallback onRemove,
  }) {
    final theme = Theme.of(context);
    return AnimatedContainer(
      duration: Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18.r),
        color: theme.colorScheme.surface,
        border: Border.all(
          color: theme.colorScheme.secondary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10.r),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  type.icon,
                  color: theme.colorScheme.secondary,
                  size: 20.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  type.title,
                  style: theme.textTheme.titleMedium,
                ),
              ),
              IconButton(
                tooltip: 'Kartı kaldır',
                onPressed: onRemove,
                icon: Icon(
                  CupertinoIcons.trash,
                  color: theme.colorScheme.error,
                  size: 20.sp,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          DecoratedBox(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: theme.colorScheme.surface),
            child: TextField(
              controller: controller,
              minLines: 1,
              maxLines: null,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                isDense: true,
                hintText: '${type.title} bilgisini giriniz',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14.r),
                  borderSide: BorderSide(
                      color: theme.colorScheme.secondary, width: 1.2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

// Dinamik salt okunur bilgi kartı widget'ı
  // ignore: non_constant_identifier_names
  Widget _ReadOnlyInfoCard({
    required InfoCardType type,
    required String value,
  }) {
    final theme = Theme.of(context);
    final displayValue = value.isEmpty ? 'Bilgi girilmedi' : value;
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: theme.colorScheme.surface,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Icon(
              type.icon,
              color: theme.colorScheme.secondary,
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 6.h),
                Text(displayValue, style: theme.textTheme.bodyMedium),
              ],
            ),
          )
        ],
      ),
    );
  }

// Kart tipi seçiciyi gösterir
  void _showCardPicker(Teacher teacher) {
    final availableTypes = InfoCardType.values
        .where((type) => !_activeCardTypes.contains(type))
        .toList();

    if (availableTypes.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          content: Text('Tüm kartlar zaten eklendi'),
        ),
      );
      return;
    }
// Kart tipi seçiciyi gösterir
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32.r)),
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      builder: (sheetContext) {
        return Padding(
          padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 28.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.r),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    child: Icon(
                      CupertinoIcons.layers_alt,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Text('Kart Tipi Seçin',
                      style: Theme.of(context).textTheme.displayMedium),
                ],
              ),
              SizedBox(height: 18.h),
              Wrap(
                spacing: 12.w,
                runSpacing: 12.h,
                children: availableTypes
                    .map(
                      (type) => GestureDetector(
                        onTap: () {
                          Navigator.of(sheetContext).pop();
                          _addCard(type, teacher);
                        },
                        child: Container(
                          width: (MediaQuery.of(context).size.width / 2) - 40.w,
                          padding: EdgeInsets.all(16.r),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18.r),
                            color: Theme.of(context).colorScheme.surface,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  type.icon,
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Text(
                                type.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4.h),
                              Text(
                                'Bu kartı ekle',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }

  void _addCard(InfoCardType type, Teacher teacher) {
    if (_activeCardTypes.contains(type)) return;
    final controller = _createController(type, teacher);
    setState(() {
      _activeCardTypes.add(type);
      _controllers[type] = controller;
      _cardValues[type] = controller.text;
    });
  }

  void _removeCard(InfoCardType type) {
    setState(() {
      _activeCardTypes.remove(type);
      // providerde remove oluyor duzeltme olabilir.....!
    });
  }

// Kontrolör oluşturur
  TextEditingController _createController(InfoCardType type, Teacher teacher) {
    if (_controllers.containsKey(type)) {
      return _controllers[type]!;
    }

    final controller = TextEditingController(
      text: _cardValues[type] ?? type.initialValue(teacher) ?? '',
    );
// PROBLEM VAR SONRA BAK ! (PROVIDERI NULL ATIYOR)
    controller.addListener(() {
      _cardValues[type] = controller.text;
    });

    _controllers[type] = controller;
    return controller;
  }
}
