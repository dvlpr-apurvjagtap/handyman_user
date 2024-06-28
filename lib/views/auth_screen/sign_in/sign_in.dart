import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/assets_url.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/spacing.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/controllers/auth_controller.dart';
import 'package:handyman_user/views/auth_screen/sign_up/sign_up.dart';
import 'package:handyman_user/views/home_screen/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

extension on int {
  SizedBox get widthBox {
    return SizedBox(
      width: this.toDouble().w,
    );
  }
}

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

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static String id = "SignInScreen";

  TextEditingController emailField = TextEditingController();
  TextEditingController passField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: Spacing.screenPadding.copyWith(top: 100.h),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                //welcome text

                "Hello Sara!".text.fontFamily(Typo.medium).size(22.sp).make(),
                SizedBox(
                  height: 16.h,
                ),
                "Welcome Back, You Have Been \n Missed For Long Time"
                    .text
                    .fontFamily(Typo.medium)
                    .size(16.sp)
                    .color(AppColors.body)
                    .align(TextAlign.center)
                    .make(),
                HeightBox(80.h),
                //Input fields
                TextFormField(
                  controller: emailField,
                  validator: (value) {
                    if (value == null || value.trim() == "") {
                      return "Please Enter Email Address";
                    }
                  },
                  decoration: InputDecoration(
                    label:
                        Text("Email Address", style: Typo.textFieldLabelStyle),
                    suffixIcon: Image.asset(AssetsUrl.mail),
                  ),
                ),
                HeightBox(24.h),
                TextFormField(
                  controller: passField,
                  validator: (value) {
                    if (value == null || value.trim() == "") {
                      return "Please Enter Password";
                    }
                  },
                  decoration: InputDecoration(
                    label: Text("Password", style: Typo.textFieldLabelStyle),
                    suffixIcon: Image.asset(AssetsUrl.hide),
                  ),
                ),
                20.widthBox,

                Row(
                  children: [
                    Checkbox(
                        activeColor: AppColors.primary,
                        value: true,
                        onChanged: (value) {
                          value = true;
                        }),
                    "Remember me"
                        .text
                        .fontFamily(Typo.medium)
                        .size(12.sp)
                        .color(AppColors.body)
                        .make(),
                    Spacer(),
                    "Forgot Password?"
                        .text
                        .fontFamily(Typo.semiBold)
                        .size(12.sp)
                        .color(AppColors.primary)
                        .make(),
                  ],
                ),
                HeightBox(40.h),
                //login button
                Consumer<AuthController>(builder: (context, controller, _) {
                  return FilledButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // bool? signInResult =
                        await controller
                            .userSignIn(
                          context,
                          email: emailField.text.trim(),
                          pass: passField.text.trim(),
                        )
                            .then(
                          (value) {
                            if (value == true) {
                              GoRouter.of(context).goNamed(HomeScreen.id);
                            }
                          },
                        );

                        // if (signInResult == true) {
                        //   GoRouter.of(context).goNamed(HomeScreen.id);
                        // }
                      }
                    },
                    child: controller.isLoading
                        ? CustomCricularIndicator()
                        : Text(
                            "LOGIN",
                          ),
                  );
                }),
                // HeightBox(5.h),

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
                        GoRouter.of(context).goNamed(SignUpScreen.id);
                      },
                      child: Text(
                        "Sign Up",
                      ),
                    ),
                  ],
                ),
                HeightBox(90.h),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 10,
                      ),
                    ),
                    "Or Continue With"
                        .text
                        .fontFamily(Typo.medium)
                        .size(14.sp)
                        .color(AppColors.body)
                        .make(),
                    Expanded(
                        child: Divider(
                      indent: 10,
                      endIndent: 10,
                    )),
                  ],
                ),
                HeightBox(16.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.backgroundColor,
                      child: SvgPicture.asset(AssetsUrl.googleIcon),
                    ),
                    WidthBox(20.w),
                    CircleAvatar(
                      radius: 25.r,
                      backgroundColor: AppColors.backgroundColor,
                      child: SvgPicture.asset(AssetsUrl.phoneHighlight),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
