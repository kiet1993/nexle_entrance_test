import 'package:entrance_test/commons/configs/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.gen.dart';
import '../configs/app_color.dart';

class ConfirmCheckbox extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool isCheck;
  final String? hyperText;
  final void Function()? onHyperTextTap;

  const ConfirmCheckbox({
    super.key,
    required this.onTap,
    required this.title,
    required this.isCheck,
    this.hyperText,
    this.onHyperTextTap
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            height: 18,
            width: 18,
            child: isCheck
            ? Assets.icons.icCheckboxChecked.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.textPrimary, 
                BlendMode.srcIn
              ),
            )
            : Assets.icons.icCheckboxUnchecked.svg(
              colorFilter: const ColorFilter.mode(
                AppColors.borderColor, 
                BlendMode.srcIn
              ),
            )
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: title,
                    style: theme.bodyMedium,
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: Visibility(
                      visible: hyperText != null,
                      child: const SizedBox(width: 6)
                    )
                  ),
                  TextSpan(
                    text: hyperText,
                    style: theme.bodyMedium?.copyWith(
                      color: AppColors.primary
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      onHyperTextTap?.call();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}