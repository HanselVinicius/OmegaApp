import 'package:flutter/material.dart';

import '../Models/user.dart';

Future<dynamic> showConfirmationDialog(
    BuildContext context, {
      String title = "Atenção!",
      String content = "Deseja apagar esta entrada?",
      String affirmativeOption = "Confirmar",
      required User user,
      required Function(User) onDelete,
    }) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.pop(context,false);
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                onDelete(user);
                Navigator.pop(context, true);
              },
              child: Text(
                affirmativeOption.toUpperCase(),
                style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      });
}