import 'package:flutter/material.dart';

class OptionsPage extends StatelessWidget {
  const OptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          generalOptionCard(
            image: 'assets/images/user.png',
            title: 'Create user',
            route: '/createUser',
            context: context,
          ),
          generalOptionCard(
            image: 'assets/images/severalusers.png',
            title: 'User list',
            route: '/userList',
            context: context,
          ),
        ],
      ),
    );
  }

  Widget generalOptionCard(
      {required String image,
      required String title,
      required String route,
      required BuildContext context}) {
    return TextButton(
      onPressed: () => Navigator.pushNamed(
        context,
        route,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        margin: const EdgeInsets.all(10),
        elevation: 10,
        child: Row(
          children: [
            Image(
              image: AssetImage(image),
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 18),
            ),
            const Icon(Icons.arrow_right),
          ],
        ),
      ),
    );
  }
}
