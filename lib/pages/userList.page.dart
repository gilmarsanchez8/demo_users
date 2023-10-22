import 'package:demo_users/database/user_dao.dart';
import 'package:demo_users/models/userModel.model.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  final dao = UserDao();
  List<UserModel> users = [];

  @override
  void initState() {
    getUserList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context = context;
    return Scaffold(
      appBar: appBar(),
      body: userList(ctx: context),
    );
  }

  Widget userList({required BuildContext ctx}) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      itemCount: users.length,
      itemBuilder: (ctx, index) {
        final user = users[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                contentCard(
                    text:
                        'Name: ${user.name.toUpperCase()} ${user.lastname.toUpperCase()}',
                    icon: Icons.account_circle_outlined),
                contentCard(
                    text: 'Birthdate: ${user.birthdate}',
                    icon: Icons.date_range_outlined),
                contentCard(
                    text: 'Address: ${user.address}',
                    icon: Icons.location_on_outlined),
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Row(
        children: const [
          Icon(Icons.account_circle_outlined),
          SizedBox(width: 5),
          Text('UserApp'),
        ],
      ),
    );
  }

  Widget contentCard({required String text, required IconData icon}) {
    return Row(
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }

  getUserList() async {
    List<UserModel> list = await dao.readAll();
    setState(() {
      users = list;
    });
  }
}
