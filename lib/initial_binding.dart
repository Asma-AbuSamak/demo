import 'package:get/get.dart';
import 'package:insighta/app_config.dart';
import 'package:insighta/repo.dart/animal_repository.dart';
import 'package:insighta/repo.dart/inventory_repository.dart';
import 'package:insighta/repo.dart/medical_repository.dart';
import 'package:insighta/repo.dart/records_repository.dart';
import 'package:insighta/web_services/catalog_service.dart';
import 'package:insighta/web_services/mock_animal_repository.dart';
import 'package:insighta/web_services/mock_inventory_repository.dart';
import 'package:insighta/web_services/mock_medical_repository.dart';
import 'package:insighta/web_services/mock_records_repository.dart';
import 'package:insighta/web_services/scanner_service.dart';


///  نقطة التبديل الوحيدة في المشروع كله (Mock ⇄ API).
/// عند وصول الباك-اند: استبدلي MockXRepository بـ ApiXRepository — لا شيء آخر يتغير.
class InitialBinding extends Bindings {
  @override
  void dependencies() {
    if (AppConfig.useMockData) {
      Get.put<IAnimalRepository>(MockAnimalRepository(), permanent: true);
      Get.put<IMedicalRepository>(MockMedicalRepository(), permanent: true);
      Get.put<IInventoryRepository>(MockInventoryRepository(), permanent: true);
      Get.put<IRecordsRepository>(MockRecordsRepository(), permanent: true);
    }

    Get.put<ScannerService>(ScannerService(), permanent: true);
    Get.put<CatalogService>(CatalogService(), permanent: true);
  }
}