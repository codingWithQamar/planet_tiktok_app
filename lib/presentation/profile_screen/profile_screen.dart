import 'package:planet_tiktok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_title.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:planet_tiktok_app/widgets/custom_outlined_button.dart';
import 'package:planet_tiktok_app/widgets/custom_bottom_bar.dart';
import 'models/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProfileProvider(), child: ProfileScreen());
  }
}

// ignore_for_file: must_be_immutable
class ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: _buildAppBar(context),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 27.h, vertical: 29.v),
                child: Column(children: [
                  CustomImageView(
                      imagePath: ImageConstant.imgDownload1,
                      height: 179.adaptSize,
                      width: 179.adaptSize),
                  SizedBox(height: 53.v),
                  _buildAvatar(context),
                  Spacer(flex: 41),
                  _buildMyFavorites(context),
                  SizedBox(height: 18.v),
                  _buildMyInsights(context),
                  SizedBox(height: 18.v),
                  _buildContactSupport(context),
                  Spacer(flex: 58)
                ])),
            bottomNavigationBar: _buildBottomBar(context)));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        title: AppbarTitle(
            text: "lbl_profile".tr, margin: EdgeInsets.only(left: 16.h)),
        actions: [
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIcon,
              margin: EdgeInsets.only(left: 11.h, top: 14.v, right: 14.h)),
          AppbarTrailingImage(
              imagePath: ImageConstant.imgIcon,
              margin: EdgeInsets.only(left: 14.h, top: 14.v, right: 25.h))
        ],
        styleType: Style.bgShadow);
  }

  /// Section Widget
  Widget _buildEditProfile(BuildContext context) {
    return CustomOutlinedButton(
        height: 22.v,
        width: 84.h,
        text: "lbl_edit_profile".tr,
        margin: EdgeInsets.symmetric(vertical: 9.v),
        rightIcon: Container(
            margin: EdgeInsets.only(left: 2.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgArrowright,
                height: 12.adaptSize,
                width: 12.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimary,
        onPressed: () {
          onTapEditProfile(context);
        });
  }

  /// Section Widget
  Widget _buildAvatar(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(20.h))),
      Padding(
          padding: EdgeInsets.only(left: 12.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("lbl_john_doe".tr, style: theme.textTheme.titleMedium),
            SizedBox(height: 4.v),
            Text("msg_update_your_profile".tr,
                style: CustomTextStyles.bodySmallPrimary)
          ])),
      Spacer(),
      _buildEditProfile(context)
    ]);
  }

  /// Section Widget
  Widget _buildMyFavorites(BuildContext context) {
    return CustomOutlinedButton(
        width: 232.h,
        text: "lbl_my_favorites".tr,
        onPressed: () {
          onTapMyFavorites(context);
        });
  }

  /// Section Widget
  Widget _buildMyInsights(BuildContext context) {
    return CustomOutlinedButton(
        width: 232.h,
        text: "lbl_my_insights".tr,
        onPressed: () {
          onTapMyInsights(context);
        });
  }

  /// Section Widget
  Widget _buildContactSupport(BuildContext context) {
    return CustomOutlinedButton(width: 232.h, text: "lbl_contact_support".tr);
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return CustomBottomBar(onChanged: (BottomBarEnum type) {});
  }

  /// Navigates to the pageScreen when the action is triggered.
  onTapEditProfile(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.pageScreen,
    );
  }

  /// Navigates to the favoritesScreen when the action is triggered.
  onTapMyFavorites(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.favoritesScreen,
    );
  }

  onTapMyInsights(BuildContext context) {
    // TODO: implement Actions
  }
}
