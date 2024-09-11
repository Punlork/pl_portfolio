import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pl_portfolio/util/web.dart';
import 'package:pl_portfolio/widget/app_bar.dart';
import 'package:pl_portfolio/widget/hover_text.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.theme, required this.onChangeTheme});

  final ThemeMode theme;
  final VoidCallback onChangeTheme;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .2,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: CustomAppBar(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Hello, ',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "My name is ",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const HoverText(text: 'Punlork.'),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: <Widget>[
                          Text(
                            'Mobile App | Frontend ',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  letterSpacing: 5,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            'Developer ',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  letterSpacing: 5,
                                  height: 1,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Row(
                        children: <Widget>[
                          IconButton(
                            tooltip: 'https://www.linkedin.com/in/punlork-chek-a29740217/',
                            onPressed: () => WebUtil.openWebURL(
                              'https://www.linkedin.com/in/punlork-chek-a29740217/',
                            ),
                            icon: const Icon(
                              FontAwesomeIcons.linkedinIn,
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            tooltip: 'https://t.me/chekpunlork',
                            onPressed: () => WebUtil.openWebURL('https://t.me/punlork'),
                            icon: const Icon(
                              FontAwesomeIcons.telegram,
                            ),
                          ),
                          const SizedBox(width: 12),
                          IconButton(
                            tooltip: 'https://github.com/punlork',
                            onPressed: () => WebUtil.openWebURL('https://github.com/punlork'),
                            icon: const Icon(
                              FontAwesomeIcons.github,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              top: 0,
              child: SizedBox(
                height: 200,
                child: Column(
                  children: [
                    const Expanded(
                      child: VerticalDivider(),
                    ),
                    IconButton(
                      onPressed: onChangeTheme,
                      icon: Icon(
                        theme == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
