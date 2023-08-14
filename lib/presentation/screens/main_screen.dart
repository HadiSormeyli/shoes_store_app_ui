import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shoes_store_app/config/config.dart';
import 'package:shoes_store_app/data/model/sheos.dart';
import 'package:shoes_store_app/presentation/widgets/new_collection_item_widget.dart';
import 'package:shoes_store_app/presentation/widgets/shoe_item_widget.dart';

import 'menu_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class TabItem {
  String title;
  int numberOfItems;

  TabItem(this.title, this.numberOfItems);
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  final _drawerController = ZoomDrawerController();
  late TabController tabController;
  int _currentIndex = 0;

  static List<MenuItem> menuItems = [
    MenuItem("Payment", Icons.payment, true),
    MenuItem("Notifications", Icons.notifications, false),
    MenuItem("Favorite", Icons.favorite_border, false),
    MenuItem("About us", Icons.info_outline, false),
  ];

  static List<TabItem> tabItems = [
    TabItem('Sport', 33),
    TabItem('Running', 41),
    TabItem('Tennis', 52),
    TabItem('Lifestyle', 33),
  ];

  //896 * 572
  final List<Shoes> shoes = [
    Shoes(
        id: 0,
        title: 'Nike Air Jordan',
        imagesUrl: ['assets/images/nike_shoe.png'],
        price: 359,
        threeDModelUrl:
            "https://sketchfab.com/models/fd462c530d974f33a523d88a7562f1cf/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        isLiked: false,
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Jordan 9 footwear',
        imagesUrl: ['assets/images/jordan_9_footwear.png'],
        threeDModelUrl:
            "https://sketchfab.com/models/57dd2031d028404f907e8c5faad153b1/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        price: 229,
        isLiked: false,
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Nike Zoom Pegasus',
        threeDModelUrl:
            "https://sketchfab.com/models/155fe25d6c9f4958b07df9f2d9b8833c/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        imagesUrl: ['assets/images/nike_zoom_pegasus.png'],
        price: 199,
        isLiked: false,
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Nike Tanjun',
        imagesUrl: ['assets/images/nike_tanjun.png'],
        price: 359,
        threeDModelUrl:
            "https://sketchfab.com/models/ec40b8b5a28b4d2e9df42862344897f3/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        isLiked: false,
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Jordan Blue Suede Gym',
        imagesUrl: ['assets/images/jordan_suede_gym.png'],
        price: 169,
        isLiked: false,
        threeDModelUrl:
            "https://sketchfab.com/models/9a5a18f1da0d4d4299fe8cb230e576db/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Jordan 4 Retro Infrared',
        imagesUrl: ['assets/images/jordan_4_retro.png'],
        price: 289,
        isLiked: false,
        threeDModelUrl:
            "https://sketchfab.com/models/a68c3dfd57c24e789176483f97f67a2f/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        category: "Men's shoes"),
  ];

  static List<Shoes> newCollectionShoes = [
    Shoes(
        id: 0,
        title: 'Nike Air Jordan',
        imagesUrl: ['assets/images/nike_shoe.png'],
        price: 359,
        threeDModelUrl:
            "https://sketchfab.com/models/fd462c530d974f33a523d88a7562f1cf/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        isLiked: false,
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Jordan 9 footwear',
        imagesUrl: ['assets/images/jordan_9_footwear.png'],
        price: 229,
        isLiked: false,
        category: "Men's shoes"),
    Shoes(
        id: 0,
        title: 'Jordan 4 Retro',
        imagesUrl: ['assets/images/jordan_4_retro.png'],
        price: 199,
        isLiked: false,
        threeDModelUrl:
            "https://sketchfab.com/models/a68c3dfd57c24e789176483f97f67a2f/embed?autostart=1&internal=1&tracking=0&ui_ar=0&ui_infos=0&ui_snapshots=1&ui_stop=0&ui_theatre=1&ui_watermark=0",
        category: "Men's shoes"),
  ];

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: tabItems.length,
      vsync: this,
    );

    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuScreen(
        menuItems: menuItems,
      ),
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.bounceIn,
      mainScreen: _buildMainScreen(),
      style: DrawerStyle.DefaultStyle,
      mainScreenScale: 0.2,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
      mainScreenTapClose: true,
      borderRadius: largeRadius,
      angle: .0,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).colorScheme.background.withOpacity(0.5),
          spreadRadius: 0,
          blurRadius: 0,
          offset: const Offset(-12, 12), // changes position of shadow
        ),
        BoxShadow(
          color: Theme.of(context).colorScheme.background.withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 0,
          offset: const Offset(-24, 24), // changes position of shadow
        ),
      ],
    );
  }

  Widget _buildMainScreen() {
    var colorScheme = Theme.of(context).colorScheme;
    return WillPopScope(
        onWillPop: () async {
          if (_drawerController.isOpen!.call()) {
            _drawerController.toggle!.call();
            return false;
          }
          return true;
        },
        child: GestureDetector(
            child: Scaffold(
                body: DefaultTabController(
          length: tabItems.length,
          child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(mediumDistance),
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                _drawerController.toggle!.call();
                              },
                              child: Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                      color: colorScheme.surface,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(mediumDistance)),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.3),
                                          width: 1.5)),
                                  child: const Icon(Icons.menu))),
                          const Expanded(
                              flex: 1,
                              child: Text(
                                'Sneaker Shop',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.w500),
                              )),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(mediumDistance)),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.3),
                                    width: 1.5)),
                            child: const Icon(Icons.shopping_basket_outlined),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: mediumDistance,
                    ),
                Expanded(
                    child: NestedScrollView(
                        scrollDirection: Axis.vertical,
                        headerSliverBuilder: (context, innerBoxIsScrolled) => [
                              SliverToBoxAdapter(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                    EdgeInsets.only(left: mediumDistance),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'New Collection',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          'Nike original 2022',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: smallDistance,
                                  ),
                                  CarouselSlider(
                                    options: CarouselOptions(
                                      initialPage: 0,
                                      viewportFraction: 1,
                                      height: 196,
                                      enableInfiniteScroll: true,
                                      reverse: false,
                                      autoPlay: true,
                                      onPageChanged: (index, reason) {
                                        setState(() {
                                          _currentIndex = index;
                                        });
                                      },
                                      autoPlayInterval:
                                      const Duration(seconds: 3),
                                      autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                      autoPlayCurve: Curves.fastOutSlowIn,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                    items: newCollectionShoes.map((shoe) {
                                      return Builder(
                                        builder: (BuildContext context) {
                                          return NewCollectionItemWidget(
                                              shoe: shoe);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                  Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children:
                                          newCollectionShoes.map((item) {
                                            int index = newCollectionShoes
                                                .indexOf(item);
                                            return Container(
                                              width: 8.0,
                                              height: 8.0,
                                              margin:
                                              const EdgeInsets.symmetric(
                                                  vertical: smallDistance,
                                                  horizontal: 2.0),
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _currentIndex == index
                                                    ? primaryColor
                                                    : Colors.grey
                                                    .withOpacity(0.5),
                                              ),
                                            );
                                          }).toList())),
                                  const SizedBox(
                                    height: smallDistance,
                                  ),
                                ],
                              ))
                            ],
                        body: Column(
                          children: [
                            TabBar(
                              controller: tabController,
                              isScrollable: true,
                              indicatorColor: Colors.transparent,
                              tabs: tabItems
                                  .map((e) => Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  AnimatedDefaultTextStyle(
                                    duration: const Duration(
                                        milliseconds: 300),
                                    style: TextStyle(
                                        fontWeight:
                                        (tabController.index ==
                                            tabItems.indexOf(e))
                                            ? FontWeight.w900
                                            : FontWeight.w300,
                                        fontSize: 24,
                                        color: (tabController.index ==
                                            tabItems.indexOf(e))
                                            ? colorScheme
                                            .primaryContainer
                                            : Colors.grey),
                                    child: Text(
                                      e.title,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    "${e.numberOfItems} items",
                                    style: TextStyle(
                                        color: (tabController.index ==
                                            tabItems.indexOf(e))
                                            ? primaryColor
                                            : Colors.grey),
                                  ),
                                ],
                              ))
                                  .toList(),
                            ),

                            const SizedBox(
                              height: 4,
                            ),
                            Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: smallDistance,
                                      right: smallDistance),
                                  child: TabBarView(
                                      controller: tabController,
                                      children: List.generate(
                                        tabItems.length,
                                            (index) => GridView.count(
                                          crossAxisCount: 2,
                                          childAspectRatio: (200 / 280),
                                          children: List.generate(
                                              shoes.length,
                                                  (index) => ShoeItemWidget(
                                                  shoe: shoes[index])),
                                        ),
                                      ))),
                            )
                          ],
                        )))
              ])),
        ))));
  }
}
