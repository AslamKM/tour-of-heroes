import 'package:flutter/material.dart';
import 'package:tour_of_heroes/logic/colors/constants.dart';

class TopHeroWidget extends StatelessWidget {
  const TopHeroWidget({
    super.key,
    required this.data,
    required this.index,
  });
  final List data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight,
        SizedBox(
            width: 400,
            height: 50,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color(0xff3f515b),
                ),
              ),
              onPressed: null,
              child: Text(
                data[index].name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )),
      ],
    );
  }
}
