import 'package:auto_route/auto_route.dart';
import 'package:bracu_errands/src/controller/auth_bloc.dart';
import 'package:bracu_errands/src/controller/register_form/register_form_bloc.dart';
import 'package:bracu_errands/src/view/components/show_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bracu_errands/app/constants/app_spacing.dart';
import 'package:bracu_errands/app/routes/router.gr.dart';
import 'package:bracu_errands/src/view/components/primary_button.dart';
import 'package:bracu_errands/src/view/components/primary_scaffold.dart';
import 'package:bracu_errands/src/view/components/primary_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PrimaryScaffold(
      title: 'Sign Up',
      onLeadingPress: () {
        context.router.pop();
      },
      body: BlocConsumer<RegisterFormBloc, RegisterFormState>(
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
            child: ListView(
              children: [
                if (state.isSubmitting) ...[const LinearProgressIndicator()],
                verticalSpacing24,
                verticalSpacing16,
                PrimaryTextField(
                  initialValue: state.name,
                  title: 'Full name',
                  hintText: 'Enter your full name',
                  onChanged: (value) => context.read<RegisterFormBloc>().add(
                        RegisterFormEvent.nameChanged(value),
                      ),
                ),
                verticalSpacing24,
                PrimaryTextField(
                  initialValue: state.phone,
                  title: 'Phone',
                  hintText: 'Enter your phone number',
                  onChanged: (value) => context.read<RegisterFormBloc>().add(
                        RegisterFormEvent.phoneChanged(value),
                      ),
                ),
                verticalSpacing24,
                PrimaryTextField(
                  initialValue: state.emailAddress,
                  title: 'Email',
                  hintText: 'Enter your email address',
                  onChanged: (value) => context.read<RegisterFormBloc>().add(
                        RegisterFormEvent.emailChanged(value),
                      ),
                  validator: (_) =>
                      context.read<RegisterFormBloc>().state.emailError.fold(
                            () => null,
                            (a) => a.mapOrNull(
                              invalidEmail: (_) => 'Email is not valid',
                            ),
                          ),
                ),
                verticalSpacing24,
                PrimaryTextField(
                  initialValue: state.password,
                  title: 'Password',
                  hintText: 'Enter your password',
                  onChanged: (value) => context.read<RegisterFormBloc>().add(
                        RegisterFormEvent.passwordChanged(value),
                      ),
                  validator: (_) =>
                      context.read<RegisterFormBloc>().state.passwordError.fold(
                            () => null,
                            (a) => a.mapOrNull(
                              shortPassword: (value) => 'Password is too short',
                            ),
                          ),
                ),
                verticalSpacing40,
                PrimaryButton(
                  text: 'Signup',
                  onTap: () {
                    context.read<RegisterFormBloc>().add(
                          const RegisterFormEvent
                              .registerWithEmailAndPasswordPressed(),
                        );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
