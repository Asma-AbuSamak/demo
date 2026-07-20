import 'package:get/get.dart';
import 'package:insighta/models/animal.dart';
import 'package:intl/intl.dart';

/// حالة نموذج الحيوان — مشتركة بين شاشتَي «إضافة» و«تعديل».
/// كل حقل reactive، وفيها تعبئة من حيوان موجود + بناء حيوان جديد.
class AnimalFormState {
  final gender = Gender.female.obs;
  final breed = 'نجدي'.obs;
  final origin = Origin.born.obs;
  final birthDate = ''.obs;
  final ageYears = ''.obs;
  final ageMonths = ''.obs;
  final weight = ''.obs;
  final status = AnimalStatus.healthy.obs;
  final notes = ''.obs;
  final vendorName = ''.obs;
  final purchaseDate = ''.obs;
  final purchasePrice = ''.obs;
  final motherId = ''.obs;
  final fatherId = ''.obs;

  /// تعبئة النموذج من حيوان موجود (وضع التعديل).
  void prefill(Animal a) {
    gender.value = a.gender;
    breed.value = a.breed;
    origin.value = a.origin;
    birthDate.value = a.birthDate;
    weight.value = a.weight.toStringAsFixed(0);
    status.value = a.status;
    vendorName.value = a.vendorName ?? '';
    purchaseDate.value = a.purchaseDate ?? '';
    purchasePrice.value = a.purchasePrice ?? '';
    motherId.value = a.motherId ?? '';
    fatherId.value = a.fatherId ?? '';
  }

  /// بناء كائن الحيوان النهائي.
  Animal toAnimal(String id) {
    return Animal(
      id: id,
      gender: gender.value,
      breed: breed.value,
      birthDate: _resolveBirthDate(),
      status: status.value,
      weight: double.tryParse(weight.value.trim()) ?? 0,
      origin: origin.value,
      motherId: origin.value == Origin.born && motherId.value.trim().isNotEmpty
          ? motherId.value.trim()
          : null,
      fatherId: origin.value == Origin.born && fatherId.value.trim().isNotEmpty
          ? fatherId.value.trim()
          : null,
      vendorName: origin.value == Origin.purchased && vendorName.value.trim().isNotEmpty
          ? vendorName.value.trim()
          : null,
      purchaseDate: origin.value == Origin.purchased && purchaseDate.value.isNotEmpty
          ? purchaseDate.value
          : null,
      purchasePrice: origin.value == Origin.purchased && purchasePrice.value.trim().isNotEmpty
          ? purchasePrice.value.trim()
          : null,
    );
  }

  /// تاريخ الميلاد: لو مشترى وتُرك فارغاً، نشتقّه من العمر المُدخل.
  String _resolveBirthDate() {
    if (birthDate.value.isNotEmpty) return birthDate.value;
    if (origin.value == Origin.purchased) {
      final y = int.tryParse(ageYears.value.trim()) ?? 0;
      final m = int.tryParse(ageMonths.value.trim()) ?? 0;
      final total = y * 12 + m;
      if (total > 0) {
        final now = DateTime.now();
        final d = DateTime(now.year, now.month - total, now.day);
        return DateFormat('yyyy-MM-dd').format(d);
      }
    }
    return DateFormat('yyyy-MM-dd').format(DateTime.now());
  }
}