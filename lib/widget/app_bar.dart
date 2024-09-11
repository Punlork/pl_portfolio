import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        titleSpacing: 0,
        title: Text(
          'PL',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 10,
              ),
        ),
        actions: [
          TextButton(
            child: Text(
              'Home',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 20),
          TextButton(
            child: Text(
              'About',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 20),
          TextButton(
            child: Text(
              'Contact',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 20),
          TextButton(
            child: Text(
              'Project',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 60),
        ],
      ),
    );
  }
}
