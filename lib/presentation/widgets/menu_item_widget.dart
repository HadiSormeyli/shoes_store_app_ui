import 'package:flutter/material.dart';
import 'package:shoes_store_app/config/config.dart';
import 'package:shoes_store_app/presentation/screens/menu_screen.dart';

class MenuItemWidget extends StatefulWidget {
  final MenuItem menuItem;

  const MenuItemWidget({super.key, required this.menuItem});

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.menuItem.isSelected = !widget.menuItem.isSelected;
        });
      },
      child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(smallRadius)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(smallDistance),
            child: Row(
              children: [
                Icon(
                  widget.menuItem.iconData,
                ),
                const SizedBox(
                  width: mediumDistance,
                ),
                Text(
                  widget.menuItem.title,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                )
              ],
            ),
          )),
    );
  }
}
