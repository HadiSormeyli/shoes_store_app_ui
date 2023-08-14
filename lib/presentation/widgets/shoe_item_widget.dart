import 'package:flutter/material.dart';
import 'package:shoes_store_app/presentation/screens/shoe_details_screen.dart';
import 'package:shoes_store_app/utils/utils.dart';

import '../../config/config.dart';
import '../../data/model/sheos.dart';

class ShoeItemWidget extends StatefulWidget {
  final Shoes shoe;

  const ShoeItemWidget({super.key, required this.shoe});

  @override
  State<ShoeItemWidget> createState() => _ShoeItemWidgetState();
}

class _ShoeItemWidgetState extends State<ShoeItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(mediumDistance),
      margin: const EdgeInsets.all(smallDistance),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(mediumRadius)),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.shoe.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 4,
          ),
          if (widget.shoe.category != null)
            Text(
              widget.shoe.category!,
              style: const TextStyle(color: Colors.grey),
            ),
          Expanded(
              child: Container(
            margin: const EdgeInsets.only(right: smallDistance),
            width: double.infinity,
            alignment: Alignment.centerRight,
            child: Transform.rotate(
                angle: -25 * 3.14 / 180,
                child: Image.asset(
                  widget.shoe.imagesUrl[0],
                  height: 102,
                  fit: BoxFit.contain,
                )),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "\$",
                      style: const TextStyle(fontWeight: FontWeight.w900),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${widget.shoe.price}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    'Price',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              GestureDetector(
                onTap: () async {
                  push(context, ShoeDetailsScreen(shoe: widget.shoe));
                },
                child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.all(
                            Radius.circular(mediumDistance)),
                        border: Border.all(
                            color: Colors.black.withOpacity(0.3), width: 1.5)),
                    child: Transform.rotate(
                        angle: 180 * 3.14 / 180,
                        child: const Icon(Icons.keyboard_backspace_rounded))),
              )
            ],
          ),
        ],
      ),
    );
  }
}
