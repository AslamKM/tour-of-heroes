import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_of_heroes/logic/bloc/delete_hero_bloc/delete_hero_bloc.dart';

class HeroesListWidget extends StatefulWidget {
  const HeroesListWidget({
    super.key,
    //   required this.item,
    required this.data,
    required this.index,
    required this.id,
  });
  //final List item;
  final List data;
  final int index;
  final int id;

  @override
  State<HeroesListWidget> createState() => _HeroesListWidgetState();
}

class _HeroesListWidgetState extends State<HeroesListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 50,

              // ignore: sort_child_properties_last
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    color: const Color(0xFF295076),
                    width: 50,
                    height: 50,
                    child: Center(
                      child: Text(
                        widget.id.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Text(widget.data[widget.index].name.toString()),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        width: 40,
                        height: 40,
                        child: InkWell(
                            onTap: () {
                              BlocProvider.of<DeleteHeroBloc>(context).add(
                                HeroDeleteEvent(
                                    heroModel: widget.data[widget.index]),
                              );
                            },
                            splashColor: Colors.amber,
                            child: const Icon(Icons.close)),
                      ),
                    ),
                  )
                ],
              ),
              color: const Color(0xffeeeeee),
            ),
          ),
        ),
      ],
    );
  }
}
