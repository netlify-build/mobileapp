import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class NetlifyFirebaseUser {
  NetlifyFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

NetlifyFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<NetlifyFirebaseUser> netlifyFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<NetlifyFirebaseUser>(
      (user) {
        currentUser = NetlifyFirebaseUser(user);
        return currentUser!;
      },
    );
