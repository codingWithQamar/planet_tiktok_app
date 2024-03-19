import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/favorites_model.dart';

/// A provider class for the FavoritesScreen.
///
/// This provider manages the state of the FavoritesScreen, including the
/// current favoritesModelObj
class FavoritesProvider extends ChangeNotifier {
  TextEditingController searchController = TextEditingController();

  FavoritesModel favoritesModelObj = FavoritesModel();

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }
}
