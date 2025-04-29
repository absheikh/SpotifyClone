import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_clone/common/widgets/inputs/basic_input.dart';
import 'package:spotify_clone/common/widgets/snackbar/custom_snackbar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/data/models/auth/signup_model.dart';
import 'package:spotify_clone/domain/usecases/auth/signup.dart';
import 'package:spotify_clone/presentation/auth/pages/signin.dart';
import '../../../service_locator.dart';
import '../../home/pages/home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    if (_fullNameController.text.trim().isEmpty ||
        _emailController.text.trim().isEmpty ||
        _passwordController.text.trim().isEmpty) {

      showCustomSnackbar(
        context: context,
        title: 'Error',
        message: 'All fields are required',
        contentType: ContentType.failure,
      );

      return false;
    }

    // Basic email format check (can be improved)
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(_emailController.text.trim())) {
      showCustomSnackbar(
        context: context,
        title: 'Error',
        message: 'Invalid email address',
        contentType: ContentType.failure,
      );
      return false;
    }

    return true;
  }


  bool _isLoading = false;

  void signup() async {
    if (!_validateForm()) return;

    setState(() => _isLoading = true);

    var res = await sl<SignupUseCase>().call(
      params: SignupModel(
        fullName: _fullNameController.text.trim(),
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ),
    );

    setState(() => _isLoading = false);

    res.fold(
          (l) {
        showCustomSnackbar(
          context: context,
          title: "Error",
          message: l,
          contentType: ContentType.failure,
        );
      },
          (r) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
              (route) => false,
        );
      },
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
            height: 33,
        ),
        displayBack: true,
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
            BasicInput(
                controller: _fullNameController,
                hintText: "Full Name",
                isRequired:true
            ),
            SizedBox(height: 15),
            BasicInput(
                controller: _emailController,
                hintText: "Email address",
                isEmail:true,
                isRequired:true
            ),
            SizedBox(height: 15),
            BasicInput(
                controller: _passwordController,
                hintText: "Password",
                isPassword:true,
                isRequired:true
            ),
            SizedBox(height: 20),
            BasicButton(
                onPressed: signup,
                title: "Create Account",
                loading:_isLoading
            ),
            SizedBox(height: 20),
            _orText(context),
            SizedBox(height: 15),
            _socialIcons(context),
            SizedBox(height: 5),
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
          onPressed: (){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (BuildContext context)=> const SigninPage()
                )
            );
          },
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