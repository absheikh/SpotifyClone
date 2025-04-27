import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSize {
  final Widget ? title;
  const BasicAppBar({this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: title?? Text(""),
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
          onPressed:(){
            Navigator.pop(context);
          },
          icon: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
            color: context.isDarkMode? Colors.white.withAlpha((0.03*255).toInt()): Colors.black.withAlpha((0.03*255).toInt()),
                shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 15,
              color: context.isDarkMode? Colors.white:Colors.black,
            ),
      )
      ),
    );
  }



  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  // TODO: implement child
  Widget get child => AppBar();
}
