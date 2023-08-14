import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import 'package:shoes_store_app/config/config.dart';
import 'package:shoes_store_app/presentation/widgets/menu_item_widget.dart';

import '../providers/theme_notifier.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> menuItems;

  const MenuScreen({super.key, required this.menuItems});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late ThemeNotifier themeNotifier;

  @override
  Widget build(BuildContext context) {
    themeNotifier = Provider.of<ThemeNotifier>(context);

    return Scaffold(
        backgroundColor: primaryColor,
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SafeArea(
              child: Stack(children: [
                Container(
                    width: 240,
                    height: 240,
                    transform: Matrix4.translationValues(-40.0, -80.0, .0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.3),
                    )),
                Container(
                    width: 288,
                    height: 288,
                    transform: Matrix4.translationValues(-50.0, -80.0, .0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.15),
                    )),
                Container(
                    width: 336,
                    height: 336,
                    transform: Matrix4.translationValues(-50.0, -80.0, .0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(0.08),
                    )),
                Padding(
                    padding: const EdgeInsets.all(smallDistance),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(48),
                                child: Image.asset(
                                  "assets/images/profile_image.jpg",
                                  height: 96,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(
                                width: mediumDistance,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hadi',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('Sormeyli'),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 102,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: 400,
                              child: ListView(
                                children: widget.menuItems
                                    .map((menuItem) => MenuItemWidget(
                                          menuItem: menuItem,
                                        ))
                                    .toList(),
                              )),
                        ])),
                Positioned(
                    bottom: mediumDistance,
                    left: mediumDistance,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Night Mode',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              width: 56,
                            ),
                            FlutterSwitch(
                              width: 72.0,
                              height: 32.0,
                              valueFontSize: 12.0,
                              toggleSize: 24.0,
                              activeColor: Colors.green,
                              value: themeNotifier.darkTheme,
                              borderRadius: largeRadius,
                              padding: 4,
                              showOnOff: true,
                              onToggle: (value) {
                                themeNotifier.darkTheme = value;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: mediumDistance,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.logout_outlined,
                            ),
                            SizedBox(
                              width: mediumDistance,
                            ),
                            Text(
                              "Sign Out",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ],
                    ))
              ]),
            )));
  }
}

class MenuItem {
  String title;
  IconData iconData;
  bool isSelected = false;

  MenuItem(this.title, this.iconData, this.isSelected);
}
