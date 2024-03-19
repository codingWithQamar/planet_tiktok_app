import '../../../core/app_export.dart';

/// This class is used in the [tab_item_widget] screen.
class TabItemModel {
  TabItemModel({
    this.title,
    this.id,
  }) {
    title = title ?? "Home";
    id = id ?? "";
  }

  String? title;

  String? id;
}
