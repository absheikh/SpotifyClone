import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/button/basic_button.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    AppImages.introBg
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
                    Text("Enjoy listening to music",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color:Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 21),
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis enim purus sed phasellus. Cursus ornare id scelerisque aliquam.",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17, color:Color(0xff797979)),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 37),
                    BasicButton(
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context)=> const ChooseModePage()
                              )
                          );
                        },
                        title: "Get Started"
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
