import 'package:flutter/material.dart';

class PrimaryTabBar extends StatelessWidget {
  const PrimaryTabBar({
    Key? key,
    required this.onSelectColor,
    required this.tabName1,
    required this.tabName2,
    this.onTap,
  }) : super(key: key);

  final Color onSelectColor;
  final String tabName1;
  final String tabName2;
  final Function(int)? onTap;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SizedBox(
        height: 34,
        child: TabBar(
          onTap: onTap,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.white,
          indicator: BoxDecoration(
            color: onSelectColor,
            borderRadius: BorderRadius.circular(30),
          ),
          tabs: [
            Tab(
              text: tabName1,
            ),
            Tab(
              text: tabName2,
              
            )
          ],
        ),
      ),
    );
  }
}
