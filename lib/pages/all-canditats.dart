import 'package:tp_ines_prisca/common/Image_picker.dart';
import 'package:tp_ines_prisca/models/person.dart';
import 'package:tp_ines_prisca/pages/candidats_form.dart';
import 'package:flutter/material.dart';
import 'package:tp_ines_prisca/pages/page_personnalise.dart';


class CandidatsListPage extends StatefulWidget {
  const CandidatsListPage({super.key});

  @override
  State<CandidatsListPage> createState() => _CandidatsListPageState();
}

class _CandidatsListPageState extends State<CandidatsListPage> {
  List<Person> persons = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Center(
          child: Text(
            "Elections 🇧🇯🇧🇯",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),

          ),
        ),

      ),
      body: Container(
        child: Column(
          children: [


Padding(
            padding:EdgeInsets.only(left:20,top:40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Candidates",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.grey,
                  ),
                ),
                Padding(
                  padding:EdgeInsets.only(right: 20.0),
                  child: Text(
                    "${persons.length} candidates",style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  ),
                ),
              ],
                ),
          ),


            Expanded(
              child: ListView(
                children: persons
                    .map(
                      (person) => GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PagePerso()),);
                        },
                        child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          margin: EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                width: 80,
                                height: 80,
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Image.network(
                                  'https://guardian.ng/wp-content/uploads/2022/06/Adebayo-2.jpg',
                                  fit: BoxFit.cover,
                                  loadingBuilder: (BuildContext context, Widget child,
                                      ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes !=
                                                null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${person.name} ${person.surname}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "${person.bibliography} ",
                                        style: TextStyle(
                                            color: Colors.black.withOpacity(0.3)),
                                      ),
                                    ],
                                  ),
                                ),
                              ),


                            ],
                          ),

                        ),
                      ),
                    )
                    .toList(),
              ),
            ),

            
          ],
          
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Person person = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CandidatFormPage(),
              ));

          setState(() => persons.add(person));
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Acceul'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'vote'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }
}
