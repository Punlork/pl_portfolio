import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pl_portfolio/util/theme.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.onHomePressed,
    required this.onAboutPressed,
    required this.onContactPressed,
    required this.onProjectPressed,
    required this.selectedTabIndex,
  });

  final VoidCallback onHomePressed;
  final VoidCallback onAboutPressed;
  final VoidCallback onContactPressed;
  final VoidCallback onProjectPressed;
  final int selectedTabIndex;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: MediaQuery.of(context).size.width * .2,
      forceMaterialTransparency: true,
      scrolledUnderElevation: 0,
      shape: Border(
        bottom: BorderSide(
          color: ThemeUtil.isDarkMode(context) ? Colors.white12 : Colors.black12,
          width: 1,
        ),
      ),
      title: Text(
        'PL',
        style: GoogleFonts.getFont(
          'Montserrat',
          textStyle: Theme.of(context).textTheme.displaySmall,
        ).copyWith(
          fontWeight: FontWeight.w600,
          letterSpacing: 10,
        ),
      ),
      actions: [
        TextButton(
          onPressed: onHomePressed,
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: selectedTabIndex == 0 ? FontWeight.w600 : null,
                ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: onAboutPressed,
          child: Text(
            'About',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: selectedTabIndex == 1 ? FontWeight.w600 : null,
                ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: onProjectPressed,
          child: Text(
            'Project',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: selectedTabIndex == 2 ? FontWeight.w600 : null,
                ),
          ),
        ),
        const SizedBox(width: 20),
        TextButton(
          onPressed: onContactPressed,
          child: Text(
            'Contact',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: selectedTabIndex == 3 ? FontWeight.w600 : null,
                ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * .25),
      ],
    );
  }
}
