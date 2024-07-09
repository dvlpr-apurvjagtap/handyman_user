import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Correct import for flutter_svg
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/home_screen/booking_steps/book_service_step_one.dart';
import 'package:handyman_user/views/home_screen/home_screen.dart';
import 'package:handyman_user/views/home_screen/widget/service_list_card.dart';

class ServiceDetail extends StatelessWidget {
  const ServiceDetail({super.key});

  static String id = "ServiceDetail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        AssetsUrl.serviceBg,
                        width: double.infinity,
                        height: 381.h,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        right: 20.w,
                        top: 20.h,
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundColor: AppColors.scaffoldBackgroundColor,
                          child: SvgPicture.asset(
                            AssetsUrl.like,
                            width: 16.w,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 289.h,
                        left: 20.w,
                        child: Container(
                          width: 335.w,
                          padding: EdgeInsets.symmetric(
                            vertical: 24.h,
                            horizontal: 16.w,
                          ),
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset.zero,
                                  blurRadius: 10,
                                  color: AppColors.body,
                                  spreadRadius: 0.1,
                                  blurStyle: BlurStyle.outer)
                            ],
                            color: AppColors.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Electronics",
                                    style: TextStyle(
                                      fontFamily: Typo.semiBold,
                                      fontSize: 14.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Spacing.widthBox(6.w),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 14.w,
                                    color: AppColors.primary,
                                  ),
                                  Spacing.widthBox(6.w),
                                  Text(
                                    "Installation",
                                    style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.body,
                                    ),
                                  ),
                                ],
                              ),
                              Spacing.heightBox(24.h),
                              Text(
                                "TV Wall Mount Installation",
                                style: TextStyle(
                                  fontFamily: Typo.medium,
                                  fontSize: 22.sp,
                                  color: AppColors.heading,
                                ),
                              ),
                              Spacing.heightBox(16.h),
                              Row(
                                children: [
                                  Text(
                                    "\$500",
                                    style: TextStyle(
                                      fontFamily: Typo.bold,
                                      fontSize: 20.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Spacing.widthBox(12.w),
                                  Text(
                                    "10% off",
                                    style: TextStyle(
                                      fontFamily: Typo.semiBold,
                                      fontSize: 14.sp,
                                      color: AppColors.body,
                                    ),
                                  ),
                                ],
                              ),
                              Spacing.heightBox(24.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Duration :",
                                    style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.heading,
                                    ),
                                  ),
                                  Text(
                                    "01 Hour",
                                    style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                              Spacing.heightBox(12.h),
                              Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rating :",
                                    style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.heading,
                                    ),
                                  ),
                                  Spacer(),
                                  SvgPicture.asset(AssetsUrl.star),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.body,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: Spacing.screenPadding.copyWith(top: 172.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: TextStyle(
                            fontFamily: Typo.semiBold,
                            fontSize: 18.sp,
                            color: AppColors.heading,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
                          style: TextStyle(
                            fontFamily: Typo.regular,
                            fontSize: 14.sp,
                            color: AppColors.body,
                          ),
                        ),
                        Spacing.heightBox(40),
                        Text(
                          "Avaliable At",
                          style: TextStyle(
                              fontFamily: Typo.medium, fontSize: 18.sp),
                        ),
                        Spacing.heightBox(13),
                        Row(
                          children: List.generate(
                            3,
                            (index) => Container(
                              decoration: BoxDecoration(
                                  color: AppColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(5.r)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10.h, horizontal: 12.w),
                              margin: EdgeInsets.only(right: 16.w),
                              child: Text(
                                "New York",
                                style: TextStyle(
                                    fontFamily: Typo.medium, fontSize: 14.sp),
                              ),
                            ),
                          ),
                        ),
                        Spacing.heightBox(40.h),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(24.w),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 40,
                                    child: Image.asset(
                                      AssetsUrl.worker,
                                      width: 80.w,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 16.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Leslie Alexxander",
                                        style: TextStyle(
                                            fontFamily: Typo.medium,
                                            fontSize: 18.sp,
                                            color: AppColors.heading),
                                      ),
                                      SizedBox(
                                        height: 12.h,
                                      ),
                                      RatingBar.builder(
                                        itemPadding: EdgeInsets.only(right: 4),
                                        itemCount: 5,
                                        initialRating: 5,
                                        itemSize: 12.w,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SvgPicture.asset(
                                              AssetsUrl.star);
                                        },
                                        onRatingUpdate: (double value) {
                                          print(value);
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsUrl.mailBlack),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "example@gmail.com",
                                    style: TextStyle(
                                        fontFamily: Typo.medium,
                                        fontSize: 14.sp,
                                        color: AppColors.body),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsUrl.location),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "1901 Thornridge Cir. Shiloh, Hawaii...",
                                    style: TextStyle(
                                        fontFamily: Typo.medium,
                                        fontSize: 14.sp,
                                        color: AppColors.body),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 16.h,
                              ),
                              Row(
                                children: [
                                  SvgPicture.asset(AssetsUrl.callingBlack),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "1234567890",
                                    style: TextStyle(
                                        fontFamily: Typo.medium,
                                        fontSize: 14.sp,
                                        color: AppColors.body),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Spacing.heightBox(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviews",
                              style: TextStyle(
                                  fontFamily: Typo.medium,
                                  fontSize: 16.sp,
                                  color: AppColors.heading),
                            ),
                            Text(
                              "Veiw All",
                              style: TextStyle(
                                  fontFamily: Typo.medium,
                                  fontSize: 12.sp,
                                  color: AppColors.body),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 25,
                            ),
                            SizedBox(
                              width: 16.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Donna Bins",
                                      style: TextStyle(
                                          fontFamily: Typo.medium,
                                          fontSize: 14.sp,
                                          color: AppColors.heading),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "02 Dec",
                                      style: TextStyle(
                                          fontFamily: Typo.medium,
                                          fontSize: 12.sp,
                                          color: AppColors.body),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                RatingBar.builder(
                                  itemPadding: EdgeInsets.only(right: 4),
                                  itemCount: 5,
                                  initialRating: 5,
                                  itemSize: 16.w,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SvgPicture.asset(AssetsUrl.star);
                                  },
                                  onRatingUpdate: (double value) {
                                    print(value);
                                  },
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Text(
                                  "Amet minim mollit non deserunt\nsit aliqua dolor do amet. ",
                                  style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.body),
                                )
                              ],
                            ),
                            Text(
                              "Edit",
                              style: TextStyle(
                                  fontFamily: Typo.semiBold,
                                  fontSize: 12.sp,
                                  color: AppColors.primary),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Spacing.heightBox(40),
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    color: AppColors.backgroundColor,
                    padding: EdgeInsets.only(left: 20.w, top: 24.h),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Related Services",
                              style: TextStyle(
                                  fontFamily: Typo.medium,
                                  fontSize: 18.sp,
                                  color: AppColors.heading),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Text(
                                "View All",
                                style: TextStyle(
                                    fontFamily: Typo.medium,
                                    fontSize: 14.sp,
                                    color: AppColors.body),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16.h,
                        ),

                        //card
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              3,
                              (index) => ServiceListCard(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Container(
                width: 375.w,
                padding: Spacing.screenPadding,
                child: FilledButton(
                  onPressed: () {
                    GoRouter.of(context).goNamed(BookingStepOne.id);
                  },
                  child: Text("Continue"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
