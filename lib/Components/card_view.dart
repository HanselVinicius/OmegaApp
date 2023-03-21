import 'dart:convert';

import 'package:flutter/material.dart';

import '../Models/user.dart';

class CardView extends StatelessWidget {
  const CardView({ Key? key,
   required this.user}) : super(key: key);
    final User user;

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
                  Text(user.userHistory),
                ],
              ),
            ),
            Image.memory(base64Decode(user.userPhoto),
              height: 80,
              width: 80,
              fit: BoxFit.cover,)
          ],
        ),
      ),
    );
  }
}