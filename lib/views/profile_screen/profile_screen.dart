import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/profile_screen/change_password/change_password.dart';
import 'package:handyman_user/views/profile_screen/edit_profile/edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  static String id = "ProfileScreen";

  List genralIcons = [
    AssetsUrl.darkMode,
    AssetsUrl.lock,
    AssetsUrl.language,
    AssetsUrl.heart,
    AssetsUrl.starFaint,
  ];
  List aboutIcons = [
    AssetsUrl.shied,
    AssetsUrl.document,
    AssetsUrl.help,
    AssetsUrl.dangerCircle,
  ];

  List generalTitles = [
    "Dark Mode",
    "Change Password",
    "App Language",
    "Favourite Service",
    "Rate Us",
    "Privacy Policy",
    "Terms & Conditions",
    "Help Support",
    "About",
  ];
  List aboutTitles = [
    "Privacy Policy",
    "Terms & Conditions",
    "Help Support",
    "About",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50.r,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).goNamed(EditProfile.id);
                      },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: AppColors.primary,
                        child: SvgPicture.asset(AssetsUrl.edit),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.h,
              ),
              Text(
                "Saul Armstrong",
                style: TextStyle(fontFamily: Typo.medium, fontSize: 22.sp),
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                "saularmstrong@gmail.com",
                style: TextStyle(
                    fontFamily: Typo.medium,
                    fontSize: 16.sp,
                    color: AppColors.body),
              ),
              SizedBox(
                height: 32.h,
              ),
              Container(
                padding:
                    Spacing.screenPadding.copyWith(top: 12.h, bottom: 12.h),
                width: double.infinity,
                color: AppColors.backgroundColor,
                child: Text(
                  "GENERAL",
                  style: TextStyle(
                      fontFamily: Typo.semiBold,
                      fontSize: 12.sp,
                      color: AppColors.primary),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 240.h,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: SvgPicture.asset(genralIcons[index]),
                        title: Text(
                          "${generalTitles[index]}",
                          style: TextStyle(
                              fontFamily: Typo.medium,
                              fontSize: 14.sp,
                              color: AppColors.heading),
                        ),
                        trailing: index == 0
                            ? Switch(
                                value: false,
                                onChanged: (value) {
                                  value = value;
                                })
                            : SvgPicture.asset(AssetsUrl.arrowRight),
                        onTap: () {
                          index == 1
                              ? GoRouter.of(context).goNamed(ChangePassword.id)
                              : ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                  content: Text("Nothing Here"),
                                  backgroundColor: Colors.red,
                                ));
                        });
                  },
                ),
              ),
              Container(
                padding:
                    Spacing.screenPadding.copyWith(top: 12.h, bottom: 12.h),
                width: double.infinity,
                color: AppColors.backgroundColor,
                child: Text(
                  "ABOUT APP",
                  style: TextStyle(
                      fontFamily: Typo.semiBold,
                      fontSize: 12.sp,
                      color: AppColors.primary),
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 200.h,
                child: ListView.builder(
                  clipBehavior: Clip.none,
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SvgPicture.asset(aboutIcons[index]),
                      title: Text(
                        "${aboutTitles[index]}",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14.sp,
                            color: AppColors.heading),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              FilledButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: AppColors.scaffoldBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 56.h, horizontal: 24.w),
                            width: 342.w,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(AssetsUrl.logout),
                                SizedBox(
                                  height: 48.h,
                                ),
                                Text(
                                  "Oh No, Your are leaving",
                                  style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 22.sp,
                                      color: AppColors.heading),
                                ),
                                SizedBox(
                                  height: 12.h,
                                ),
                                Text(
                                  "Are you sure you want to logout",
                                  style: TextStyle(
                                      fontFamily: Typo.medium,
                                      fontSize: 14.sp,
                                      color: AppColors.body),
                                ),
                                SizedBox(
                                  height: 32.h,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: FilledButton(
                                        style: FilledButton.styleFrom(
                                          backgroundColor:
                                              AppColors.scaffoldBackgroundColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "No",
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                        onPressed: () {
                                          FirebaseAuth auth =
                                              FirebaseAuth.instance;
                                          auth.signOut();
                                          // Add your booking logic here
                                        },
                                        child: Text(
                                          "Yes",
                                          style: TextStyle(
                                              fontFamily: Typo.medium,
                                              fontSize: 14.sp,
                                              color: AppColors
                                                  .scaffoldBackgroundColor),
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
                  },
                  child: Text("Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
