import 'package:flash_cards/quest_card.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/main.dart';
import 'package:flash_cards/quest.dart';
class NewCard extends StatefulWidget {
  final Quest quest;
  const NewCard({super.key, required this.quest, });

  @override
  State<NewCard> createState() => _NewCardState();
}


class _NewCardState extends State<NewCard> {
  final _questionController = TextEditingController();
  final _answerController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    void cardnew(){
      Quest(question: _questionController.text, answer: _answerController.text, index: 11);
      Navigator.pushNamed(context, '/card');
    }
    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xff4338ca), Color(0xff6d2809)],begin: Alignment.topRight,
                end: Alignment.bottomLeft,)
          ),
          child: Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff4338ca), Color(0xff6d2809)],begin: Alignment.topRight,
                    end: Alignment.bottomLeft,)
              ),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Center(
                  child: Column(
                    children: [
                      Container(child: Center(child: Text('FlashCards', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.teal),)), width: double.infinity,),
                      Divider(color: Color(0xff6d2809), thickness: 3,),
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: SizedBox(
                            width: double.infinity,
                            child: Container(

                              decoration: BoxDecoration(
                                  color: Colors.indigo,
                                  borderRadius: BorderRadius.all(Radius.circular(25))
                              ),
                              child: Card(


                                margin: EdgeInsets.all(16),
                                child: Container(
                                  color: Colors.indigo,
                                  child: Container(

                                    child:  Column(
                                      children: [
                                        Text("New Card"),
                                        Spacer(),
                                        TextField(
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Question',
                                          ),
                                          controller: _questionController,
                                        ),TextField(
                                          controller: _answerController,
                                          decoration: InputDecoration(
                                            border: OutlineInputBorder(),
                                            labelText: 'Answer',
                                          ),
                                        ),
                                        TextButton(onPressed: () =>cardnew(), child: Text("Add")),

                                        Spacer(),
                                      ],
                                    ),



                                  ),
                                ),

                              ),
                            ),

                          ),
                        ),


                      ),
                      Container(
                        width: double.infinity,
                        child: Row(
                          children: [
                            Spacer(),
                            TextButton(onPressed: (){
                              Navigator.pushNamed(context, '/card');
                            }, child: Text('Cards', style: TextStyle(fontSize: 25)), ),
                            Spacer(),
                            TextButton(onPressed: (){Navigator.pushNamed(context, '/pract');}, child: Text('Practice', style: TextStyle(fontSize: 25),)),
                            Spacer(),
                          ],

                        ),
                      ),
                    ],),
                ),
              ),
            ),),)
    );
  }
}
