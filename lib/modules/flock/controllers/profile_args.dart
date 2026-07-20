/// وسيطة الانتقال لشاشة ملف الحيوان: معرّف الحيوان + عنوان زر الرجوع.
class ProfileArgs {
  final String id;
  final String backLabel; // "المرضى" أو "الحوامل" ... حسب القائمة القادمة منها
  const ProfileArgs(this.id, {this.backLabel = 'رجوع'});
}
