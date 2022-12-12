abstract class PartageStrategy {
  partager(Media m);
}

class DataMedia{
  String name;
  DataMedia(this.name);
}

abstract class Media {
  abstract DataMedia data;

  partager(PartageStrategy ps);
}

class Image implements Media {
  @override
  partager(PartageStrategy ps) {
    ps.partager(this);
  }

  @override
  DataMedia data;

  Image(this.data);
}

class Publication implements Media {
  @override
  partager(PartageStrategy ps) {
    ps.partager(this);
  }

  @override
  DataMedia data;

  Publication(this.data);
}

class PartageFacebook implements PartageStrategy {
  late String apiUrl;
  PartageFacebook(this.apiUrl);

  @override
  partager(Media m) {
    print("Send data to $apiUrl ${m.data.name}");
  }
}

class PartageInstagram implements PartageStrategy {
  late String apiUrl;
  PartageInstagram(this.apiUrl);

  @override
  partager(Media m) {
    print("Send data to $apiUrl ${m.data.name}");
  }
}

main() {
  Image image = Image(DataMedia("mon image"));

  Publication publication = Publication(DataMedia("ma pub"));

  PartageFacebook pf = PartageFacebook("facebook/url");

  publication.partager(pf);
  image.partager(pf);

  PartageInstagram pi = PartageInstagram("instagram/url");

  publication.partager(pi);
  image.partager(pi);
}
