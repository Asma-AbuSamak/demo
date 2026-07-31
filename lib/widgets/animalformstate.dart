import 'package:get/get.dart';
import 'package:insighta/models/animal/animal.dart';
import 'package:insighta/utilities/date_utils.dart';

/// حالة نموذج الحيوان — مشتركة بين شاشتَي «إضافة» و«تعديل».
/// كل حقل reactive، وفيها تعبئة من حيوان موجود + بناء حيوان جديد.
class AnimalFormState {
  final gender = Gender.female.obs;
  final breed = 'نجدي'.obs;
  final origin = Origin.born.obs;
  final birthDate = Rxn<int>();
  final ageYears = ''.obs;
  final ageMonths = ''.obs;
  final weight = ''.obs;
  final status = AnimalStatus.healthy.obs;
  final notes = ''.obs;
  final vendorName = ''.obs;
  final purchaseDate = Rxn<int>();
  final purchasePrice = ''.obs;
  final motherId = ''.obs;
  final fatherId = ''.obs;

  /// تعبئة النموذج من حيوان موجود (وضع التعديل).
  void prefill(Animal a) {
    gender.value = a.gender;
    breed.value = a.breed;
    origin.value = a.origin;
    birthDate.value = a.birthDateUtc;
    weight.value = a.weightGrams != null ? (a.weightGrams! / 1000).toStringAsFixed(0) : '';
    status.value = a.status;
    vendorName.value = a.vendorId ?? '';
    purchaseDate.value = a.purchaseDateUtc;
    purchasePrice.value = a.purchasePriceMinor != null ? (a.purchasePriceMinor! / 100).toStringAsFixed(0) : '';
    motherId.value = a.motherId ?? '';
    fatherId.value = a.fatherId ?? '';
  }

  /// بناء كائن الحيوان النهائي.
  Animal toAnimal(String id) {
    final now = AppDate.nowEpoch();
    return Animal(
      id: id,
      farmId: 'f1',
      tagNumber: id,
      gender: gender.value,
      breed: breed.value,
      birthDateUtc: _resolveBirthDate(),
      status: status.value,
      weightGrams: ((double.tryParse(weight.value.trim()) ?? 0) * 1000).round(),
      origin: origin.value,
      motherId: origin.value == Origin.born && motherId.value.trim().isNotEmpty
          ? motherId.value.trim()
          : null,
      fatherId: origin.value == Origin.born && fatherId.value.trim().isNotEmpty
          ? fatherId.value.trim()
          : null,
      vendorId: origin.value == Origin.purchased && vendorName.value.trim().isNotEmpty
          ? vendorName.value.trim()
          : null,
      purchaseDateUtc: origin.value == Origin.purchased ? purchaseDate.value : null,
      purchasePriceMinor: origin.value == Origin.purchased && purchasePrice.value.trim().isNotEmpty
          ? ((double.tryParse(purchasePrice.value.trim()) ?? 0) * 100).round()
          : null,
      createdAtUtc: now,
      updatedAtUtc: now,
    );
  }

  /// تاريخ الميلاد: لو مشترى وتُرك فارغاً، نشتقّه من العمر المُدخل.
  int _resolveBirthDate() {
    if (birthDate.value != null) return birthDate.value!;
    if (origin.value == Origin.purchased) {
      final y = int.tryParse(ageYears.value.trim()) ?? 0;
      final m = int.tryParse(ageMonths.value.trim()) ?? 0;
      final total = y * 12 + m;
      if (total > 0) {
        return AppDate.addMonthsEpoch(AppDate.todayEpoch(), -total);
      }
    }
    return AppDate.todayEpoch();
  }
}
