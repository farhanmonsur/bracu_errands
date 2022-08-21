import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/constants/app_spacing.dart';

class PrimaryTextField extends StatelessWidget {
  const PrimaryTextField({
    Key? key,
    this.title,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    this.leading,
    this.validator,
    this.maxlines,
    this.controller,
  }) : super(key: key);

  final String? title;
  final String? initialValue;
  final String hintText;
  final Widget? leading;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final FormFieldValidator<String>? validator;
  final int? maxlines;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title == null)
          const SizedBox.shrink()
        else
          Text(
            title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        verticalSpacing8,
        TextFormField(
          controller: controller,
          initialValue: initialValue,
          decoration: InputDecoration(
            prefixIcon: leading,
            hintText: hintText,
            filled: true,
            isDense: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: outerBorderColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
          ),
          autocorrect: false,
          maxLines: maxlines ?? 1,
          onChanged: onChanged,
          obscureText: obscureText,
          validator: validator,
        ),
      ],
    );
  }
}
