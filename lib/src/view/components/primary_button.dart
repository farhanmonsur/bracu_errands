import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.text,
    this.type = ButtonType.primary,
    this.height = 60,
    this.width = double.infinity,
    this.isLoading = false,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final double? height;
  final double? width;
  final ButtonType type;
  final VoidCallback onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(40.r),
      onTap: isLoading ? null : onTap,
      child: Ink(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: type == ButtonType.primary
              ? Theme.of(context).colorScheme.secondary
              : type == ButtonType.secondary
                  ? Colors.white
                  : error50,
          borderRadius: BorderRadius.circular(40.r),
          border: type == ButtonType.primary || type == ButtonType.pink
              ? null
              : Border.all(
                  color: Theme.of(context).colorScheme.secondary,
                  width: 2.w,
                ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: isLoading
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : FittedBox(
                    child: Text(
                      text,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: type == ButtonType.primary
                            ? Colors.white
                            : Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

enum ButtonType {
  primary,
  secondary,
  pink,
}
