import 'package:flutter/material.dart';
import 'package:bracu_errands/app/constants/app_colors.dart';
import 'package:bracu_errands/app/constants/app_padding.dart';

class PrimaryScaffold extends StatelessWidget {
  const PrimaryScaffold({
    Key? key,
    required this.body,
    this.title,
    this.leadingIcon,
    this.onLeadingPress,
    this.actions,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.removePadding = false,
  }) : super(key: key);

  final Widget body;
  final String? title;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPress;
  final List<Widget>? actions;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final bool removePadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: neutral50,
      appBar: AppBar(
        leading: IconButton(
          onPressed: onLeadingPress ??
              () {
                //context.router.pop();
                Navigator.of(context).pop();
              },
          icon: Icon(
            leadingIcon ?? Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(title ?? ''),
        actions: actions,
      ),
      body: SafeArea(
        child: Padding(
          padding: removePadding ? EdgeInsets.zero : defaultScaffoldPadding,
          child: body,
        ),
      ),
      floatingActionButton: floatingActionButton,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
