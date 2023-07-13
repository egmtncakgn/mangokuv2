import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mangokuv2/screens/adminpage.dart';
import '../styles/mstyles.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final usr = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 50, backgroundImage: NetworkImage(usr!.photoURL!)),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "       Profil Sayfası \n${usr.displayName}",
                style: Mstyles().m1TxStyle,
              ),
            ),
            AdminButton(
              user: usr,
            ),
            const SizedBox(height: 150),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: const Text("Çıkış Yap")),
          ],
        ),
      ),
    );
  }
}

class AdminButton extends StatelessWidget {
  const AdminButton({
    required this.user,
    super.key,
  });
  final User? user;
  @override
  Widget build(BuildContext context) {
    if (user?.uid == "NzISiTDfyjYVUZ3UcURyCDri8Zt1") {
      return ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const AdminPage())));
          },
          child: const Text("Admin Panel"));
    } else {
      return const SizedBox();
    }
  }
}
