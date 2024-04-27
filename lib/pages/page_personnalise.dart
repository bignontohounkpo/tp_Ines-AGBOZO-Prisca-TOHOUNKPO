import 'package:flutter/material.dart';
class PagePerso extends StatelessWidget {
  const PagePerso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text('Politics',
            style: TextStyle (
              fontSize: 14,
              color: Colors.teal,
              fontWeight: FontWeight.w600,
              fontFamily: 'Montserrat',
            ),
            ),
            Text('Nouveau code électoral: un casse tête',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Montserrat',
            )
            ),

            Text('30/04/2023',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              color: Colors.grey[900],

            ),
            ),
            Container(
              width: 250,
              height: 250,
              margin: EdgeInsets.only(top:20, bottom: 20),
              decoration: BoxDecoration(
                image: DecorationImage (
                  image: AssetImage('assets/images/image.jpg'),
                  fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            ),

            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  "It has survived not only five centuries, "
                  "but also the leap into electronic typesetting, remaining essentially unchanged. "
                  "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              textAlign: TextAlign.justify,
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                  "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                  "when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
                  "It has survived not only five centuries, "
                  "but also the leap into electronic typesetting, remaining essentially unchanged. "
                  "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
              textAlign: TextAlign.justify,
            ),

          ],
        ),
      ),
    );
  }
}
