import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardLoderItem extends StatelessWidget {
  const CardLoderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.00, right: 20.00),
      child: Center(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.withOpacity(0.25),
          highlightColor: Colors.white.withOpacity(0.6),
          period: const Duration(seconds: 2),
          loop: -1,
          child: Container(
            height: 180.00,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.withOpacity(0.9)),
          ),
        ),
      ),
    );
  }
}
