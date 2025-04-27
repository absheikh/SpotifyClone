import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BasicAppBar(),
          Align(
              alignment: Alignment.topRight,
              child:SvgPicture.asset(
                AppVectors.topPattern
              ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child:SvgPicture.asset(
                AppVectors.bottomPattern
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child:Image.asset(
                AppImages.authBg
            ),
          ),
          Align(
            alignment: Alignment.center,
            child:Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 40,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                      AppVectors.logo
                  ),
                  SizedBox(height: 55),
                  Text("Enjoy listening to music",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color:context.isDarkMode?Colors.white:Color(0xff383838)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 21),
                  Text("Spotify is a proprietary Swedish audio streaming and media services provider",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color:context.isDarkMode? Color(0xffA0A0A0): Color(0xff797979)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: BasicButton(
                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (BuildContext context)=> const SignupPage()
                                  )
                              );
                            },
                            title: "Register"
                        ),
                      ),
                      SizedBox(height: 20),
                      Expanded(
                        flex: 1,
                          child:TextButton(
                              onPressed: (){},
                              child: Text("Sign in",
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 19, color: context.isDarkMode?  Colors.white: Color(0xff313131)),
                                textAlign: TextAlign.center,
                              ),
                          )
                      )
                    ],
                  )
                ],
              ),
            )
          ),
        ],
      )
    );
  }
}
