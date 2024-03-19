import '../models/tab_item_model.dart';
import 'package:planet_tiktok_app/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';

// ignore: must_be_immutable
class TabItemWidget extends StatelessWidget {
  TabItemWidget(
    this.tabItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  TabItemModel tabItemModelObj;

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
        children: [
          CustomIconButton(
            height: 48.adaptSize,
            width: 48.adaptSize,
            padding: EdgeInsets.all(5.h),
            child: CustomImageView(
              imagePath: ImageConstant.imgIcon,
            ),
          ),
          SizedBox(height: 11.v),
          Text(
            tabItemModelObj.title!,
            style: theme.textTheme.bodySmall,
          ),
          SizedBox(height: 8.v),
        ],
      ),
    );
  }
}
