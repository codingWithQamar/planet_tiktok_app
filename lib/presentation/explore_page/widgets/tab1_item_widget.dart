import '../models/tab1_item_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';

// ignore: must_be_immutable
class Tab1ItemWidget extends StatelessWidget {
  Tab1ItemWidget(
    this.tab1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Tab1ItemModel tab1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 33.h,
        vertical: 3.v,
      ),
      decoration: AppDecoration.outlinePrimary.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder6,
      ),
      width: 116.h,
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
              tab1ItemModelObj.videoCounter!,
              style: theme.textTheme.bodySmall,
            ),
          ),
          SizedBox(height: 8.v),
        ],
      ),
    );
  }
}
