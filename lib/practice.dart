import 'package:flash_cards/quest_card.dart';
import 'package:flutter/material.dart';
import 'package:flash_cards/main.dart';
import 'package:flash_cards/quest.dart';
class Practicing extends StatefulWidget {
  const Practicing({super.key, });

  @override
  State<Practicing> createState() => _PracticingState();
}


class _PracticingState extends State<Practicing> {



  @override
  Widget build(BuildContext context) {
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
                                          Text("Card #1"),
                                          Spacer(),
                                          Text(
                                            'one',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black45,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
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
                      Row(
                        children: [
                          Spacer(),
                          TextButton(onPressed: (){}, child: Text('Show Answer', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),)),
                          Spacer(),
                          IconButton(onPressed: (){}, icon: CircleAvatar(child: Icon(Icons.navigate_next, color: Colors.indigo,), backgroundColor: Colors.blue,)),
                          Spacer(),
                        ],
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
