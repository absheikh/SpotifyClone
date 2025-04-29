import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_images.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';
import 'package:spotify_clone/core/configs/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 33,
          ),
        displaySearch: true,
        showMoreIcon: true,
        // displayBack: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 40
        ),
        child: Column(
          children: [
            _headerCard(context),
          ],
        ),
      ),
    );
  }
}

Widget _headerCard(BuildContext context) {
  return Stack(
    clipBehavior: Clip.none, // Allow overflow outside the container
    children: [
      Container(
        constraints: BoxConstraints(maxHeight: 118),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: SvgPicture.asset(AppVectors.homepage_cover_pattern),
            ),
            Padding(
              padding: const EdgeInsets.all(19),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("New Alum",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12)),
                  SizedBox(height: 5),
                  SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.,
                    child: Text(
                      "Happier Than Ever",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                  ),

                  SizedBox(height: 5),
                  Text("Bellie Ellish",
                      style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13)),
                ],
              ),
            ),
          ],
        ),
      ),
      Positioned(
        bottom: 0, // Stick to bottom of container
        right: 0,
        height: 160,
        child: Image.asset(AppImages.homepage_cover_img),
      ),
    ],
  );
}
