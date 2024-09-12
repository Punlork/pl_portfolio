import 'package:flutter/material.dart';
import 'package:pl_portfolio/section/coming_soon.dart';
import 'package:pl_portfolio/section/home.dart';
import 'package:pl_portfolio/static/app_theme.dart';
import 'package:pl_portfolio/util/scroll.dart';
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
  int selectedTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(scrollListener);
  }

  void scrollListener() {
    double homeOffset = ScrollUtil.getOffsetForKey(homeKey);
    double aboutOffset = ScrollUtil.getOffsetForKey(aboutKey);
    double projectOffset = ScrollUtil.getOffsetForKey(projectKey);
    double contactOffset = ScrollUtil.getOffsetForKey(contactKey);

    double scrollPosition = _scrollController.offset;
    // print(
    //   'home: $homeOffset, about: $aboutOffset, project: $projectOffset, contact: $contactOffset scroll: $scrollPosition',
    // );
    int newIndex = selectedTabIndex;

    if (scrollPosition >= contactOffset && projectOffset.isNegative) {
      newIndex = 3;
    } else if (scrollPosition >= projectOffset && aboutOffset.isNegative) {
      newIndex = 2;
    } else if (scrollPosition >= aboutOffset && homeOffset.isNegative) {
      newIndex = 1;
    } else if (scrollPosition >= homeOffset) {
      newIndex = 0;
    }

    if (newIndex != selectedTabIndex) {
      selectedTabIndex = newIndex;
      setState(() {});
    }
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  double get tabHeight => MediaQuery.of(context).size.height;

  void scrollToKey(BuildContext key, {required int index}) {
    Scrollable.ensureVisible(
      key,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
    );
  }

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
                    selectedTabIndex: selectedTabIndex,
                    onHomePressed: () => scrollToKey(
                      homeKey.currentContext!,
                      index: 0,
                    ),
                    onAboutPressed: () => scrollToKey(
                      aboutKey.currentContext!,
                      index: 1,
                    ),
                    onProjectPressed: () => scrollToKey(
                      projectKey.currentContext!,
                      index: 2,
                    ),
                    onContactPressed: () => scrollToKey(
                      contactKey.currentContext!,
                      index: 3,
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              controller: _scrollController,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .2,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              key: homeKey,
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
