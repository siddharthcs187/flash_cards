import 'package:flash_cards/quest.dart';
import 'package:flutter/material.dart';

import 'package:flash_cards/main.dart';

class QuestCard extends StatelessWidget {
  final Quest quest;

  const QuestCard({super.key, required this.quest});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(

        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.indigo,

        ),
        child: Card(

          margin: EdgeInsets.all(8),
            child: Container(

              decoration: BoxDecoration(
                color: Colors.indigo,

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [ Text(
                      quest.question,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black45,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),


                  SizedBox(height: 2,),
                  Text(
                    quest.answer,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16.5,
                        color: Colors.black45
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,

                  ),
                  SizedBox(height:1),
                  Spacer(),
                  IconButton( icon: Icon(Icons.delete), onPressed: () {}, alignment: Alignment.bottomRight,color: Colors.black,)
                ],
              ),
            ),
          ),

      ),
    );
  }
}