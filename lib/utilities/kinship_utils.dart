import 'package:insighta/models/animal.dart';


/// فحص القرابة بين حيوانين (والد/أخوة/أبناء عم).
/// يرجّع نص التحذير أو null إن لم تكن هناك قرابة.
class Kinship {
  static String? checkRelated(Animal a1, Animal a2, List<Animal> all) {
    if (a1.id == a2.id) return null;

    if (a1.fatherId == a2.id || a1.motherId == a2.id) {
      return 'أحدهما والد الآخر مباشرة';
    }
    if (a2.fatherId == a1.id || a2.motherId == a1.id) {
      return 'أحدهما والد الآخر مباشرة';
    }
    if (a1.motherId != null && a1.motherId == a2.motherId) {
      return 'أخوة – يتشاركان نفس الأم';
    }
    if (a1.fatherId != null && a1.fatherId == a2.fatherId) {
      return 'أخوة – يتشاركان نفس الأب';
    }

    Animal? get(String? id) {
      if (id == null) return null;
      for (final x in all) {
        if (x.id == id) return x;
      }
      return null;
    }

    final p1 = [get(a1.motherId), get(a1.fatherId)].whereType<Animal>();
    final p2 = [get(a2.motherId), get(a2.fatherId)].whereType<Animal>();

    for (final pa in p1) {
      for (final pb in p2) {
        if (pa.motherId != null && pa.motherId == pb.motherId) {
          return 'ابناء عم – أجداد مشتركون من الأم';
        }
        if (pa.fatherId != null && pa.fatherId == pb.fatherId) {
          return 'ابناء عم – أجداد مشتركون من الأب';
        }
        if (pa.id == pb.id) return 'نفس الوالد';
      }
    }
    return null;
  }
}