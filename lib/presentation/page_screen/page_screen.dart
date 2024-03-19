import 'package:planet_tiktok_app/widgets/app_bar/custom_app_bar.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:planet_tiktok_app/widgets/app_bar/appbar_title.dart';
import 'package:planet_tiktok_app/widgets/custom_text_form_field.dart';
import 'package:planet_tiktok_app/core/utils/validation_functions.dart';
import 'models/chip_item_model.dart';
import '../page_screen/widgets/chip_item_widget.dart';
import 'package:planet_tiktok_app/widgets/custom_outlined_button.dart';
import 'package:planet_tiktok_app/widgets/custom_elevated_button.dart';
import 'models/page_model.dart';
import 'package:flutter/material.dart';
import 'package:planet_tiktok_app/core/app_export.dart';
import 'provider/page_provider.dart';

class PageScreen extends StatefulWidget {
  const PageScreen({Key? key}) : super(key: key);

  @override
  PageScreenState createState() => PageScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PageProvider(), child: PageScreen());
  }
}

// ignore_for_file: must_be_immutable
class PageScreenState extends State<PageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            body: SizedBox(
                width: SizeUtils.width,
                child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Form(
                        key: _formKey,
                        child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.h, vertical: 13.v),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("lbl_full_name".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 5.v),
                                  _buildFullName(context),
                                  SizedBox(height: 13.v),
                                  Text("lbl_email".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 5.v),
                                  _buildEmail(context),
                                  SizedBox(height: 13.v),
                                  Text("lbl_location".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 5.v),
                                  _buildLocation(context),
                                  SizedBox(height: 13.v),
                                  Text("lbl_gender".tr,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(height: 5.v),
                                  _buildChip(context),
                                  SizedBox(height: 28.v),
                                  _buildAvatar(context),
                                  SizedBox(height: 12.v),
                                  _buildSaveChanges(context),
                                  SizedBox(height: 5.v)
                                ])))))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 32.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 8.h, top: 12.v, bottom: 12.v),
            onTap: () {
              onTapArrowLeft(context);
            }),
        title: AppbarTitle(
            text: "lbl_update_profile".tr, margin: EdgeInsets.only(left: 8.h)),
        styleType: Style.bgShadow_1);
  }

  /// Section Widget
  Widget _buildFullName(BuildContext context) {
    return Selector<PageProvider, TextEditingController?>(
        selector: (context, provider) => provider.fullNameController,
        builder: (context, fullNameController, child) {
          return CustomTextFormField(
              controller: fullNameController, hintText: "lbl_john_doe".tr);
        });
  }

  /// Section Widget
  Widget _buildEmail(BuildContext context) {
    return Selector<PageProvider, TextEditingController?>(
        selector: (context, provider) => provider.emailController,
        builder: (context, emailController, child) {
          return CustomTextFormField(
              controller: emailController,
              hintText: "msg_johndie123_gmail_com".tr,
              textInputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || (!isValidEmail(value, isRequired: true))) {
                  return "err_msg_please_enter_valid_email".tr;
                }
                return null;
              });
        });
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Selector<PageProvider, TextEditingController?>(
        selector: (context, provider) => provider.locationController,
        builder: (context, locationController, child) {
          return CustomTextFormField(
              controller: locationController,
              hintText: "lbl_united_states".tr,
              textInputAction: TextInputAction.done);
        });
  }

  /// Section Widget
  Widget _buildChip(BuildContext context) {
    return Consumer<PageProvider>(builder: (context, provider, child) {
      return Wrap(
          runSpacing: 8.v,
          spacing: 8.h,
          children: List<Widget>.generate(
              provider.pageModelObj.chipItemList.length, (index) {
            ChipItemModel model = provider.pageModelObj.chipItemList[index];
            return ChipItemWidget(model, onSelectedChipView1: (value) {
              provider.onSelectedChipView1(index, value);
            });
          }));
    });
  }

  /// Section Widget
  Widget _buildUpload(BuildContext context) {
    return CustomOutlinedButton(
        height: 22.v,
        width: 64.h,
        text: "lbl_upload".tr,
        margin: EdgeInsets.symmetric(vertical: 9.v),
        rightIcon: Container(
            margin: EdgeInsets.only(left: 2.h),
            child: CustomImageView(
                imagePath: ImageConstant.imgArrowright,
                height: 12.adaptSize,
                width: 12.adaptSize)),
        buttonStyle: CustomButtonStyles.outlinePrimary);
  }

  /// Section Widget
  Widget _buildAvatar(BuildContext context) {
    return Row(children: [
      Container(
          height: 40.adaptSize,
          width: 40.adaptSize,
          decoration: AppDecoration.fillPrimary1
              .copyWith(borderRadius: BorderRadiusStyle.circleBorder20),
          child: CustomImageView(
              imagePath: ImageConstant.imgDownload140x40,
              height: 40.adaptSize,
              width: 40.adaptSize,
              radius: BorderRadius.circular(20.h),
              alignment: Alignment.center)),
      Padding(
          padding: EdgeInsets.only(left: 12.h, top: 9.v, bottom: 11.v),
          child: Text("lbl_profile_picture".tr,
              style: theme.textTheme.titleMedium)),
      Spacer(),
      _buildUpload(context)
    ]);
  }

  /// Section Widget
  Widget _buildSaveChanges(BuildContext context) {
    return CustomElevatedButton(text: "lbl_save_changes".tr);
  }

  /// Navigates to the previous screen.
  onTapArrowLeft(BuildContext context) {
    NavigatorService.goBack();
  }
}
