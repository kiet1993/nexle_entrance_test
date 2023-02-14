import 'package:entrance_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final void Function() onLogoutTap;
  const MenuPage({
    super.key,
    required this.onLogoutTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Drawer(
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ListTile(
              minLeadingWidth : 0,
              horizontalTitleGap: 5,
              leading: Assets.icons.icLogOut.svg(),
              title: Text(
                'Logout',
                style: theme.headlineMedium,
              ),
              onTap: () {
                Navigator.of(context).pop();
                onLogoutTap.call();
              },
            ),
          ],
        ),
      ),
    );
  }
}