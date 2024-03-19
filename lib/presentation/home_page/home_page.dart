import 'models/home_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';
import 'provider/home_provider.dart';

// ignore_for_file: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({Key? key})
      : super(
          key: key,
        );

  @override
  HomePageState createState() => HomePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: HomePage(),
    );
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillWhiteA,
          child: Column(
            children: [
              SizedBox(height: 29.v),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 27.h),
                child: Column(
                  children: [
                    Container(
                      decoration: AppDecoration.outlinePrimary.copyWith(
                        borderRadius: BorderRadiusStyle.roundedBorder6,
                      ),
                      child: Container(
                        width: 336.h,
                        decoration: AppDecoration.fillPrimary.copyWith(
                          borderRadius: BorderRadiusStyle.roundedBorder6,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                            Spacer(
                              flex: 47,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                "msg_simple_video_playing".tr,
                                style: theme.textTheme.titleMedium,
                              ),
                            ),
                            Spacer(
                              flex: 52,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        height: 19.v,
                        width: 291.h,
                        margin: EdgeInsets.only(left: 12.h),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding: EdgeInsets.only(top: 1.v),
                                child: Text(
                                  "msg_video_title".tr,
                                  style: CustomTextStyles.bodySmall12,
                                ),
                              ),
                            ),
                            CustomImageView(
                              imagePath: ImageConstant.imgIcon,
                              height: 19.v,
                              width: 18.h,
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(right: 66.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 4.v),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 12.h,
                        right: 21.h,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 3.v),
                            child: Text(
                              "lbl_category".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ),
                          Spacer(),
                          CustomImageView(
                            imagePath: ImageConstant.imgIcon,
                            height: 24.v,
                            width: 22.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 5.h,
                              bottom: 7.v,
                            ),
                            child: Text(
                              "lbl_add_favorites".tr,
                              style: CustomTextStyles.bodySmall12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
