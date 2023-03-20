import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            TextFormField(
              textCapitalization: TextCapitalization.sentences,
              onChanged: (val) {
                setState(() {
                  inputText = val;
                  print(inputText);
                });
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              width: MediaQuery.of(context).size.width,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("/Medicine_and_Products")
                      .where("Name", isGreaterThanOrEqualTo: inputText)
                      .snapshots(),
                  builder: (BuildContext context,
                      AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Something went wrong"),
                      );
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Text("Loading"),
                      );
                    }

                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data() as Map<String, dynamic>;
                        return Container(
                            height: MediaQuery.of(context).size.height / 50,
                            color: Color(0xffb27bbb),
                            child: Text(data['Name']));
                      }).toList(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
