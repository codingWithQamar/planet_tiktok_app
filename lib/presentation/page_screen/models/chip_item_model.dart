import '../../../core/app_export.dart';

/// This class is used in the [chip_item_widget] screen.
class ChipItemModel {
  ChipItemModel({
    this.chip,
    this.isSelected,
  }) {
    chip = chip ?? "Male";
    isSelected = isSelected ?? false;
  }

  String? chip;

  bool? isSelected;
}
