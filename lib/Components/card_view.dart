import 'package:flutter/material.dart';

class CardView extends StatelessWidget {
  const CardView({ Key? key,
    required this.itemName,
    required this.itemHistory,
    required this.imageURI }) : super(key: key);
  final String itemName;
  final String itemHistory;
  final String imageURI;

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
                  Text(itemName, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                  Text(itemHistory),
                ],
              ),
            ),
            Image(
              image: AssetImage(imageURI),
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}