import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/add_hero_bloc/add_hero_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/data_fetch_bloc/hero_fetch_bloc.dart';
import 'package:tour_of_heroes/logic/colors/constants.dart';
import 'package:tour_of_heroes/presentation/widgets/footer.dart';
import 'package:tour_of_heroes/presentation/widgets/header.dart';
import 'package:tour_of_heroes/presentation/widgets/hero_list_widget.dart';

class HeroesScreen extends StatefulWidget {
  const HeroesScreen({super.key});

  @override
  State<HeroesScreen> createState() => _HeroesScreenState();
}

class _HeroesScreenState extends State<HeroesScreen> {
  late String title;
  String text = "No Value Entered";
  void _setText() {
    setState(() {
      print("clicked");

      text = title;
      BlocProvider.of<AddHeroBloc>(context).add(HeroAddEvent(heroName: text));
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tour of Heroes'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'My Heroes',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              kHeight,
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Hero name:',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
              kHeight,
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SizedBox(
                  height: 40,
                  child: TextField(
                    onChanged: (value) => title = value,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              kHeight,
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      width: 150,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: _setText,
                        child: const Text(
                          'Add hero',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              BlocConsumer<HeroFetchBloc, HeroFetchState>(
                listener: ((context, state) {}),
                builder: ((context, state) {
                  if (state is HeroFetchInitial) {
                    return const Text("data fetch initialised");
                  } else if (state is HeroFetching) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is HeroFetched) {
                    return ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return HeroesListWidget(
                          index: index,
                          data: state.heroList,
                          id: index + 1,
                        );
                      }),
                      itemCount: state.heroList.length,
                    );
                  } else if (state is HeroFetchFailed) {
                    return const Text("data fetch failed");
                  } else {
                    return const Text("Error 1");
                  }
                }),
              ),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
