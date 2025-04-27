import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
            height: 33,
        )
      ),
      // bottomNavigationBar: _footerText(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            SizedBox(height: 47),
            _registerText(context),
            SizedBox(height: 15),
            _fullNameField(context),
            SizedBox(height: 15),
            _emailField(context),
            SizedBox(height: 15),
            _passwordField(context),
            SizedBox(height: 20),
            BasicButton(
                onPressed: (){},
                title: "Create Account"
            ),
            SizedBox(height: 20),
            _orText(context),
            SizedBox(height: 30),
            _socialIcons(context),
            SizedBox(height: 15),
            _footerText(context)
          ],
        ),
      ),
    );
  }
}

Widget _registerText(BuildContext context) {

  return Column(
    children: [
      Text("Register",
        style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 25,
            color: context.isDarkMode ? Colors.white : Color(0xff383838)),
        textAlign: TextAlign.center,
      ),
      SizedBox(height: 5),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("If you need any support",
            style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
          ),
          TextButton(
            onPressed: (){},
            child: Text("click here",
              style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12, color: AppColors.primary),
            ),
          ),
        ],
      )
    ],
  );
}

  Widget _fullNameField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: "Full Name"
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

Widget _emailField(BuildContext context){
  return TextField(
    decoration: InputDecoration(
        hintText: "Email address"
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );
}

Widget _passwordField(BuildContext context){
  return TextField(
    decoration: InputDecoration(
        hintText: "Password"
    ).applyDefaults(Theme.of(context).inputDecorationTheme),
  );
}

Widget _orText(BuildContext context){
  return Row(
    children: [
      Expanded(
        flex:1,
        child: Container(
          height: 1,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                context.isDarkMode?Color(0xFF5B5B5B) : Color(0xffB0B0B0),
                context.isDarkMode?Color(0xFF252525) : Color(0xffD3D3D3),
              ],
            ),
          ),
        )
      ),
      SizedBox(width: 11),
      Text("Or",
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: context.isDarkMode ? Color(0xffDCDCDC) : Color(0xff383838)),
      ),
      SizedBox(width: 11),
      Expanded(
          flex:1,
          child: Container(
            height: 1,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  context.isDarkMode?Color(0xFF252525) : Color(0xffD3D3D3),
                  context.isDarkMode?Color(0xFF5B5B5B) : Color(0xffB0B0B0),
                ],
              ),
            ),
          )
      )
    ],
  );
}

Widget _socialIcons(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(
        onTap: (){},
        child: SvgPicture.asset(
          AppVectors.google,
        ),
      ),
      SizedBox(width: 50),
      GestureDetector(
        onTap: (){},
        child: SvgPicture.asset(
          AppVectors.apple,
          color: context.isDarkMode? Colors.white: Color(0xff303030)
        ),
      ),
    ],
  );
} // Widget

Widget _footerText(BuildContext context){
  return Padding(
    padding: const EdgeInsets.symmetric(
      vertical: 15
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Do you have an account?",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        TextButton(
          onPressed: (){},
          child: Text("Sign In",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ),


      ],
    ),
  );
}