import 'package:flutter/material.dart';
import 'package:flutter_crud/models/user.dart';
import 'package:flutter_crud/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    final CircleAvatar avatar;
    if (user.avatarUrl.isEmpty) {
      avatar = avatar = const CircleAvatar(child: Icon(Icons.person));
    } else {
      avatar =
          avatar = CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    }

    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.USER_FORM,
                    arguments: user,
                  );
                },
                color: Colors.blue,
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {},
                color: Colors.red,
                icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
