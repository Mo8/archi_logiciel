abstract class Observer {
  notify(Streamer streamer);
}

class Viewer implements Observer {
  String name;

  Viewer(this.name);

  follow(Streamer streamer) {
    streamer.follow(this);
  }

  unfollow(Streamer streamer) {
    streamer.unfollow(this);
  }

  subscribe(Streamer streamer) {
    streamer.subscribe(this);
  }

  unsubscribe(Streamer streamer) {
    streamer.unsubscribe(this);
  }

  @override
  notify(Streamer streamer) {
    sendMail(streamer);
  }

  void sendMail(Streamer streamer) {
    print("send mail to $name : ${streamer.name} start stream");
  }
}

enum Role { subscriber, follower }

class Streamer {
  String name;
  Map<Observer, Set<Role>> observerMap = {};

  Streamer(this.name);

  startStream() {
    notifyAll();
  }

  subscribe(Observer viewer) {
    observerMap.update(
      viewer,
      (sett) {
        sett.add(Role.subscriber);
        return sett;
      },
      ifAbsent: () => {Role.subscriber},
    );
  }

  unsubscribe(Observer viewer) {
    observerMap.update(viewer, (sett) {
      sett.remove(Role.subscriber);
      return sett;
    });
  }

  follow(Observer viewer) {
    observerMap.update(
      viewer,
      (sett) {
        sett.add(Role.follower);
        return sett;
      },
      ifAbsent: () => {Role.follower},
    );
  }

  unfollow(Observer viewer) {
    observerMap.update(viewer, (sett) {
      sett.remove(Role.follower);
      return sett;
    });
  }

  notifyAll() {
    observerMap.forEach((observer, listRole) {
      if (listRole.contains(Role.subscriber))
        observer.notify(this);
      else if (listRole.contains(Role.follower))
        Future.delayed(
          Duration(seconds: 10),
          () => observer.notify(this),
        );
    });
  }
}

main() {
  Viewer viewer1 = Viewer("1");
  Viewer viewer2 = Viewer("2");
  Streamer streamer = Streamer("the streamer");
  viewer1.subscribe(streamer);
  viewer2.follow(streamer);
  streamer.startStream();
}
