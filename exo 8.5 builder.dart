//En java il y a le StringBuilder



class ViandeException implements Exception {}

class FromageException implements Exception {}

class PainException implements Exception {}

class Ingredient {
  String name;

  Ingredient(this.name);

  @override
  String toString() {
    return 'Ingredient{name: $name}';
  }
}

class Viande extends Ingredient {
  Viande(super.name);
}

class Pain extends Ingredient {
  Pain(super.name);
}

class Fromage extends Ingredient {
  Fromage(super.name);
}

class Burger {
  late Viande viande;
  late Fromage fromage;
  late Pain pain;
  List<Ingredient> ingredients = [];
  Burger(this.viande,this.fromage,this.pain,this.ingredients);

  @override
  String toString() {
    return 'Burger{viande: $viande, fromage: $fromage, pain: $pain, ingredients: $ingredients}';
  }


}

class BurgerBuilder {
  Viande? viande;
  Fromage? fromage;
  Pain? pain;
  List<Ingredient> ingredients = [];

  BurgerBuilder() {
    this.ingredients.add(Ingredient("Sauces"));
  }

  BurgerBuilder choisirViande(Viande viande) {
    this.viande = viande;
    return this;
  }

  BurgerBuilder choisirFromage(Fromage fromage) {
    this.fromage = fromage;
    return this;
  }

  BurgerBuilder choisirPain(Pain pain) {
    this.pain = pain;
    return this;
  }

  BurgerBuilder ajouterIngredient(Ingredient ingredient) {
    this.ingredients.add(ingredient);
    return this;
  }

  Burger build() {
    if (viande == null) throw ViandeException();
    if (fromage == null) throw FromageException();
    if (pain == null) throw PainException();
    return Burger(viande!, fromage!, pain!, ingredients);
  }
}

main() {
  Burger burger = BurgerBuilder()
      .choisirFromage(Fromage("Emmental"))
      .choisirViande(Viande("Boeuf"))
      .choisirPain(Pain("Italien"))
      .build();
  print(burger);
}
