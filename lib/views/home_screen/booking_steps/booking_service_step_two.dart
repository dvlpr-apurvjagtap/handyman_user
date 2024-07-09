import 'package:customizable_counter/customizable_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/home_screen/widget/dialogbox.dart';
import 'package:handyman_user/views/home_screen/widget/dotted_divider.dart';

class BookingStepTwo extends StatelessWidget {
  const BookingStepTwo({super.key});
  static String id = "BookingStepTwo";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Text("Book Service"),
      ),
      body: Container(
        padding: Spacing.screenPadding.copyWith(top: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Container(
                        height: 37.w,
                        width: 37.w,
                        decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(100.r)),
                        child: Center(child: SvgPicture.asset(AssetsUrl.tick)),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Step1",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14.sp,
                            color: AppColors.body),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        width: 120.w,
                        child: DashLineView(
                          fillRate: 0.6,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 18.r,
                        backgroundColor: AppColors.primary,
                        child: Text(
                          "02",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.scaffoldBackgroundColor),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Step2",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14.sp,
                            color: AppColors.heading),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Apartment Cleaning",
                          style: TextStyle(
                              fontFamily: Typo.medium, fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomizableCounter(
                          borderColor: AppColors.scaffoldBackgroundColor,
                          backgroundColor: AppColors.scaffoldBackgroundColor,
                          decrementIcon: SvgPicture.asset(AssetsUrl.down),
                          incrementIcon: SvgPicture.asset(AssetsUrl.up),
                          count: 1,
                          step: 1,
                        )
                      ],
                    ),
                    Image.asset(
                      AssetsUrl.serviceBg,
                      width: 80.w,
                      height: 80.h,
                      fit: BoxFit.cover,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 32.h,
              ),

              //pricing
              Text(
                "Price Detail",
                style: TextStyle(
                    fontFamily: Typo.medium,
                    fontSize: 16.sp,
                    color: AppColors.heading),
              ),
              SizedBox(
                height: 8.h,
              ),

              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
                decoration: BoxDecoration(
                    color: AppColors.backgroundColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        ),
                        Text(
                          "\$120",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.body),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        ),
                        Text(
                          "\$120 * 2 = \$240",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.body),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount (5% off)",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        ),
                        Text(
                          "-\$15.12",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.body),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Tax",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        ),
                        Text(
                          "\$15.12",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.body),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Cupon(AB45789A)",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        ),
                        Text(
                          "-\$10",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.body),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Amount",
                          style: TextStyle(
                              fontFamily: Typo.semiBold,
                              fontSize: 16.sp,
                              color: AppColors.heading),
                        ),
                        Text(
                          "\$255.12",
                          style: TextStyle(
                              fontFamily: Typo.semiBold,
                              fontSize: 16.sp,
                              color: AppColors.body),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                        style: FilledButton.styleFrom(
                            backgroundColor: AppColors.scaffoldBackgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: Text(
                          "Previous",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        )),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        showMyDialog(context);
                      },
                      child: Text(
                        "Book",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14.sp,
                            color: AppColors.scaffoldBackgroundColor),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
