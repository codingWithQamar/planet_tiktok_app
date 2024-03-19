import '../models/chip_item_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';

// ignore: must_be_immutable
class ChipItemWidget extends StatelessWidget {
  ChipItemWidget(
    this.chipItemModelObj, {
    Key? key,
    this.onSelectedChipView1,
  }) : super(
          key: key,
        );

  ChipItemModel chipItemModelObj;

  Function(bool)? onSelectedChipView1;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 9.v,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        chipItemModelObj.chip!,
        style: TextStyle(
          color: theme.colorScheme.primary.withOpacity(1),
          fontSize: 14.fSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
        ),
      ),
      selected: (chipItemModelObj.isSelected ?? false),
      backgroundColor: theme.colorScheme.primary.withOpacity(0.05),
      selectedColor: theme.colorScheme.primary.withOpacity(0.05),
      shape: (chipItemModelObj.isSelected ?? false)
          ? RoundedRectangleBorder(
              side: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.6),
                width: 1.h,
              ),
              borderRadius: BorderRadius.circular(
                6.h,
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                6.h,
              ),
            ),
      onSelected: (value) {
        onSelectedChipView1?.call(value);
      },
    );
  }
}
