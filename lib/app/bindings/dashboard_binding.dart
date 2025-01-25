import 'package:get/get.dart';
import 'package:hiring_task/app/controllers/api_data_controller.dart';
import 'package:hiring_task/app/controllers/dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<ApiDataController>(() => ApiDataController());
  }
}
