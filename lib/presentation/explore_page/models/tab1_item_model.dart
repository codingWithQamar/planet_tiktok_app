import '../../../core/app_export.dart';

/// This class is used in the [tab1_item_widget] screen.
class Tab1ItemModel {
  Tab1ItemModel({
    this.videoCounter,
    this.id,
  }) {
    videoCounter = videoCounter ?? "Video 1";
    id = id ?? "";
  }

  String? videoCounter;

  String? id;
}
