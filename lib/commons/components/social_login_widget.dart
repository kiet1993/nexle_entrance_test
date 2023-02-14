import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:entrance_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          children: [
            const Expanded(
              child: Divider(
                color: AppColors.dividerColor,
                thickness: 1,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "or",
              style: textTheme.bodyMedium,
            ),
            const SizedBox(
              width: 10,
            ),
            const Expanded(
              child: Divider(
                color: AppColors.dividerColor,
                thickness: 1,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Wrap(
          spacing: 11,
          children: [
            Assets.icons.icFacebook.svg(),
            Assets.icons.icTwitter.svg(),
            Assets.icons.icMail.svg(),
            Assets.icons.icGit.svg(),
          ],
        )
      ],
    );
  }
}