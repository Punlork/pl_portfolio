import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pl_portfolio/util/theme.dart';
import 'package:pl_portfolio/util/web.dart';
import 'package:pl_portfolio/widget/hover_text.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hello, ',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          letterSpacing: 5,
                        ),
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 5,
                  color: ThemeUtil.isDarkMode(context) ? Colors.white12 : Colors.black12,
                ),
                borderRadius: BorderRadius.circular(1000),
              ),
              child: const CircleAvatar(
                maxRadius: 200,
                backgroundImage: AssetImage(
                  'asset/image/profile.jpg',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
