import 'package:entrance_test/commons/configs/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.title,
    this.hintText,
    this.errorText,
    this.autofocus,
    this.obscureText,
    this.keyboardType,
    this.controller,
    this.inputFormatters,
    this.suffixIcon,
    this.isRequired,
    this.focusNode,
    this.readOnly,
    this.onTap,
    this.rightButtonText,
    this.onRightButtonTap,
    this.onChanged
  });

  final bool? isRequired;
  final bool? readOnly;
  final String? title;
  final String? hintText;
  final String? errorText;
  final bool? autofocus;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffixIcon;
  final void Function()? onTap;
  final FocusNode? focusNode;
  final String? rightButtonText;
  final void Function()? onRightButtonTap;
  final void Function(String text)? onChanged;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Visibility(
          visible: (widget.title?.length ?? 0) > 0,
          child: Row(
            children: [
              Text(
                widget.title ?? '',
                style: textTheme.bodySmall,
              ),
              Visibility(
                visible: widget.isRequired ?? false,
                child: Text(
                  ' *',
                  style: textTheme.bodySmall?.copyWith(color: AppColors.errorColor),
                ),
              ),
              Visibility(
                visible: widget.rightButtonText != null,
                child: Expanded(
                  child: GestureDetector(
                    onTap: widget.onRightButtonTap,
                    child: Text(
                      widget.rightButtonText ?? "",
                      style: textTheme.bodySmall?.copyWith(color: AppColors.primary),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: widget.title == null ? 0 : 2),
        TextFormField(
          obscuringCharacter: "⚉",
          focusNode: widget.focusNode,
          obscureText: widget.obscureText ?? false,
          readOnly: widget.readOnly ?? false,
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          cursorColor: AppColors.textTertiary,
          autofocus: widget.autofocus ?? false,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          onChanged: (value) {
            setState(() {});
            widget.onChanged?.call(value);
          },
          onEditingComplete: () {
            FocusScope.of(context).unfocus();
            setState(() {});
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.borderColor
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.borderColor
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.borderColor
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.borderColor
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.borderColor
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(
                width: 1,
                color: AppColors.borderColor
              ),
            ),
            hintText: widget.hintText,
            labelStyle: textTheme.bodySmall?.copyWith(
              color: AppColors.textTertiary
            ),
            hintStyle: textTheme.bodySmall?.copyWith(
              color: AppColors.textNeutral
            ),
            errorStyle: null,
            errorText: null,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            filled: true,
            fillColor: AppColors.background,
            suffixIcon: widget.suffixIcon,
            isDense: true
          ),
        ),
        Opacity(
          opacity: widget.errorText != null ? 1 : 0,
          child: Text(
            widget.errorText ?? "",
            style: textTheme.bodySmall?.copyWith(
              color: AppColors.errorColor
            ),
          ),
        )
      ],
    );
  }
}