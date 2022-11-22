//en dart toute class est une interface

abstract class Scan {
  void scanner(String content);
}

abstract class Imprime {
  void imprimer(String content);
}

abstract class ImprimeRectoVerso {
  void imprimerRectoVerso(String content);
}

abstract class Fax {
  void faxer(String content);
}

class ImprimanteSuperChere implements Imprime, ImprimeRectoVerso, Scan, Fax {
  @override
  void faxer(String content) {
    print(content);
  }

  @override
  void imprimer(String content) {
    print(content);
  }

  @override
  void imprimerRectoVerso(String content) {
    print(content);
  }

  @override
  void scanner(String content) {
    print(content);
  }

}

class ImprimantePasChere implements Imprime {
  @override
  void imprimer(String content) {
    print(content);
  }

}


main() {
  List<Imprime> list = [];
  ImprimantePasChere imprimante1 = ImprimantePasChere();
  ImprimanteSuperChere imprimante2 = ImprimanteSuperChere();
  list.add(imprimante1);
  list.add(imprimante2);

  list.forEach((imp) {
    imp.imprimer("test imprimer");
  },);
  imprimante2.faxer("test faxer");
}

