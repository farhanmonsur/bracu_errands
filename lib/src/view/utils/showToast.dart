import 'package:flutter_easyloading/flutter_easyloading.dart';

void showToast(String message) {
  EasyLoading.showToast(
    message,
    toastPosition: EasyLoadingToastPosition.bottom,
  );
}

void showError(String message) {
  EasyLoading.showError(message);
}
