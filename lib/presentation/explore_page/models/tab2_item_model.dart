import '../../../core/app_export.dart';

/// This class is used in the [tab2_item_widget] screen.
class Tab2ItemModel {
  Tab2ItemModel({
    this.videoCounter,
    this.id,
  }) {
    videoCounter = videoCounter ?? "Video 1";
    id = id ?? "";
  }

  String? videoCounter;

  String? id;
}
