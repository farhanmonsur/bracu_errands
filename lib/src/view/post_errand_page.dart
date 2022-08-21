import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/constants/app_padding.dart';
import 'package:bracu_errands/src/controller/errand_cubit.dart';
import 'package:bracu_errands/src/controller/register_form/register_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bracu_errands/app/constants/app_spacing.dart';
import 'package:bracu_errands/src/view/components/primary_button.dart';
import 'package:bracu_errands/src/view/components/primary_textfield.dart';

class PostErrandPage extends StatelessWidget {
  PostErrandPage({Key? key}) : super(key: key);
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: neutral50,
      body: Padding(
        padding: defaultScaffoldPadding,
        child: Form(
          child: ListView(
            children: [
              verticalSpacing24,
              verticalSpacing16,
              PrimaryTextField(
                controller: _descriptionController,
                maxlines: 6,
                title: 'New Errand',
                hintText: 'Describe your errand',
                onChanged: (value) => context.read<RegisterFormBloc>().add(
                      RegisterFormEvent.nameChanged(value),
                    ),
              ),
              verticalSpacing40,
              PrimaryButton(
                text: 'Post Errand',
                onTap: () {
                  context
                      .read<ErrandCubit>()
                      .postErrand(_descriptionController.text);
                  _descriptionController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
