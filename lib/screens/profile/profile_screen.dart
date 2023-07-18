import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/utils/app_colors.dart';
import '../../core/utils/image_constant.dart';
import '../../widgets/main_widgets/drawer.dart';
import '../../widgets/sub_widgets/cbutton.dart';
import '../../widgets/sub_widgets/ctext.dart';
import '../../widgets/sub_widgets/text_with_heading.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CDrawer(),
      backgroundColor: AppColors.scafflodBackground,
      appBar: AppBar(
          iconTheme: const IconThemeData(size: 30, color: Colors.black),
          title: ctext("Profile", fontSize: 20, fontWeight: FontWeight.w700),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColors.scafflodBackground),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 25,
          ),
          Center(
            child: Hero(
              tag: 'ProfilePhoto',
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(ImageConstant.dummyPerson)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: ctext("Jayesh Chudasama",
                  fontSize: 20, fontWeight: FontWeight.w600)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: textWithHeading(
              title: "Email",
              subTitle: "Admin@gmail.com",
              fontSize: 14,
              maxLines: 1,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: textWithHeading(
                title: "Last Login",
                subTitle: "09/01/2023 - 9:35 AM",
                maxLines: 1,
                fontSize: 14),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 60,
            width: double.maxFinite,
            color: AppColors.lightOrange,
            child: Center(
                child: ctext("🕑 Today's Working Hours: 01:10", fontSize: 14)),
          ),
          Divider(
            color: AppColors.black20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.lightsblue2,
                      child: Image.asset(
                        IconConstant.user,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ctext("My Profile", fontSize: 14),
                  ],
                ),
                VerticalDivider(
                  color: AppColors.black50,
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.lightsblue2,
                      child: Image.asset(
                        IconConstant.email,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ctext("Mail", fontSize: 14),
                  ],
                ),
                const VerticalDivider(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.lightsblue2,
                      child: Image.asset(
                        IconConstant.logout,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    ctext("Logout", fontSize: 14),
                  ],
                ),
              ],
            ),
          ),
          Divider(
            color: AppColors.black20,
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ctext("Need Help?", fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.lightsblue2,
                  child: Image.asset(
                    IconConstant.email,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  width: 6,
                ),
                ctext("Infotravel.com", color: AppColors.black50, fontSize: 14),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                cButton(
                  onTap: () {
                    Get.back();
                  },
                  "Close",
                  icon: IconConstant.close,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
