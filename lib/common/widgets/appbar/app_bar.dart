import 'package:flutter/material.dart';
import 'package:spotify_clone/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool displayBack;
  final bool displaySearch;
  final bool showMoreIcon;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMoreTap;

  const BasicAppBar({
    Key? key,
    this.title,
    this.displayBack = false,
    this.displaySearch = false,
    this.showMoreIcon = false,
    this.onSearchTap,
    this.onMoreTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDarkMode;

    // Build leading widget only if either is true
    Widget? leading;
    if (displayBack) {
      leading = IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark
                ? Colors.white.withOpacity(0.03)
                : Colors.black.withOpacity(0.03),
          ),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 15,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      );
    } else if (displaySearch) {
      leading = IconButton(
        onPressed: onSearchTap ?? () {},
        icon: Icon(
          Icons.search,
          color: isDark ? Colors.white : Colors.black,
          size: 25,
        ),
      );
    }

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const SizedBox(),
      leading: (displayBack || displaySearch) ? leading : null,
      automaticallyImplyLeading:false,
      actions: showMoreIcon
          ? [
        IconButton(
          onPressed: onMoreTap ?? () {},
          icon: Icon(
            Icons.more_vert,
            color: isDark ? Colors.white : Colors.black,
            size: 25,
          ),
        )
      ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
