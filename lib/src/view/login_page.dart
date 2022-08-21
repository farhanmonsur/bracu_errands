import 'package:auto_route/auto_route.dart';
import 'package:bracu_errands/src/controller/auth_bloc.dart';
import 'package:bracu_errands/src/controller/login_form/login_form_bloc.dart';
import 'package:bracu_errands/src/view/components/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bracu_errands/app/constants/app_spacing.dart';
import 'package:bracu_errands/app/routes/router.gr.dart';
import 'package:bracu_errands/src/view/components/primary_button.dart';
import 'package:bracu_errands/src/view/components/primary_scaffold.dart';
import 'package:bracu_errands/src/view/components/primary_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      title: 'Login',
      onLeadingPress: () {
        context.router.pop();
      },
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.user.id != null) {
            print('user id: ${state.user.id}');
          }
        },
        child: BlocConsumer<LoginFormBloc, LoginFormState>(
          listener: (context, state) {
            state.authFailureOrSuccessOption.fold(
              () => null,
              (either) => either.fold(
                (failure) {
                  showErrorDialog(
                    context: context,
                    showReportButton: false,
                    message: failure.message,
                  );
                },
                (r) {
                  context.router.replace(const TabRoute());
                  context
                      .read<AuthBloc>()
                      .add(const AuthEvent.authCheckRequested());
                },
              ),
            );
          },
          builder: (context, state) {
            return Form(
              autovalidateMode: state.showErrorMessages
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              child: Column(
                children: [
                  verticalSpacing124,
                  PrimaryTextField(
                    // initialValue: ,
                    title: 'Email',
                    hintText: 'Enter your email address',
                    onChanged: (value) => context.read<LoginFormBloc>().add(
                          LoginFormEvent.emailChanged(value),
                        ),
                    validator: (_) =>
                        context.read<LoginFormBloc>().state.emailError.fold(
                              () => null,
                              (a) => a.mapOrNull(
                                invalidEmail: (_) => 'Email is not valid',
                              ),
                            ),
                  ),
                  verticalSpacing24,
                  PrimaryTextField(
                    title: 'Password',
                    hintText: 'Enter your password',
                    onChanged: (value) => context
                        .read<LoginFormBloc>()
                        .add(LoginFormEvent.passwordChanged(value)),
                    obscureText: true,
                    validator: (_) => context
                        .read<LoginFormBloc>()
                        .state
                        .passwordError
                        .fold(
                          () => null,
                          (a) => a.mapOrNull(
                            shortPassword: (value) => 'Password is too short',
                          ),
                        ),
                  ),
                  verticalSpacing40,
                  PrimaryButton(
                    text: 'Login',
                    isLoading: state.isSubmitting,
                    onTap: () {
                      context.read<LoginFormBloc>().add(
                            const LoginFormEvent
                                .loginWithEmailAndPasswordPressed(),
                          );
                    },
                  ),
                  verticalSpacing24,
                  verticalSpacing40,
                  verticalSpacing40,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
