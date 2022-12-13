

import 'package:flash_cards/new_card.dart';
import 'package:flash_cards/practice.dart';
import 'package:flash_cards/quest.dart';
import 'package:flash_cards/quest_card.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/card',
  routes: {
    '/card' : (context)=>CardList(),
    '/pract' : (context)=>Practicing(),
    '/add' : (context)=>NewCard(quest: Quest(question: "New Question", answer: "New Answer", index: 11),)
},
));

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {

  List<Quest> quests = [
    Quest(question: 'one', answer: 'sdvkhjbsjkhdbv ahjsbc habschl cajbjjllsdvkhjbsjkhdbv ahjsbc habschl cajbjjllsdvkhjbsjkhdbv ahjsbc habschl cajbjjll', index: 0),
    Quest(question: 'two', answer: '2', index: 1),
    Quest(question: 'three', answer: '3', index: 2),
    Quest(question: 'four', answer: '4', index: 3),
    Quest(question: 'five', answer: '5', index: 4),
    Quest(question: 'six', answer: '6', index: 5),
    Quest(question: 'seven', answer: '7', index: 6),
    Quest(question: 'eight', answer: '6', index: 7),
    Quest(question: 'nine', answer: '9', index: 8),
    Quest(question: 'ten', answer: '10', index: 9),
    Quest(question: 'eleven', answer: '11', index: 10),

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Container(

            child: Scaffold(
              body: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Color(0xFF4338ca), Color(0xFF6d2809)],begin: Alignment.topRight,
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
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [Color(0xFF4338ca), Color(0xFF6d2809)],begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,)
                            ),
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: quests.length,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 1,
                                    mainAxisSpacing: 1,
                                    childAspectRatio: 1
                                ),
                                itemBuilder: (BuildContext context, int index){
                                  return QuestCard(quest: quests[index]);
                                }
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
                              }, child: Text('Cards', style: TextStyle(fontSize: 25),)),
                              Spacer(),
                              TextButton(onPressed: (){Navigator.pushNamed(context, '/pract');}, child: Text('Practice', style: TextStyle(fontSize: 25),)),
                              Spacer()
                            ],

                          ),
                        ),
                      ],

                    ),

                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: (){
                  Navigator.pushNamed(context, '/add');
                },
                child: const Icon(Icons.add, color: Colors.indigo,),
              ),


            ),
          ),

      );
  }
}
