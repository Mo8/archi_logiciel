abstract class Ingredient{
affiche();
}



class Sushi implements Ingredient{
  @override
  affiche() {
    print("Sushi");
  }

}

class IngredientDecorator implements Ingredient{
  late Ingredient ingredient;
  IngredientDecorator(this.ingredient);
  affiche(){
    ingredient.affiche();
  }
}

class SauceSalee extends IngredientDecorator{

  SauceSalee(super.ingredient);

  @override
  affiche(){
    super.affiche();
    print("+ Sauce salée");
  }
}
class SauceSucree extends IngredientDecorator{

  SauceSucree(super.ingredient);

  @override
  affiche(){
    super.affiche();
    print("+ Sauce sucrée");
  }
}
class Wasabi extends IngredientDecorator{

  Wasabi(super.ingredient);

  @override
  affiche(){
    super.affiche();
    print("+ Wasabi");
  }
}
class Gingembre extends IngredientDecorator{

  Gingembre(super.ingredient);

  @override
  affiche(){
    super.affiche();
    print("+ Gingembre");
  }
}

main(){

  Ingredient ingredient = Wasabi(SauceSalee(Sushi()));
  ingredient.affiche();

}