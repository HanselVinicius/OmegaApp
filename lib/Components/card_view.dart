
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:omega_app/Components/confirmation_dialog.dart';

import '../Models/user.dart';

class CardView extends StatelessWidget {
  const CardView({ Key? key,
   required this.user, required this.onDelete}) : super(key: key);
    final User user;
    final Function(User) onDelete;
  @override
  Widget build(BuildContext context){
    return InkWell(
      child: Card(
        clipBehavior: Clip.hardEdge,
        color: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(user.userName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  Text(user.userHistory.toString()),
                ],
              ),
            ),
            Image.memory(const Base64Decoder().convert(user.userPhoto),
              height: 80,
              width: 80,
              fit: BoxFit.cover,)
          ],
        ),
      ),
    onLongPress: () {
      // print('A BOSTA DO NOME É : ${user.userName}');

      showConfirmationDialog(context,user: user, onDelete: onDelete);
    },);
  }
}