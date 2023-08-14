import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:shoes_store_app/data/model/sheos.dart';
import 'package:shoes_store_app/presentation/screens/web_view_screen.dart';

import '../../config/config.dart';
import '../../utils/utils.dart';

class ShoeDetailsScreen extends StatefulWidget {
  final Shoes shoe;

  const ShoeDetailsScreen({super.key, required this.shoe});

  @override
  State<ShoeDetailsScreen> createState() => _ShoeDetailsScreenState();
}

class _ShoeDetailsScreenState extends State<ShoeDetailsScreen>
    with SingleTickerProviderStateMixin {
  int _currentShoeSize = 8;
  int _currentShoeQty = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(mediumDistance),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () {
                        pop(context);
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
                          child:
                              const Icon(Icons.keyboard_backspace_outlined))),
                  const Expanded(
                      flex: 1,
                      child: Text(
                        'Product Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: colorScheme.surface,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(mediumDistance)),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.3), width: 1.5)),
                    child: const Icon(Icons.shopping_basket_outlined),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: mediumDistance,
                  right: mediumDistance,
                  top: smallDistance),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.shoe.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.shoe.isLiked = !widget.shoe.isLiked;
                        });
                      },
                      icon: Icon(
                        (widget.shoe.isLiked)
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: (widget.shoe.isLiked)
                            ? Colors.red
                            : colorScheme.primaryContainer.withOpacity(0.3),
                      )),
                ],
              ),
            ),
            if (widget.shoe.category != null)
              Padding(
                padding: const EdgeInsets.only(left: mediumDistance),
                child: Text(
                  widget.shoe.category!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, color: Colors.grey),
                ),
              ),
            const SizedBox(
              height: mediumDistance,
            ),
            Expanded(
              child: WebViewScreen(url: widget.shoe.threeDModelUrl!),
            ),
            const SizedBox(
              height: mediumDistance,
            ),
            Expanded(
                child: Stack(
              children: [
                Container(
                    transform: Matrix4.translationValues(0.0, 48.0, .0),
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(mediumDistance),
                          topRight: Radius.circular(mediumDistance)),
                      color: colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primaryContainer.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 8,
                          offset:
                              const Offset(0, -3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        NumberPicker(
                          itemWidth: 80,
                          itemCount: 5,
                          value: _currentShoeSize,
                          axis: Axis.horizontal,
                          selectedTextStyle: const TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 0),
                          minValue: 6,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                              color: Colors.grey),
                          maxValue: 45,
                          onChanged: (value) =>
                              setState(() => _currentShoeSize = value),
                        ),
                        Container(
                            transform: Matrix4.translationValues(-4, .0, .0),
                            child: const Text(
                              'Size',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            )),
                        Container(
                            transform: Matrix4.translationValues(0, 64, .0),
                            child: Transform.rotate(
                                angle: 90 * 3.14 / 180,
                                child: ActionSlider.standard(
                                  width: 128,
                                  height: 64,
                                  loadingIcon: const Padding(
                                    padding: EdgeInsets.all(smallDistance),
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                      strokeWidth: 2,
                                    ),
                                  ),
                                  successIcon: Transform.rotate(
                                      angle: -90 * 3.14 / 180,
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      )),
                                  backgroundColor: primaryColor,
                                  icon: Transform.rotate(
                                      angle: -90 * 3.14 / 180,
                                      child: const Icon(
                                        Icons.shopping_basket_outlined,
                                        color: Colors.white,
                                      )),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: largeDistance,
                                      ),
                                      const Icon(
                                        Icons.navigate_next_rounded,
                                        color: Colors.white,
                                      ),
                                      Icon(
                                        Icons.navigate_next_rounded,
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ],
                                  ),
                                  action: (controller) async {
                                    controller
                                        .loading(); //starts loading animation
                                    await Future.delayed(
                                        const Duration(seconds: 1));
                                    controller.success();
                                    await Future.delayed(
                                        const Duration(milliseconds: 500));
                                    setState(() {
                                      _currentShoeQty++;
                                    });
                                    controller
                                        .reset(); //starts success animation
                                  },
                                ))),
                      ],
                    )),
                Positioned(
                  bottom: 56,
                  right: 24,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: smallDistance,
                        ),
                        Text(
                          '\$${widget.shoe.price}',
                          style: const TextStyle(
                              fontSize: 28, fontWeight: FontWeight.w700),
                        ),
                      ]),
                ),
                Positioned(
                  bottom: 56,
                  left: 24,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Qty.',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: smallDistance,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (_currentShoeQty > 0) _currentShoeQty--;
                                });
                              },
                              child: Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      color: colorScheme.background,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(mediumDistance)),
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.3),
                                          width: 1.5)),
                                  child: Icon(Icons.remove,
                                      color: colorScheme.primaryContainer
                                          .withOpacity(0.5)))),
                          const SizedBox(
                            width: mediumDistance,
                          ),
                          Text(
                            _currentShoeQty.toString(),
                            style: const TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: mediumDistance,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentShoeQty++;
                              });
                            },
                            child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: colorScheme.background,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(mediumDistance)),
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.3),
                                        width: 1.5)),
                                child: Icon(
                                  Icons.add,
                                  color: colorScheme.primaryContainer
                                      .withOpacity(0.5),
                                )),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 48,
                  width: size.width,
                  child: CustomPaint(
                    painter: CurveDraw(
                        colorScheme.surface, colorScheme.primaryContainer),
                  ),
                ),
                Container(
                    width: 6,
                    height: 6,
                    transform: Matrix4.translationValues(
                        size.width / 2 - 10, 28.0, .0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    )),
                Container(
                    transform: Matrix4.translationValues(
                        size.width / 2 - ((_currentShoeSize < 10) ? 20 : 35),
                        32.0,
                        .0),
                    child: Text(
                      '$_currentShoeSize',
                      style: const TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 48),
                    )),
              ],
            ))
          ],
        ),
      ),
    );
  }
}

class CurveDraw extends CustomPainter {
  Color color;
  Color shadowColor;

  CurveDraw(this.color, this.shadowColor);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    var path = Path();
    double sw = size.width;
    double sh = size.height;
    path.moveTo(sw / 3 + 20, sh);

    path.cubicTo(sw / 2, 0, sw / 2, sh / 2, sw / 1.5 - 30, sh);

    path.lineTo(sw, sh);

    path.close();

    canvas.drawShadow(path, shadowColor.withOpacity(0.4), -6.0, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
