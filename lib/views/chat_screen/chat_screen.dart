import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:handyman_user/consts/color_pallet.dart';
import 'package:handyman_user/consts/typography.dart';
import 'package:handyman_user/views/home_screen/service_detail/service_detail.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static String id = "ChatScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Chat"),
          leading: Icon(Icons.arrow_back_ios_rounded),
        ),
        body: ListView.separated(
          itemCount: 40,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {},
              leading: CircleAvatar(
                radius: 30.r,
                child: Text("a"),
              ),
              title: Text(
                'PRObity ',
                style: TextStyle(
                    fontFamily: Typo.medium,
                    fontSize: 16.sp,
                    color: AppColors.heading),
              ),
              subtitle: Text(
                'You Are Hired!!',
                style: TextStyle(
                    fontFamily: Typo.medium,
                    fontSize: 14.sp,
                    color: AppColors.body),
              ),
              trailing: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 10,
                child: Text(
                  "3",
                  style: TextStyle(
                      fontFamily: Typo.medium,
                      fontSize: 12.sp,
                      color: AppColors.scaffoldBackgroundColor),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ));
  }
}
