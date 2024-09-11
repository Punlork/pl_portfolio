import 'package:flutter/material.dart';
import 'package:pl_portfolio/section/coming_soon.dart';
import 'package:pl_portfolio/section/home.dart';
import 'package:pl_portfolio/static/app_theme.dart';
import 'package:pl_portfolio/widget/app_bar.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;
  late final ScrollController _scrollController;
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  double get tabHeight => MediaQuery.of(context).size.height;

  void scrollToKey(BuildContext key) => Scrollable.ensureVisible(key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Punlork',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: Stack(
        children: [
          Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Column(
                children: [
                  CustomAppBar(
                    onHomePressed: () => scrollToKey(homeKey.currentContext!),
                    onAboutPressed: () => scrollToKey(aboutKey.currentContext!),
                    onContactPressed: () => scrollToKey(projectKey.currentContext!),
                    onProjectPressed: () => scrollToKey(contactKey.currentContext!),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Stack(
                children: [
                  Column(
                    key: homeKey,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .2,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: tabHeight,
                              child: const Home(),
                            ),
                            SizedBox(
                              height: tabHeight,
                              key: aboutKey,
                              child: const Center(
                                child: ComingSoon(title: 'About'),
                              ),
                            ),
                            SizedBox(
                              height: tabHeight,
                              key: projectKey,
                              child: const ComingSoon(title: 'Project'),
                            ),
                            SizedBox(
                              height: tabHeight,
                              key: contactKey,
                              child: const Center(
                                child: ComingSoon(
                                  title: 'Contact',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: MediaQuery.of(context).size.width * .2,
            top: 0,
            child: SizedBox(
              height: 200,
              child: Column(
                children: [
                  const Expanded(
                    child: VerticalDivider(),
                  ),
                  IconButton(
                    onPressed: () => changeTheme(
                      _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
                    ),
                    icon: Icon(
                      _themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
