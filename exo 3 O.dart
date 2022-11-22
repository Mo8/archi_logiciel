class Client {
  String feeling = "normal";
  int energy = 1000;

  boire(BoissonInterface boisson) {
    boisson.estBuPar(this);
  }

  @override
  String toString() {
    return 'Client{feeling: $feeling, energy: $energy}';
  }
}

abstract class BoissonInterface {
  late String name;

  late int calories;
  late String feeling;

  estBuPar(Client client);
}

class Boisson implements BoissonInterface {
  @override
  int calories;

  @override
  String name;

  @override
  String feeling;

  Boisson(this.name, this.calories, this.feeling);

  estBuPar(Client client) {
    client.energy += calories;
    client.feeling = feeling;
  }
}

class Poison implements BoissonInterface {
  @override
  int calories;

  @override
  String feeling;

  @override
  String name;

  Poison(this.name, [this.feeling = "malade", this.calories = 0]);

  @override
  estBuPar(Client client) {
    client.energy = 0;
    client.feeling = feeling;
  }
}

class Restaurant {
  static main () {
    Client client = new Client();
    print(client);
    Boisson cafe = new Boisson("CAFÉ", 1, "réveillé");
    client.boire(cafe);
    print("Café  -> $client");
    // Comment gérer de nouvelles boissons ?
    client.boire(new Boisson("TISANE", 1, "reposé"));

    print("Tisane  -> $client");
    // Comment passer energy du client à 0 ?
    client.boire(new Poison("POISON"));

    print("Poison  -> $client");
  }
}

main(){
  Restaurant.main();
}


