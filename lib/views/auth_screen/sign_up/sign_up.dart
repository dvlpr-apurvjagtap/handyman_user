import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/controllers/auth_controller.dart';
import 'package:handyman_user/views/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

CustomCricularIndicator() {
  return SizedBox(
    width: 10.w,
    height: 10.w,
    child: CircularProgressIndicator(
      strokeWidth: 2,
      color: AppColors.scaffoldBackgroundColor,
    ),
  );
}

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static String id = "SignUpScreen";

  static GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController nameField = TextEditingController();
  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();
  TextEditingController contactField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: Spacing.screenPadding.copyWith(top: 67.h),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              children: [
                SvgPicture.asset(
                  AssetsUrl.user,
                  width: 80.w,
                ),
                SizedBox(
                  height: 24.h,
                ),
                "Hello User !"
                    .text
                    .fontFamily(Typo.medium)
                    .size(22.sp)
                    .color(AppColors.heading)
                    .make(),
                HeightBox(16.h),
                "SignUp For Better Experience"
                    .text
                    .fontFamily(Typo.medium)
                    .size(16.sp)
                    .color(AppColors.body)
                    .make(),
                HeightBox(57.h),

                //input form
                TextFormField(
                  controller: nameField,
                  decoration: InputDecoration(
                      label: Text(
                        "Full Name",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14,
                            color: AppColors.body),
                      ),
                      suffixIcon: Image.asset(AssetsUrl.profile)),
                ),
                // HeightBox(24.h),

                // TextFormField(

                //   decoration: InputDecoration(
                //       label: Text(
                //         "User Name",
                //         style: TextStyle(
                //             fontFamily: Typo.medium,
                //             fontSize: 14,
                //             color: AppColors.body),
                //       ),
                //       suffixIcon: Image.asset(AssetsUrl.profile)),
                // ),
                HeightBox(24.h),

                TextFormField(
                  controller: emailField,
                  decoration: InputDecoration(
                      label: Text(
                        "Email",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14,
                            color: AppColors.body),
                      ),
                      suffixIcon: Image.asset(AssetsUrl.mail)),
                ),
                HeightBox(24.h),

                TextFormField(
                  controller: passField,
                  decoration: InputDecoration(
                      label: Text(
                        "Password",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14,
                            color: AppColors.body),
                      ),
                      suffixIcon: Image.asset(AssetsUrl.hide)),
                ),
                HeightBox(24.h),

                TextFormField(
                  controller: contactField,
                  decoration: InputDecoration(
                      label: Text(
                        "Contact Number",
                        style: TextStyle(
                            fontFamily: Typo.medium,
                            fontSize: 14,
                            color: AppColors.body),
                      ),
                      suffixIcon: Image.asset(AssetsUrl.phone)),
                ),

                HeightBox(57.h),

                //button
                Consumer<AuthController>(builder: (context, controller, _) {
                  return FilledButton(
                      onPressed: () async {
                        if (_formkey.currentState!.validate()) {
                          await controller.userSignUp(
                            email: emailField.text.trimRight(),
                            pass: passField.text.trimRight(),
                            name: nameField.text.trimRight(),
                            contact: contactField.text.trimRight(),
                          );
                          GoRouter.of(context).goNamed(HomeScreen.id);
                        }
                      },
                      child: controller.isLoading
                          ? CustomCricularIndicator()
                          : Text(
                              "SIGNUP",
                              style: TextStyle(
                                fontFamily: Typo.semiBold,
                                fontSize: 18,
                              ),
                            ));
                }),
                // HeightBox(16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "Don't have an account?"
                        .text
                        .fontFamily(Typo.medium)
                        .size(14.sp)
                        .color(AppColors.body)
                        .make(),
                    TextButton(
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: AppColors.primary,
                              fontFamily: Typo.semiBold,
                              fontSize: 14.sp),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
