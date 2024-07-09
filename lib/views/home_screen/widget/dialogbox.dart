import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/home_screen/home_screen.dart';

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(vertical: 54.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetsUrl.check),
              SizedBox(
                height: 48.h,
              ),
              Text(
                "Confirm Booking",
                style: TextStyle(fontFamily: Typo.medium, fontSize: 22.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "Are you sure you want to confirm the booking?",
                style: TextStyle(
                    fontFamily: Typo.medium,
                    fontSize: 14.sp,
                    color: AppColors.body),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColors.scaffoldBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14.sp,
                            color: AppColors.heading),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Expanded(
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        bookingSuccessfulDialog(context);
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
      );
    },
  );
}

//booking comfirm
Future<void> bookingSuccessfulDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          width: 335.w,
          padding: EdgeInsets.symmetric(vertical: 54.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(AssetsUrl.check),
              SizedBox(
                height: 48.h,
              ),
              Text(
                "Booking Successful",
                style: TextStyle(fontFamily: Typo.medium, fontSize: 22.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                "It is a long established fact that a reader will be distracted by the readable ",
                style: TextStyle(
                    fontFamily: Typo.medium,
                    fontSize: 14.sp,
                    color: AppColors.body),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40.h,
              ),
              FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    GoRouter.of(context).goNamed(HomeScreen.id);
                  },
                  child: Text("Back To Home"))
            ],
          ),
        ),
      );
    },
  );
}
