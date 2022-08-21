import 'package:bracu_errands/src/controller/auth_bloc.dart';
import 'package:bracu_errands/src/controller/errand_cubit.dart';
import 'package:bracu_errands/src/view/components/errand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:bracu_errands/app/constants/app_padding.dart';
import 'package:bracu_errands/app/constants/app_spacing.dart';
import 'package:bracu_errands/app/constants/app_text_styles.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userID = context.watch<AuthBloc>().state.user.id!;
    useEffect(
      () {
        context.read<ErrandCubit>().fetchErrands();
        context.read<ErrandCubit>().fetchErrandsByPerformerId(userID);

        return null;
      },
    );

    return Padding(
      padding: defaultScaffoldPadding,
      child: BlocBuilder<ErrandCubit, ErrandState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                verticalSpacing12,
                if (state.activeErrands.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Active errands (${state.activeErrands.length})',
                        style: headingH3RegularTextStyle,
                      ),
                      verticalSpacing12,
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.activeErrands.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ErrandCard(
                            errand: state.activeErrands[index],
                            userId: userID,
                          );
                        },
                      ),
                    ],
                  )
                else
                  const SizedBox.shrink(),
                verticalSpacing12,
                if (state.errands.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Errands around you',
                        style: headingH3RegularTextStyle,
                      ),
                      verticalSpacing12,
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: state.errands.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ErrandCard(
                            errand: state.errands[index],
                            userId: userID,
                          );
                        },
                      )
                    ],
                  )
                else
                  const SizedBox.shrink(),
                verticalSpacing64,
              ],
            ),
          );
        },
      ),
    );
  }
}
