import '../../../core/app_export.dart';
import 'tab_item_model.dart';
import 'tab1_item_model.dart';
import 'tab2_item_model.dart';

class ExploreModel {
  List<TabItemModel> tabItemList = [
    TabItemModel(title: "Home"),
    TabItemModel(title: "Discover"),
    TabItemModel(title: "Trending")
  ];

  List<Tab1ItemModel> tab1ItemList = [
    Tab1ItemModel(videoCounter: "Video 1"),
    Tab1ItemModel(videoCounter: "Video 2"),
    Tab1ItemModel(videoCounter: "Video 3")
  ];

  List<Tab2ItemModel> tab2ItemList = [
    Tab2ItemModel(videoCounter: "Video 1"),
    Tab2ItemModel(videoCounter: "Video 2"),
    Tab2ItemModel(videoCounter: "Video 3")
  ];
}
