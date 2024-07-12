import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:lottie/lottie.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/back_ground_container.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/login_controller.dart';
import 'package:medapp/models/login_model.dart';
import 'package:medapp/views/auth/widgets/email_textfield.dart';
import 'package:medapp/views/auth/widgets/password_textfield.dart';
import 'package:medapp/views/auth/widgets/registration_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kPrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ReusableText(
                text: "MedicineApp",
                style: appStyle(20, kLightWhite, FontWeight.bold),
              ),
            ],
          ),
        ),
        body: BackGroundContainer(
          color: Colors.lightBlueAccent,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.r),
                topRight: Radius.circular(30.r)),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Lottie.asset("assets/anime/login.json"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      EmailTextfield(
                        hintText: "Enter Email",
                        prefixIcon: const Icon(
                          Icons.mail_outline_outlined,
                          size: 22,
                          color: kGrayLight,
                        ),
                        controller: _emailController,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      PasswordTextfields(
                        controller: _passwordController,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Get.to(() => const RegistrationPage(),
                                      transition: Transition.fadeIn,
                                      duration:
                                          const Duration(milliseconds: 1200));
                                },
                                child: ReusableText(
                                    text: "Register",
                                    style: appStyle(
                                        12, Colors.blue, FontWeight.normal))),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                          text: "LOGIN ",
                          onTap: () {
                            if (_emailController.text.isNotEmpty &&
                                _passwordController.text.length >= 0) {
                              LoginModel model = LoginModel(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              String data = loginModelToJson(model);
                              controller.loginFunction(data);
                              //loginfunction
                            }
                          },
                          btnHeight: 35.h,
                          btnWidth: width),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
