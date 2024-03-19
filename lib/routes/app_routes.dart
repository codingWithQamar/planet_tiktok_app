import 'package:flutter/material.dart';
import '../presentation/favorites_screen/favorites_screen.dart';
import '../presentation/profile_screen/profile_screen.dart';
import '../presentation/page_screen/page_screen.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String homePage = '/home_page';

  static const String explorePage = '/explore_page';

  static const String favoritesScreen = '/favorites_screen';

  static const String profileScreen = '/profile_screen';

  static const String pageScreen = '/page_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        favoritesScreen: FavoritesScreen.builder,
        profileScreen: ProfileScreen.builder,
        pageScreen: PageScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: FavoritesScreen.builder
      };
}
