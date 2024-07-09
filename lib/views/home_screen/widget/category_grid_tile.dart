import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/typography.dart';

Container categoryGridTile() {
  return Container(
    height: 109.h,
    width: 98.w,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(12.r)),
    child: Column(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.purpleBackgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r)),
            ),
            child: SvgPicture.asset(
              AssetsUrl.plumber,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Center(
                child: Text(
              "Plumber",
              style: TextStyle(fontFamily: Typo.medium, fontSize: 12.sp),
            )),
          ),
        )
      ],
    ),
  );
}
