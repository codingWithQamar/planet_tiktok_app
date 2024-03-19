import 'package:planet_tiktok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_title.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:planet_tiktok_app/widgets/custom_search_view.dart';
import 'package:planet_tiktok_app/widgets/custom_icon_button.dart';
import 'package:planet_tiktok_app/widgets/custom_bottom_bar.dart';
import 'models/favorites_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';
import 'provider/favorites_provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FavoritesScreenState createState() => FavoritesScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavoritesProvider(),
      child: FavoritesScreen(),
    );
  }
}

class FavoritesScreenState extends State<FavoritesScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 11.v,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Selector<FavoritesProvider, TextEditingController?>(
                  selector: (
                    context,
                    provider,
                  ) =>
                      provider.searchController,
                  builder: (context, searchController, child) {
                    return CustomSearchView(
                      controller: searchController,
                      hintText: "lbl_search_videos".tr,
                    );
                  },
                ),
              ),
              SizedBox(height: 23.v),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 3.h),
                  child: Text(
                    "lbl_favourites".tr,
                    style: CustomTextStyles.bodySmall12,
                  ),
                ),
              ),
              SizedBox(height: 9.v),
              _buildTab(context),
              SizedBox(height: 48.v),
              _buildCard(context),
              SizedBox(height: 25.v),
              _buildFourteen(context),
              SizedBox(height: 11.v),
              Divider(
                indent: 15.h,
                endIndent: 15.h,
              ),
              SizedBox(height: 3.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_favorites".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIcon,
          margin: EdgeInsets.only(
            left: 11.h,
            top: 14.v,
            right: 14.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIcon,
          margin: EdgeInsets.only(
            left: 14.h,
            top: 14.v,
            right: 25.h,
          ),
        ),
      ],
      styleType: Style.bgShadow,
    );
  }

  /// Section Widget
  Widget _buildTab(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 4.h),
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgVector,
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                ),
                SizedBox(height: 11.v),
                Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(
                    "lbl_video_1".tr,
                    style: theme.textTheme.bodySmall,
                  ),
                ),
                SizedBox(height: 8.v),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 4.h),
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 48.adaptSize,
                    width: 48.adaptSize,
                    radius: BorderRadius.circular(
                      24.h,
                    ),
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 11.v),
                Text(
                  "lbl_video_2".tr,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 8.v),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 4.h),
            padding: EdgeInsets.symmetric(
              horizontal: 33.h,
              vertical: 3.v,
            ),
            decoration: AppDecoration.outlinePrimary.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 48.adaptSize,
                  width: 48.adaptSize,
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.circleBorder24,
                  ),
                  child: CustomImageView(
                    imagePath: ImageConstant.imgVector,
                    height: 48.v,
                    width: 45.h,
                    alignment: Alignment.center,
                  ),
                ),
                SizedBox(height: 11.v),
                Text(
                  "lbl_video_3".tr,
                  style: theme.textTheme.bodySmall,
                ),
                SizedBox(height: 8.v),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _buildCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 336.h,
            decoration: AppDecoration.fillPrimary,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 32.h,
                  padding: EdgeInsets.all(4.h),
                  decoration: AppDecoration.fillPrimary.copyWith(
                    borderRadius: BorderRadiusStyle.customBorderTL6,
                  ),
                  child: Text(
                    "lbl_new".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: 135.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "lbl_sample_video".tr,
                    style: theme.textTheme.titleMedium,
                  ),
                ),
                SizedBox(height: 135.v),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "lbl_video_title".tr,
              style: CustomTextStyles.bodySmall12,
            ),
          ),
          SizedBox(height: 8.v),
          Padding(
            padding: EdgeInsets.only(left: 12.h),
            child: Text(
              "lbl_category".tr,
              style: theme.textTheme.titleMedium,
            ),
          ),
          SizedBox(height: 13.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFourteen(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.h,
        right: 17.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 2.v),
            child: CustomIconButton(
              height: 32.adaptSize,
              width: 32.adaptSize,
              padding: EdgeInsets.all(3.h),
              decoration: IconButtonStyleHelper.fillPrimaryTL16,
              child: CustomImageView(
                imagePath: ImageConstant.imgIcon,
              ),
            ),
          ),
          Container(
            height: 35.v,
            width: 66.h,
            margin: EdgeInsets.only(left: 8.h),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "lbl_video_title".tr,
                    style: CustomTextStyles.bodyMediumPrimary,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(top: 7.v),
                    child: IntrinsicWidth(
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: 40.h,
                                right: 2.h,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 12.v),
                                    child: Text(
                                      "lbl_category".tr,
                                      style: CustomTextStyles.bodySmallPrimary,
                                    ),
                                  ),
                                  CustomImageView(
                                    imagePath: ImageConstant.imgIcon,
                                    height: 19.v,
                                    width: 18.h,
                                    margin: EdgeInsets.only(bottom: 8.v),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 11.v),
                          Divider(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(
              top: 8.v,
              bottom: 10.v,
            ),
            child: Text(
              "lbl_duration".tr,
              style: theme.textTheme.titleSmall,
            ),
          ),
          CustomImageView(
            imagePath: ImageConstant.imgIcon,
            height: 19.v,
            width: 18.h,
            margin: EdgeInsets.only(
              left: 10.h,
              top: 7.v,
              bottom: 8.v,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(
      onChanged: (BottomBarEnum type) {},
    );
  }
}
