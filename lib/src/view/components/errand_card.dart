import 'package:bracu_errands/app/constants/app_spacing.dart';
import 'package:bracu_errands/src/controller/errand_cubit.dart';
import 'package:bracu_errands/src/model/errand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrandCard extends StatelessWidget {
  const ErrandCard({Key? key, required this.errand, required this.userId})
      : super(key: key);

  final Errand errand;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFDBDBDB),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            verticalSpacing12,
            Column(
              children: [
                Text(errand.description,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
                verticalSpacing24,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (errand.isActive) {
                      context.read<ErrandCubit>().completeErrand(errand.id!);
                    } else {
                      context
                          .read<ErrandCubit>()
                          .acceptErrand(errand.id!, userId);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 154,
                    height: 40,
                    decoration: BoxDecoration(
                      color: errand.isActive
                          ? const Color(0xFF0E9D6D)
                          : Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(
                      errand.isActive ? 'Mark as complete' : 'Run Errand',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 154,
                  height: 40,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFFF4766),
                    ),
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Text(
                    'Call: ${errand.contact}',
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFF4766),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
