import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/models/service_data_model.dart';
import 'package:handyman_user/views/home_screen/service_detail/service_detail.dart';

class ServiceListCard extends StatelessWidget {
  ServiceListCard({super.key, model});

  ServiceDataModel? model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).goNamed(ServiceDetail.id),
      child: Container(
        margin: EdgeInsets.only(right: 20),
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
                    AssetsUrl.paintingServices,
                    width: 280.w,
                    height: 145.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  // height: 166.h,
                  width: 280.w,
                  padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                        itemPadding: EdgeInsets.only(right: 6),
                        itemCount: 5,
                        initialRating: 5,
                        itemSize: 12.w,
                        itemBuilder: (BuildContext context, int index) {
                          return SvgPicture.asset(AssetsUrl.star);
                        },
                        onRatingUpdate: (double value) {
                          print(value);
                        },
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        "Painting For Beautiful \nHomes..",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 16.sp,
                            color: AppColors.heading),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        children: [
                          Image.asset(AssetsUrl.worker),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            "Wade Warren",
                            style: TextStyle(
                                fontFamily: Typo.medium,
                                fontSize: 14.sp,
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
            Positioned(
              top: 16.h,
              left: 14.w,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  "PAINTING",
                  style: TextStyle(
                      fontFamily: Typo.semiBold,
                      fontSize: 10.sp,
                      color: AppColors.primary),
                ),
              ),
            ),
            Positioned(
              top: 131.h,
              right: 13.w,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(width: 3, color: Colors.white),
                ),
                child: Text(
                  "\$150",
                  style: TextStyle(
                      fontFamily: Typo.semiBold,
                      fontSize: 16.sp,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
