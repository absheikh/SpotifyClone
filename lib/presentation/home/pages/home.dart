import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify_clone/common/widgets/appbar/app_bar.dart';
import 'package:spotify_clone/core/configs/assets/app_vectors.dart';

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
    );
  }
}
