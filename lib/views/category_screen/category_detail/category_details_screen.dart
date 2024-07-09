import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/app_lists.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/controllers/category_screen_controller.dart';
import 'package:handyman_user/views/category_screen/service_filter/service_filter.dart';
import 'package:provider/provider.dart';

class CategoryDetailsScreen extends StatelessWidget {
  CategoryDetailsScreen({super.key, required this.category});

  String category;

  static String id = "CategoryDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_rounded,
            )),
        backgroundColor: AppColors.primary,
        title: Text(
          category,
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: Spacing.screenPadding.copyWith(top: 24.h),
        child: Consumer<CategoryScreenController>(
          builder: (context, controller, _) {
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: SvgPicture.asset(
                            AssetsUrl.search,
                            fit: BoxFit.scaleDown,
                          ),
                          hintText: "Search here...",
                          hintStyle: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    GestureDetector(
                      onTap: () =>
                          GoRouter.of(context).goNamed(ServiceFilter.id),
                      child: Container(
                        width: 48.w,
                        height: 48.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: SvgPicture.asset(
                          AssetsUrl.fiter,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      AppLists.category.length,
                      (index) => GestureDetector(
                        onTap: () {
                          controller.updateCategory(AppLists.category[index]);
                          controller.loadAndFilterCategories();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: controller.category ==
                                      AppLists.category[index]
                                  ? AppColors.primary
                                  : AppColors.backgroundColor,
                              borderRadius: BorderRadius.circular(50)),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 25.w),
                          margin: EdgeInsets.only(right: 16.w),
                          child: Text(
                            "${AppLists.category[index]}",
                            style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: controller.category ==
                                      AppLists.category[index]
                                  ? AppColors.scaffoldBackgroundColor
                                  : AppColors.heading,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.h,
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: controller.availableCategories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 24.h),
                      child: Stack(
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
                                  width: 335.w,
                                  height: 160.h,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                // height: 166.h,
                                width: 335.w,
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
                                    Row(
                                      children: [
                                        RatingBar.builder(
                                          itemPadding:
                                              EdgeInsets.only(right: 4),
                                          itemCount: 5,
                                          initialRating: 5,
                                          itemSize: 12.w,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return SvgPicture.asset(
                                                AssetsUrl.star);
                                          },
                                          onRatingUpdate: (double value) {
                                            print(value);
                                          },
                                        ),
                                        Text(
                                          "${controller.availableCategories[index].rating}",
                                          style: TextStyle(
                                              fontFamily: Typo.semiBold,
                                              fontSize: 14.sp,
                                              color: AppColors.body),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text(
                                      "${controller.availableCategories[index].serviceName}",
                                      style: TextStyle(
                                          fontFamily: Typo.medium,
                                          fontSize: 14.sp,
                                          color: AppColors.heading),
                                    ),
                                    SizedBox(
                                      height: 22.h,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          AssetsUrl.worker,
                                          width: 30.w,
                                        ),
                                        SizedBox(
                                          width: 16.w,
                                        ),
                                        Text(
                                          "${controller.availableCategories[index].provider}",
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

                          //on top
                          // Positioned(
                          //   top: 10.h,
                          //   left: 10.w,
                          //   child: Container(
                          //     padding:
                          //         EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          //     decoration: BoxDecoration(
                          //       color: Colors.white,
                          //       borderRadius: BorderRadius.circular(50),
                          //     ),
                          //     child: Text(
                          //       "FIXING",
                          //       style: TextStyle(
                          //           fontFamily: Typo.semiBold,
                          //           fontSize: 10.sp,
                          //           color: AppColors.primary),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            top: 145.h,
                            right: 17.w,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 7, horizontal: 12),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(width: 3, color: Colors.white),
                              ),
                              child: Text(
                                "\$${controller.availableCategories[index].price}",
                                style: TextStyle(
                                    fontFamily: Typo.semiBold,
                                    fontSize: 16.sp,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ))
              ],
            );
          },
        ),
      ),
    );
  }
}
