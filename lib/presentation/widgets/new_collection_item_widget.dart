import 'package:flutter/material.dart';
import 'package:shoes_store_app/config/config.dart';
import 'package:shoes_store_app/data/model/sheos.dart';

class NewCollectionItemWidget extends StatelessWidget {
  final Shoes shoe;

  const NewCollectionItemWidget({super.key, required this.shoe});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(mediumDistance),
          margin: const EdgeInsets.all(mediumDistance),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(mediumRadius)),
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoe.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: smallDistance,
              ),
              Text(
                shoe.category!,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(48, 44),
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(mediumRadius),
                  ),
                ),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    'Shop now',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryContainer),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
            transform: Matrix4.translationValues(
              MediaQuery.of(context).size.width / 2.5,
              16,
              .0,
            ),
            child: Transform.rotate(
                angle: -25 * 3.14 / 180,
                child: Image.asset(
                  shoe.imagesUrl[0],
                  width: 200,
                  fit: BoxFit.cover,
                )))
      ],
    );
  }
}
