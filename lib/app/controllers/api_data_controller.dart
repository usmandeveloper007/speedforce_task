import 'package:get/get.dart';
import 'package:hiring_task/app/models/login_model.dart';
import 'package:hiring_task/app/service/login_api_service.dart';

class ApiDataController extends GetxController {
  @override
  void onInit() {
    loginUserData();
    super.onInit();
  }

  var isLoading = false.obs;
  RxString fullName = ''.obs;
  RxInt earnings = 0.obs;
  RxString avatarUrl = ''.obs;
  RxString emailAddress = ''.obs;
  RxString ratings = ''.obs;
  RxString aboutMe = ''.obs;

  Future<String> loginUserData() async {
    try {
      isLoading.value = true;
      final LoginApiModel? loginData = await LoginApiService.fetchLoginData();

      if (loginData == null || loginData.data == null) {
        return "Failed to fetch login data.";
      } else {
        fullName.value =
            '${loginData.data!.firstName} ${loginData.data!.lastName}';
        earnings.value = loginData.data!.earnings ?? 0;
        avatarUrl.value = loginData.data!.avatar ?? '';
        emailAddress.value = loginData.data!.email ?? '';
        ratings.value = loginData.data!.ratings ?? '0';
        aboutMe.value = loginData.data!.bio ?? '';

        return "Login data fetched successfully.";
      }
    } catch (e) {
      return "An error occurred: $e";
    } finally {
      isLoading.value = false;
    }
  }
}
