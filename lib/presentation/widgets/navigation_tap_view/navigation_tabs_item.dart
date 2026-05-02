import 'package:flutter/cupertino.dart';

class NavigationTabsItem extends StatelessWidget {
  final String title;

  const NavigationTabsItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
