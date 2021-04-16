import 'package:connectivity/connectivity.dart';
import 'package:futurebag/style/lostconnect.dart';
import 'package:get/get.dart';

class Connect extends GetxController {
  Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none)
        Get.bottomSheet(
          LostConnection(),
          isDismissible: false,
          isScrollControlled: false,
        );
      else {
        if (Get.isBottomSheetOpen) Get.back();
      }
    });
    print("iyaaa");
    super.onInit();
  }
}
