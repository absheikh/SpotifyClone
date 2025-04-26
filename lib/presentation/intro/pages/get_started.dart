import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 40
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.introBg
                  ),
                fit: BoxFit.cover
              )
            ),
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
                    Text("Enjoy listening to music  ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color:Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 21),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color:Color(0xff797979)),
                      textAlign: TextAlign.center,
                    ),

                  ],
                )
              ],
            ),
          ),
          Container(
            color: Colors.black.withValues(alpha: (0.15)),
          )
        ],
      ),
    );
  }
}
