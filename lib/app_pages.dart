import 'package:get/get.dart';

import 'app_routes.dart';
import 'modules/login/login_view.dart';
import 'modules/login/login_binding.dart';
import 'modules/shell/main_shell_view.dart';
import 'modules/shell/shell_binding.dart';
import 'modules/animal_list/views/animal_list_view.dart';
import 'modules/animal_list/bindings/animal_list_binding.dart';
import 'modules/flock/views/animal_profile_view.dart';
import 'modules/flock/bindings/animal_profile_binding.dart';
import 'modules/field_ops/views/weight_op_view.dart';
import 'modules/field_ops/bindings/weight_op_binding.dart';
import 'modules/field_ops/views/medical_op_view.dart';
import 'modules/field_ops/bindings/medical_op_binding.dart';
import 'modules/field_ops/views/delete_op_view.dart';
import 'modules/field_ops/bindings/delete_op_binding.dart';
import 'modules/protocols/views/protocols_view.dart';
import 'modules/protocols/views/protocol_add_view.dart';
import 'modules/protocols/views/protocol_detail_view.dart';
import 'modules/protocols/bindings/protocols_binding.dart';
import 'modules/field_ops/views/edit_op_view.dart';
import 'modules/field_ops/bindings/edit_op_binding.dart';
import 'modules/field_ops/views/add_op_view.dart';
import 'modules/field_ops/bindings/add_op_binding.dart';
import 'modules/field_ops/views/birth_breeding_view.dart';
import 'modules/field_ops/bindings/birth_breeding_binding.dart';
import 'modules/stats/views/deleted_stats_view.dart';
import 'modules/stats/bindings/deleted_stats_binding.dart';
import 'modules/stats/views/trading_stats_view.dart';
import 'modules/stats/bindings/trading_stats_binding.dart';
import 'modules/inventory/views/vendor_form_view.dart';
import 'modules/inventory/bindings/vendor_form_binding.dart';
import 'modules/inventory/views/medicine_form_view.dart';
import 'modules/inventory/bindings/medicine_form_binding.dart';
import 'modules/inventory/views/medicine_detail_view.dart';
import 'modules/inventory/bindings/medicine_detail_binding.dart';
import 'modules/inventory/views/inventory_index_view.dart';
import 'modules/inventory/bindings/inventory_index_binding.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(name: Routes.login, page: () => const LoginView(), binding: LoginBinding()),
    GetPage(name: Routes.main, page: () => const MainShellView(), binding: ShellBinding()),
    GetPage(name: Routes.statusList, page: () => const AnimalListView(), binding: AnimalListBinding()),
    GetPage(name: Routes.animalProfile, page: () => const AnimalProfileView(), binding: AnimalProfileBinding()),
    GetPage(name: Routes.weightOp, page: () => const WeightOpView(), binding: WeightOpBinding()),
    GetPage(name: Routes.medicalOp, page: () => const MedicalOpView(), binding: MedicalOpBinding()),
    GetPage(name: Routes.deleteOp, page: () => const DeleteOpView(), binding: DeleteOpBinding()),
    GetPage(name: Routes.protocols, page: () => const ProtocolsView(), binding: ProtocolsBinding()),
    GetPage(name: Routes.protocolAdd, page: () => const ProtocolAddView()),
    GetPage(name: Routes.protocolDetail, page: () => const ProtocolDetailView()),
    GetPage(name: Routes.editOp, page: () => const EditOpView(), binding: EditOpBinding()),
    GetPage(name: Routes.addAnimal, page: () => const AddOpView(), binding: AddOpBinding()),
    GetPage(name: Routes.birthBreeding, page: () => const BirthBreedingView(), binding: BirthBreedingBinding()),
    GetPage(name: Routes.deletedStats, page: () => const DeletedStatsView(), binding: DeletedStatsBinding()),
    GetPage(name: Routes.tradingStats, page: () => const TradingStatsView(), binding: TradingStatsBinding()),
    GetPage(name: Routes.vendorDetail, page: () => const VendorFormView(), binding: VendorFormBinding()),
    GetPage(name: Routes.medicineAdd, page: () => const MedicineFormView(), binding: MedicineFormBinding()),
    GetPage(name: Routes.medicineDetail, page: () => const MedicineDetailView(), binding: MedicineDetailBinding()),
    GetPage(name: Routes.inventoryIndex, page: () => const InventoryIndexView(), binding: InventoryIndexBinding()),
  ];
}