import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/home_screen/booking_steps/booking_service_step_two.dart';
import 'package:handyman_user/views/home_screen/widget/dotted_divider.dart';

class BookingStepOne extends StatelessWidget {
  const BookingStepOne({super.key});
  static String id = "BookingStepOne";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Text("Book Service"),
      ),
      body: Container(
        width: double.infinity,
        padding: Spacing.screenPadding.copyWith(top: 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.primary,
                      child: Text(
                        "01",
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
                      "Step1",
                      style: TextStyle(
                          fontFamily: Typo.medium,
                          fontSize: 14.sp,
                          color: AppColors.heading),
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
                    Container(
                      height: 37.w,
                      width: 37.w,
                      decoration: BoxDecoration(
                          color: AppColors.backgroundColor,
                          border: Border.all(color: AppColors.borderColor),
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Center(
                        child: Text(
                          "02",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.body),
                        ),
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
                          color: AppColors.body),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              "Enter Detail Information",
            ),
            SizedBox(
              height: 16.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date And Time :",
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        fillColor: AppColors.scaffoldBackgroundColor,
                        hintText: "Enter Date And Time",
                        hintStyle: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 12.sp,
                            color: AppColors.body),
                        prefixIcon: SvgPicture.asset(
                          AssetsUrl.calender,
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Your Address",
                    style: TextStyle(fontFamily: Typo.medium, fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  TextFormField(
                    maxLines: 4,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        fillColor: AppColors.scaffoldBackgroundColor,
                        hintText: "Enter your Address",
                        hintStyle: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 12.sp,
                            color: AppColors.body),
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 65.h),
                          child: SvgPicture.asset(
                            AssetsUrl.locationFaint,
                            // fit: BoxFit.scaleDown,
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(),
                      Text(
                        "Use Current Location",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 12.sp,
                            color: AppColors.primary),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            FilledButton(
                onPressed: () {
                  GoRouter.of(context).goNamed(BookingStepTwo.id);
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                      fontFamily: Typo.medium,
                      fontSize: 16.sp,
                      color: AppColors.scaffoldBackgroundColor),
                ))
          ],
        ),
      ),
    );
  }
}
