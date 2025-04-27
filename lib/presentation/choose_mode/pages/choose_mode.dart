import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';
import 'package:spotify_clone/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify_clone/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        AppImages.chooseMode
                    ),
                    fit: BoxFit.cover
                )
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: (0.15)),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                      AppVectors.logo
                  ),
                ),
                Spacer(),
                Column(
                  children: [
                    Text("Choose Mode",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color:Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                                },
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child:
                                        Container(
                                          height: 73,
                                          width: 73,
                                          decoration: BoxDecoration(
                                            color: Color(0xff30393c).withAlpha((0.5 * 255).toInt()),
                                            shape: BoxShape.circle
                                          ),
                                          child: SvgPicture.asset(
                                            AppVectors.moon,
                                            fit: BoxFit.none,
                                          )
                                        ),
                                
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text("Dark Mode",
                                style: TextStyle(color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        
                        SizedBox(width: 45,),
                        Column(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                                },
                                child: ClipOval(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                                    child:
                                    Container(
                                        height: 73,
                                        width: 73,
                                        decoration: BoxDecoration(
                                            color: Color(0xff30393c).withAlpha((0.5 * 255).toInt()),
                                            shape: BoxShape.circle
                                        ),
                                        child: SvgPicture.asset(
                                          AppVectors.sun,
                                          fit: BoxFit.none,
                                        )
                                    ),
                                
                                  ),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Text("Light Mode",
                                style: TextStyle(color: AppColors.grey, fontSize: 13, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                      ],
                    ),
                    SizedBox(height: 50),
                    BasicButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context)=> const SignupOrSignin()
                              )
                          );
                        },
                        title: "Continue"
                    )



                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
