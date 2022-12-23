import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flash_cards/new_card.dart';
import 'package:flash_cards/practice.dart';
import 'package:flash_cards/quest.dart';
import 'package:flash_cards/quest_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
  initialRoute: '/card',
  routes: {
    '/card' : (context)=>CardList(),
    '/pract' : (context)=>Practicing(),
    '/add' : (context)=>NewCard(quest: Quest(question: "New Question", answer: "New Answer", index: 11),)
},
));}

class CardList extends StatefulWidget {
  const CardList({Key? key}) : super(key: key);

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  Widget buildQuestion(Dataset dataset)=>ListTile(
    tileColor: Colors.white,
    onTap: (){Navigator.pushNamed(context, '/pract');},
    title: Text(dataset.question, overflow: TextOverflow.ellipsis), subtitle: Text(dataset.answer, overflow: TextOverflow.ellipsis, maxLines: 3,), trailing: IconButton(onPressed: (){
      final docDatasets = FirebaseFirestore.instance.collection('dataset').doc();
      docDatasets.delete();
  }, icon: Icon(Icons.delete)),
  );
  Stream<List<Dataset>> readDataset()=>FirebaseFirestore.instance.collection('dataset')
      .snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Dataset.fromJson(doc.data())).toList());
  DatabaseReference reference = FirebaseDatabase.instance.ref().child('dataset');
  Widget cardItem({required Map dataset}){
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
                dataset['question'],
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
                  dataset['answer'],
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
                            child: StreamBuilder(
                              stream: readDataset(),
                              builder: (context, snapshot){
                                if(snapshot.hasData){
                                  final dataset = snapshot.data!;
                                  return Container(
                                    decoration: BoxDecoration(
                                      color: Colors.indigo.withOpacity(0.5)
                                    ),
                                    child: ListView(
                                      children: dataset.map(buildQuestion).toList(),
                                    ),
                                  );
                                }
                                else if(!snapshot.hasData){
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: Colors.indigo.withOpacity(0.5)
                                    ),
                                    child: ListView(
                                      children: [
                                        Container(
                                          child: Text("No Data!"),
                                        )
                                      ],
                                    ),
                                  );
                                }
                              else {
                              return Container(
                              decoration: BoxDecoration(
                              color: Colors.indigo.withOpacity(0.5)
                              ),
                              child: ListView(
                                children: [
                                  Center(
                                  child: Text("No Internet Connection!"),
                                  )
                                ],
                              ),
                              );
                              }
                              },


                            )

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
