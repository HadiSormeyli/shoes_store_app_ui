import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shoes_store_app/config/config.dart';

import 'main_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late LiquidController liquidController;

  late AnimationController fadeController;
  late Animation<double> _fadeInFadeOut;

  late AnimationController slideController;
  late Animation<Offset> _offset;

  List<Widget> pages = [];

  bool _exploreVisible = true;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();

    slideController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    _offset = Tween<Offset>(begin: const Offset(0.0, 1.0), end: Offset.zero)
        .animate(slideController);

    fadeController = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 1500),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.0, end: 1).animate(fadeController);

    fadeController.forward();
    slideController.forward();
  }

  @override
  Widget build(BuildContext context) {
    pages = [
      Scaffold(
        body: Container(
          color: primaryColor,
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: 104,
                alignment: Alignment.centerLeft,
                color: Colors.white.withOpacity(0.1),
                child: SlideTransition(
                    position: _offset,
                    child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          "BE UNIQUE",
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withOpacity(0.15),
                              letterSpacing: xLargeDistance,
                              fontSize: 104),
                        ))),
              ),
              Positioned(
                top: 80,
                left: 136,
                child: FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.01)
                          ],
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 176,
                left: 288,
                child: FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.01),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                      )),
                ),
              ),
              Positioned(
                bottom: 176,
                left: 288,
                child: FadeTransition(
                  opacity: _fadeInFadeOut,
                  child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.01),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                      )),
                ),
              ),
              Positioned(
                  bottom: 80,
                  left: 136,
                  child: FadeTransition(
                    opacity: _fadeInFadeOut,
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white.withOpacity(0.01),
                            Colors.white.withOpacity(0.05),
                            Colors.white.withOpacity(0.2),
                          ],
                        ),
                      ),
                    ),
                  )),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 104, top: 104),
                    alignment: Alignment.center,
                    child: const Text.rich(
                      TextSpan(
                        text: 'COMFORTABLE\nFASHIONABLE\n',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w300,
                            color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'SNEAKERS',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 144, right: 56),
                    child: ShakeWidget(
                        duration: const Duration(seconds: 40),
                        shakeConstant: ShakeSlowConstant1(),
                        autoPlay: true,
                        child: Transform.rotate(
                            angle: -35 * 3.14 / 180,
                            child: Image.asset(
                              "assets/images/nike_shoe.png",
                              height: 250,
                              fit: BoxFit.cover,
                            ))),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      const MainScreen(),
    ];
    return Scaffold(
        body: Stack(children: <Widget>[
      LiquidSwipe.builder(
          itemCount: pages.length,
          slideIconWidget: Visibility(
              visible: _exploreVisible,
              child: Container(
                width: 72,
                height: 72,
                margin: const EdgeInsets.only(right: largeDistance),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                alignment: Alignment.center,
                child: const Text(
                  'EXPLORE',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.black),
                ),
              )),
          onPageChangeCallback: (page) {
            if (page == 1) {
              setState(() {
                _exploreVisible = false;
              });
              liquidController.shouldDisableGestures(disable: true);
            }
          },
          liquidController: liquidController,
          positionSlideIcon: 0.9,
          waveType: WaveType.liquidReveal,
          fullTransitionValue: 800,
          enableSideReveal: false,
          preferDragFromRevealedArea: true,
          enableLoop: false,
          ignoreUserGestureWhileAnimating: false,
          itemBuilder: (context, index) {
            return pages[index];
          }),
    ]));
  }
}
