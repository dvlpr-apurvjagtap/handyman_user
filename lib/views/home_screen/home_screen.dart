import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/home_screen/widget/category_grid_tile.dart';
import 'package:handyman_user/views/home_screen/widget/service_list_card.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    VxSwiper swiper = VxSwiper.builder(
      itemCount: 3,
      autoPlay: true,
      viewportFraction: 1.0,
      height: 250.h,
      itemBuilder: (context, index) {
        return Image.asset(
          AssetsUrl.swiper,
          fit: BoxFit.fill,
        );
      },
    );

    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            // Swiper elements
            Stack(
              clipBehavior: Clip.none,
              children: [
                swiper,
                Positioned(
                  right: 20.w,
                  top: 20.h,
                  child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: AppColors.scaffoldBackgroundColor,
                      child: SvgPicture.asset(
                        AssetsUrl.bell,
                        width: 16.w,
                      )),
                ),
                Positioned(
                  top: 225.h,
                  left: 35.w,
                  child: SizedBox(
                    width: 269.w,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: AppColors.scaffoldBackgroundColor,
                          prefixIcon: SvgPicture.asset(
                            AssetsUrl.location,
                            fit: BoxFit.scaleDown,
                          ),
                          suffixIcon: SvgPicture.asset(
                            AssetsUrl.focus,
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: "1901 Thornridge Cir. Shiloh...",
                          hintStyle: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 12.sp,
                          )),
                    ),
                  ),
                ),
                Positioned(
                  top: 225.h,
                  left: 320.w,
                  child: Container(
                    width: 48.w,
                    height: 48.h,
                    decoration: BoxDecoration(
                      color: AppColors.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SvgPicture.asset(
                      AssetsUrl.search,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ],
            ),

            // Categories
            Container(
              padding: Spacing.screenPadding.copyWith(top: 65.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Category",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 18.sp,
                            color: AppColors.heading),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14.sp,
                            color: AppColors.body),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  GridView.builder(
                    padding: EdgeInsets.all(0),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent: 109,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        crossAxisCount: 3),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return categoryGridTile();
                    },
                  ),
                  SizedBox(
                    height: 39.h,
                  ),
                ],
              ),
            ),

            // Services
            Container(
              width: double.infinity,
              height: 400.h,
              color: AppColors.purpleBackgroundColor,
              padding: EdgeInsets.only(left: 20.w, top: 24.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Services",
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

                  // Card
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

            // Swiper
            Spacing.heightBox(20),
            VxSwiper.builder(
              itemCount: 3,
              autoPlay: true,
              viewportFraction: 1.0,
              height: 179.h,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    AssetsUrl.cleaning,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Featured",
                    style: TextStyle(
                        fontFamily: Typo.medium,
                        fontSize: 18.sp,
                        color: AppColors.heading),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                        fontFamily: Typo.medium,
                        fontSize: 14.sp,
                        color: AppColors.body),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  2,
                  (index) => Stack(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            clipBehavior: Clip.antiAlias,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              AssetsUrl.fixingTv,
                              width: 157.w,
                              height: 100.h,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Container(
                            // height: 166.h,
                            width: 157.w,
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 15),
                            decoration: BoxDecoration(
                              color: AppColors.backgroundColor,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RatingBar.builder(
                                  itemPadding: EdgeInsets.only(right: 4),
                                  itemCount: 5,
                                  initialRating: 5,
                                  itemSize: 10.w,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SvgPicture.asset(AssetsUrl.star);
                                  },
                                  onRatingUpdate: (double value) {
                                    print(value);
                                  },
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                Text(
                                  "Fixing TV Wire...",
                                  style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.heading),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      AssetsUrl.worker,
                                      width: 25.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "Wade Warren",
                                      style: TextStyle(
                                          fontFamily: Typo.medium,
                                          fontSize: 12.sp,
                                          color: AppColors.body),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),

                      // On top
                      Positioned(
                        top: 10.h,
                        left: 10.w,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Text(
                            "FIXING",
                            style: TextStyle(
                                fontFamily: Typo.semiBold,
                                fontSize: 10.sp,
                                color: AppColors.primary),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 86.h,
                        right: 9.w,
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(width: 2, color: Colors.white),
                          ),
                          child: Text(
                            "\$150",
                            style: TextStyle(
                                fontFamily: Typo.regular,
                                fontSize: 12.sp,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
              color: AppColors.primary,
              child: Column(
                children: [
                  Image.asset(
                    AssetsUrl.stars,
                    width: 207.w,
                    height: 48.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Introducing Customer Rating",
                    style: TextStyle(
                        fontFamily: Typo.medium,
                        fontSize: 18.sp,
                        color: AppColors.scaffoldBackgroundColor),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: AppColors.scaffoldBackgroundColor,
                        minimumSize: Size(140.w, 32.h)),
                    onPressed: () {},
                    child: Text(
                      "See Your Rating",
                      style: TextStyle(
                          fontFamily: Typo.medium,
                          fontSize: 14,
                          color: AppColors.primary),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
