import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomeScreen> {
  bool _isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Stack(
      children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: CupertinoNavigationBar(
            backgroundColor: Color(0xFF2B292A),
            border: Border.all(
              style: BorderStyle.none,
            ),
            actionsForegroundColor: Colors.white,
            leading: GestureDetector(
              onTap: () => setState(() => _isDrawerOpen = true),
              child: Icon(
                IconData(0xF394,
                    fontFamily: CupertinoIcons.iconFont,
                    fontPackage: CupertinoIcons.iconFont),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          top: 0.0,
          bottom: 0.0,
          left: _isDrawerOpen
              ? 0.0
              : -(MediaQuery.of(context).size.width / 3) * 2,
          child: Container(
            width: (MediaQuery.of(context).size.width / 3) * 2,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 5.0,
                ),
              ],
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height -
                      (MediaQuery.of(context).size.height / 1.8 - 90.0) -
                      120.0,
                  color: Color(0xFFB42827),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Container(
                          height: 120.0,
                          color: Color(0xFFB42827),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 12.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25.0),
                                          color: Colors.white.withOpacity(0.1),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            IconData(0xF391,
                                                fontFamily:
                                                    CupertinoIcons.iconFont,
                                                fontPackage: CupertinoIcons
                                                    .iconFontPackage),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Text(
                                          '260',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline
                                              .copyWith(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white),
                                        ),
                                        Text(
                                          'Mi aplicacion ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              .copyWith(
                                                  color: Colors.white
                                                      .withOpacity(0.5)),
                                        ),
                                      ],
                                    ),
                                    Expanded(child: SizedBox()),
                                    CupertinoButton(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30.0),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Text(
                                        'SUBMISSION',
                                        style: TextStyle(
                                          color: Color(0xFFB42827),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.0,
                        left: 20.0,
                        child: GestureDetector(
                          onTap: () => setState(() => _isDrawerOpen = false),
                          child: Icon(
                            CupertinoIcons.clear,
                            color: Colors.white,
                            size: 40.0,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 46.0, bottom: 46.0),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 1.8 + 30.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 46.0, top: 46.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }

  PageController _pageController = PageController(
    viewportFraction: 0.92,
    initialPage: 1,
  );
}
