import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/custom_otn_btn.dart';
import 'package:task_management/common/widgets/custom_text_field.dart';
import 'package:task_management/common/widgets/height_spacer.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:country_picker/country_picker.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  final TextEditingController phone= TextEditingController();

  Country country  = Country(
      phoneCode: "1",
      countryCode: "IND",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "IND",
      example: "IND",
      displayName: "India",
      displayNameNoCountryCode: "IND",
      e164Key: "");

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ListView(
              children: [
                Padding(padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Image.asset("assets/images/todo.png",  width: 300,),),
                const HeightSpacer(height: 20),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 16.w),
                  child: ReusableText(text: "Please enter your phone number", style: appstyle(17, AppConst.kLight, FontWeight.w500)),
                ),
               const HeightSpacer(height: 20),
                Center(
                  child: CustomTextField(
                    prefixIcon: Padding(padding: const EdgeInsets.all(14),
                    child: GestureDetector(
                      onTap: (){
                        showCountryPicker(context: context,
                            countryListTheme: CountryListThemeData(
                              backgroundColor: AppConst.kLight,
                              bottomSheetHeight: AppConst.kHeight*0.6,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),)
                            ),
                            onSelect: (code){
                          setState(() {

                          });
                        });
                      },
                      child: ReusableText(text: "${country.flagEmoji} + ${country.phoneCode}", style: appstyle(18, AppConst.kBkDark, FontWeight.bold)),
                    ),),
                    hintText: 'Enter phone number', hintStyle: appstyle(16, AppConst.kBkDark, FontWeight.w600),
                    controller: phone, keyboardType: TextInputType.phone,),
                ),
               const HeightSpacer(height: 20),

                CustomOtnBtn(width: AppConst.kWidth*0.9, height: AppConst.kHeight*0.07,
                    color2: AppConst.kLight,
                    color: AppConst.kBkDark, text: "Send Code")
              ],
            ),
          ),),
    );
  }
}

