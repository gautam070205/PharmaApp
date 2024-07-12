import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/common/custom_container.dart';
import 'package:medapp/controllers/login_controller.dart';
import 'package:medapp/models/login_response.dart';
import 'package:medapp/views/auth/widgets/login_redirect.dart';
import 'package:medapp/views/profile/widgets/profile_app_bar.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/views/profile/widgets/profile_tile_widget.dart';
import 'package:medapp/views/profile/widgets/user_info_widget.dart';
import 'package:medapp/views/verification_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());
    final box = GetStorage();
    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
    }
    if (token == null) {
      return LoginRedirect();
    }
    if (user != null && user.verification == false) {
      return const VerificationPage();
    }
    return Scaffold(
      backgroundColor: kLightWhite,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.h), child: const ProfileAppBar()),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(12.w, 0, 16.w, 0),
                    height: height * 0.06,
                    width: double.infinity,
                    color: kLightWhite,
                    child: UserInfoWidget(
                      user: user,
                    ),
                  ),
                  Container(
                    height: 175.h,
                    decoration: const BoxDecoration(color: kLightWhite),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        ProfileTileWidget(
                          onTap: () {
                            Get.to(() => LoginRedirect());
                          },
                          title: "My Orders",
                          icon: Ionicons.medkit_outline,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "WishList",
                          icon: Ionicons.heart_outline,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Reviews",
                          icon: Ionicons.chatbubble_outline,
                        ),
                        ProfileTileWidget(
                          onTap: () {},
                          title: "Coupons",
                          icon: MaterialCommunityIcons.tag_outline,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Container(
                height: 175.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Shipping Address",
                      icon: Ionicons.location,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "Service Center",
                      icon: AntDesign.customerservice,
                    ),
                    ProfileTileWidget(
                      onTap: () {},
                      title: "App Feedback",
                      icon: MaterialIcons.rss_feed,
                    ),
                    ProfileTileWidget(
                        onTap: () {},
                        title: "Settings",
                        icon: AntDesign.setting),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                onTap: () {
                  controller.logout();
                },
                btnColor: kRed,
                text: "LogOut",
                radius: 0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
