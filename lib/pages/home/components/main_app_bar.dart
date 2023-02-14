import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:entrance_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final double height;

  const MainAppBar({
    super.key,
    required this.userName,
    required this.height,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final padding = MediaQuery.of(context).padding;
    return Container(
      color: AppColors.background,
      padding: EdgeInsets.fromLTRB(20, 12 + padding.top, 20, 12),
      height: height + padding.top,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            splashColor: Colors.transparent,  
            highlightColor: Colors.transparent,
            icon: Assets.icons.icMenu.svg(),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    userName,
                    style: theme.bodyMedium,
                  ),
                  Text(
                    "Available",
                    style: theme.bodySmall?.copyWith(
                      color: AppColors.textNeutral
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 14,
              ),
              Assets.images.imgAvatar.svg(),
            ],
          )
        ],
      )
    );
  }
}