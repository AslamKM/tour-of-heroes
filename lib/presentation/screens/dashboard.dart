import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/data_fetch_bloc/hero_fetch_bloc.dart';
import 'package:tour_of_heroes/logic/colors/constants.dart';
import 'package:tour_of_heroes/main.dart';
import 'package:tour_of_heroes/presentation/screens/add_hero.dart';
import 'package:tour_of_heroes/presentation/widgets/footer.dart';
import 'package:tour_of_heroes/presentation/widgets/header.dart';
import 'package:tour_of_heroes/presentation/widgets/top_heroes_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _searchController = TextEditingController();
  var searchRes;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      }),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Tour of Heroes'),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  const Header(),
                  const Text(
                    "Top Heroes",
                    style: TextStyle(fontSize: 25),
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
                            return TopHeroWidget(
                                data: state.heroList, index: index);
                          }),
                          itemCount: state.heroList.length,
                        );
                      } else if (state is HeroFetchFailed) {
                        return const Text("data fetch failed");
                      } else {
                        return const Text("Error");
                      }
                      //   return const Text("");
                    }),
                  ),
                  kHeight,
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text(
                          "Hero Search",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: _searchController,
                        decoration: const InputDecoration(
                            hintText: "Start typing a name"),
                        onChanged: (e) {
                          if (e == "") {
                            setState(() {
                              searchRes = [];
                            });
                          } else {
                            searchRes = allHeroesList.searchHero(e);
                            if (searchRes != -1) {
                              setState(() {});
                            }
                          }
                        },
                      ),
                    ),
                  ),
                  kHeight,
                  SizedBox(
                      height: 50,
                      child: searchRes != null
                          ? BlocBuilder(
                              builder: (context, state) {
                                return ListView(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  children: searchRes.map<Widget>((e) {
                                    return Ink(
                                      color: Colors.white,
                                      child: InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.all(5),
                                          child: Text("${e.id}. ${e.name}"),
                                        ),
                                        onTap: () async {
                                          _searchController.text = "";
                                          setState(() {
                                            searchRes = [];
                                          });
                                          await Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  AddHeroScreen(hero: e),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  }).toList(),
                                );
                              },
                            )
                          : Container()),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
