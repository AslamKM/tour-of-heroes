import 'package:flutter/material.dart';
import 'package:tour_of_heroes/logic/colors/constants.dart';
import 'package:tour_of_heroes/main.dart';
import 'package:tour_of_heroes/model/hero_model.dart';
import 'package:tour_of_heroes/presentation/screens/dashboard.dart';
import 'package:tour_of_heroes/presentation/widgets/footer.dart';
import 'package:tour_of_heroes/presentation/widgets/header.dart';

class AddHeroScreen extends StatefulWidget {
  const AddHeroScreen({super.key, required this.hero});
  final HeroModel hero;

  @override
  State<AddHeroScreen> createState() => _AddHeroScreenState();
}

class _AddHeroScreenState extends State<AddHeroScreen> {
  var _addTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _addTextController = TextEditingController(text: widget.hero.name);
  }

  @override
  Widget build(BuildContext context) {
    String _firstLetter = "";
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tour of Heroes'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(),
                kHeight,
                Row(
                  children: [
                    Text(
                      '${widget.hero.name} details',
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    Text(
                      'id : ${widget.hero.id} ',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    const Text(
                      'Hero Name : ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: TextField(
                        controller: _addTextController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                kHeight,
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ),
                        );
                      },
                      child: const Text('go back'),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print(_addTextController.text);
                        print(widget.hero.name);
                        if (_addTextController.text == "") {
                          final snackBar = SnackBar(
                            content: const Text('Hero name cannot be null'),
                            backgroundColor: (Colors.black12),
                            action: SnackBarAction(
                              label: 'dismiss',
                              onPressed: () {},
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (_addTextController == widget.hero.name) {
                        } else {
                          allHeroesList.editHero(
                              widget.hero.name, _addTextController.text);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardScreen(),
                            ),
                          );
                        }
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
