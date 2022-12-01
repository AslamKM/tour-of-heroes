class HeroModel {
  int id;
  String name;

  HeroModel(this.id, this.name);
}

class HeroList {
  List allHeroes = [];
  int count = 5;
  List names = [];
  List msgList = [];

  HeroList() {
    allHeroes.add(HeroModel(1, "Narco"));
    allHeroes.add(HeroModel(2, "Bombasto"));
    allHeroes.add(HeroModel(3, "Celeritas"));
    allHeroes.add(HeroModel(4, "Magenta"));
    allHeroes.add(HeroModel(5, "Dr IQ"));

    buildNames();
  }

  buildNames() {
    this.names = this.allHeroes.map((n) => n.name.toLowerCase()).toList();
    //   notifyListeners();
    msgList.add('HeroService: fetched heroes');

    print(this.names.length);
    //return this.names;
  }

  addHero(String name) {
    HeroModel h = HeroModel(this.count, name);
    this.allHeroes.add(h);
    this.count++;
    print(this.allHeroes);
    print(count);
    buildNames();
    msgList.add('HeroService: hero added');
  }

  remHero(h) {
    print('id $h');
    (this.allHeroes.contains(h)) && this.allHeroes.remove(h);
    //  print("deleted");
    // print(this.allHeroes.length);
    buildNames();
    print(names);
    msgList.add('HeroService: hero removed');
  }

  editHero(String oh, String nh) {
    List names = this.allHeroes.map((n) => n.name).toList();
    int i = names.indexOf(oh);
    if (i != -1) {
      this
          .allHeroes
          .replaceRange(i, i + 1, [HeroModel(this.allHeroes[i].id, nh)]);

      buildNames();
      msgList.add('HeroService: hero updated');
    }
  }

  searchHero(String h) {
    List res = [];

    for (var n in this.names) {
      if (n.toString().startsWith(h.toString().toLowerCase())) {
        res.add(allHeroes[this.names.indexOf(n)]);
      } else if (res.contains(this.names.indexOf(n))) {
        res.remove(this.allHeroes.indexOf(n));
      }
    }
    msgList.add('HeroService: hero search completed');
    return res;
  }
}
