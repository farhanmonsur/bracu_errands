import 'package:auto_route/auto_route.dart';
import 'package:bracu_errands/app/constants/app_assets.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/routes/router.gr.dart';
import 'package:bracu_errands/src/controller/auth_bloc.dart';
import 'package:bracu_errands/src/controller/errand_cubit.dart';
import 'package:bracu_errands/src/view/home_page.dart';
import 'package:bracu_errands/src/view/post_errand_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabPage extends HookWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentIndex = useState(0);
    final pages = <Widget>[
      const HomePage(),
      PostErrandPage(),
    ];

    return MultiBlocListener(
      listeners: [
        BlocListener<ErrandCubit, ErrandState>(
          listener: (context, state) {
            if (state.created) {
              currentIndex.value = 0;
              state.copyWith(created: false);
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.unauthenticated) {
              AutoRouter.of(context).replaceAll([const OnboardingRoute()]);
            }
          },
        ),
      ],
      child: Scaffold(
        extendBody: true,
        appBar: AppBar(
          title: const Text('Bracu Errands',
              style: TextStyle(color: accentColor, fontSize: 20)),
          actions: [
            GestureDetector(
              onTap: () {
                context.read<AuthBloc>().add(const AuthEvent.signedOut());
              },
              child: Row(
                children: const [
                  Text('Logout', style: TextStyle(color: Colors.red)),
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ],
        ),
        body: pages[currentIndex.value],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            border: Border.all(
              color: Theme.of(context).disabledColor,
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: BottomNavigationBar(
              currentIndex: currentIndex.value,
              onTap: (index) {
                currentIndex.value = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: currentIndex.value == 0
                      ? SvgPicture.asset(
                          boxUri,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : SvgPicture.asset(boxUri,
                          color: Theme.of(context).disabledColor),
                  label: 'Run Errands',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex.value == 1
                      ? SvgPicture.asset(
                          errandsFilled,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : SvgPicture.asset(errandsOutlined),
                  label: 'Post Errands',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
