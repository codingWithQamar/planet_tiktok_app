import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/explore_model.dart';
import '../models/tab_item_model.dart';
import '../models/tab1_item_model.dart';
import '../models/tab2_item_model.dart';

/// A provider class for the ExplorePage.
///
/// This provider manages the state of the ExplorePage, including the
/// current exploreModelObj
class ExploreProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  ExploreModel exploreModelObj = ExploreModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
