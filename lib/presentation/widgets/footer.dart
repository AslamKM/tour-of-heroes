import 'package:flutter/material.dart';
import 'package:tour_of_heroes/main.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Messages",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff8d2c35),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: ElevatedButton(
                onPressed: null,
                child: Text('Clear Messages'),
              ),
            ),
          ],
        ),
        Column(
          children: [
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                return Text(allHeroesList.msgList[index]);
              }),
              itemCount: allHeroesList.msgList.length,
            ),
          ],
        ),
      ],
    );
  }
}
