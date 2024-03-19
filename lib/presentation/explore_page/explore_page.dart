import 'package:planet_tiktok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_title.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_trailing_image.dart';
import 'package:planet_tiktok_app/widgets/custom_search_view.dart';
import 'widgets/tab_item_widget.dart';
import 'models/tab_item_model.dart';
import 'models/explore_model.dart';
import 'widgets/tab1_item_widget.dart';
import 'models/tab1_item_model.dart';
import 'widgets/tab2_item_widget.dart';
import 'models/tab2_item_model.dart';
import 'package:planet_tiktok_app/widgets/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';
import 'provider/explore_provider.dart';

// ignore_for_file: must_be_immutable
class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key})
      : super(
          key: key,
        );

  @override
  ExplorePageState createState() => ExplorePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreProvider(),
      child: ExplorePage(),
    );
  }
}

class ExplorePageState extends State<ExplorePage> {
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
          width: 405.h,
          padding: EdgeInsets.symmetric(
            horizontal: 12.h,
            vertical: 11.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 15.h,
                  right: 30.h,
                ),
                child: Selector<ExploreProvider, TextEditingController?>(
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
              SizedBox(height: 31.v),
              _buildTab(context),
              SizedBox(height: 36.v),
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "lbl_popular".tr,
                  style: CustomTextStyles.bodySmall12,
                ),
              ),
              SizedBox(height: 13.v),
              _buildTab1(context),
              SizedBox(height: 18.v),
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "msg_recently_watched".tr,
                  style: CustomTextStyles.bodySmall12,
                ),
              ),
              SizedBox(height: 17.v),
              _buildTab2(context),
              SizedBox(height: 51.v),
              Container(
                margin: EdgeInsets.only(
                  left: 15.h,
                  right: 146.h,
                ),
                padding: EdgeInsets.all(12.h),
                decoration: AppDecoration.fillPrimary.copyWith(
                  borderRadius: BorderRadiusStyle.roundedBorder6,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 24.adaptSize,
                          width: 24.adaptSize,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(
                              12.h,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 5.v,
                            bottom: 3.v,
                          ),
                          child: Text(
                            "msg_recently_watched".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 7.v),
                          child: CustomRatingBar(),
                        ),
                      ],
                    ),
                    SizedBox(height: 9.v),
                    Text(
                      "lbl_video_title".tr,
                      style: CustomTextStyles.bodyMediumPrimary,
                    ),
                    SizedBox(height: 52.v),
                    CustomImageView(
                      imagePath: ImageConstant.imgIcon,
                      height: 19.v,
                      width: 18.h,
                      margin: EdgeInsets.only(left: 2.h),
                    ),
                    SizedBox(height: 2.v),
                  ],
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: AppbarTitle(
        text: "lbl_explore".tr,
        margin: EdgeInsets.only(left: 16.h),
      ),
      actions: [
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIcon,
          margin: EdgeInsets.only(
            left: 26.h,
            top: 14.v,
            right: 14.h,
          ),
        ),
        AppbarTrailingImage(
          imagePath: ImageConstant.imgIcon,
          margin: EdgeInsets.only(
            left: 14.h,
            top: 14.v,
            right: 40.h,
          ),
        ),
      ],
      styleType: Style.bgShadow,
    );
  }

  /// Section Widget
  Widget _buildTab(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 88.v,
        child: Consumer<ExploreProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: EdgeInsets.only(right: 15.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 8.h,
                );
              },
              itemCount: provider.exploreModelObj.tabItemList.length,
              itemBuilder: (context, index) {
                TabItemModel model =
                    provider.exploreModelObj.tabItemList[index];
                return TabItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTab1(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 88.v,
        child: Consumer<ExploreProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              padding: EdgeInsets.only(right: 15.h),
              scrollDirection: Axis.horizontal,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  width: 8.h,
                );
              },
              itemCount: provider.exploreModelObj.tab1ItemList.length,
              itemBuilder: (context, index) {
                Tab1ItemModel model =
                    provider.exploreModelObj.tab1ItemList[index];
                return Tab1ItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTab2(BuildContext context) {
    return SizedBox(
      height: 88.v,
      child: Consumer<ExploreProvider>(
        builder: (context, provider, child) {
          return ListView.separated(
            padding: EdgeInsets.only(right: 15.h),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                width: 8.h,
              );
            },
            itemCount: provider.exploreModelObj.tab2ItemList.length,
            itemBuilder: (context, index) {
              Tab2ItemModel model =
                  provider.exploreModelObj.tab2ItemList[index];
              return Tab2ItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }
}
