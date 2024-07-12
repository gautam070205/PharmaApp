import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:medapp/common/app_style.dart';
import 'package:medapp/common/back_ground_container.dart';
import 'package:medapp/common/custom_button.dart';
import 'package:medapp/common/reusable_text.dart';
import 'package:medapp/constants/constants.dart';
import 'package:medapp/controllers/registration_controller.dart';
import 'package:medapp/models/registration_model.dart';
import 'package:medapp/views/auth/widgets/email_textfield.dart';
import 'package:medapp/views/auth/widgets/password_textfield.dart';
import 'package:medapp/views/auth/widgets/user_textfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPage();
}

class _RegistrationPage extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _usercontroller = TextEditingController();
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
    final controller = Get.put(RegistrationController());

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
                      UsernameTextfield(
                        hintText: "Enter Username",
                        prefixIcon: const Icon(
                          Icons.person,
                          size: 22,
                          color: kGrayLight,
                        ),
                        controller: _usercontroller,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      EmailTextfield(
                        hintText: "Enter Email",
                        prefixIcon: const Icon(
                          Icons.mail,
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
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomButton(
                          text: "R E G I S T ER",
                          onTap: () {
                            if (_emailController.text.isNotEmpty &&
                                _usercontroller.text.isNotEmpty &&
                                _passwordController.text.length >= 0) {
                              RegistrationModel model = RegistrationModel(
                                  username: _usercontroller.text,
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              String data = registrationModelToJson(model);
                              controller.registeredFunction(data);
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
