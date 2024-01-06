import 'package:digiscan/globalWiget/loder/cardloderItem.dart';
import 'package:flutter/material.dart';

class CardLoder extends StatelessWidget {
  const CardLoder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CardLoderItem(),
        const SizedBox(
          height: 20.00,
        ),
        const CardLoderItem(),
        const SizedBox(
          height: 20.00,
        ),
        const CardLoderItem(),
      ],
    );
  }
}
