import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '$title | Coming soon...',
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
