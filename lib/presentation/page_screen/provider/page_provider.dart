import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/page_model.dart';
import '../models/chip_item_model.dart';

/// A provider class for the PageScreen.
///
/// This provider manages the state of the PageScreen, including the
/// current pageModelObj

// ignore_for_file: must_be_immutable
class PageProvider extends ChangeNotifier {
  TextEditingController fullNameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController locationController = TextEditingController();

  PageModel pageModelObj = PageModel();

  @override
  void dispose() {
    super.dispose();
    fullNameController.dispose();
    emailController.dispose();
    locationController.dispose();
  }

  void onSelectedChipView1(
    int index,
    bool value,
  ) {
    pageModelObj.chipItemList.forEach((element) {
      element.isSelected = false;
    });
    pageModelObj.chipItemList[index].isSelected = value;
    notifyListeners();
  }
}
