import 'package:insighteye_web/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insighteye_web/componets/customer_list_card.dart';

class Customersrc extends StatefulWidget {
  final String? orgId;
  const Customersrc({Key? key, this.orgId}) : super(key: key);

  @override
  _CustomersrcState createState() => _CustomersrcState();
}

class _CustomersrcState extends State<Customersrc> {
  FirebaseFirestore fb = FirebaseFirestore.instance;
  final controller = TextEditingController();
  List resultc = [];

  String textquery = '';

  final List _allcustomer = [];

  void searchcustomer(String query) {
    setState(() {
      resultc = _allcustomer.where((pgm) {
        final nameLower = pgm["name"]!.toLowerCase();
        final addressLower = pgm["address"]!.toLowerCase();
        final locLower = pgm["loc"]!.toLowerCase();
        final phn1umber = pgm["phn1"]!;
        final phn2umber = pgm["phn2"]!;
        final searchquery = query.toLowerCase();

        return nameLower.contains(searchquery) ||
            addressLower.contains(searchquery) ||
            locLower.contains(searchquery) ||
            phn1umber.contains(searchquery) ||
            phn2umber.contains(searchquery);
      }).toList();
    });
    // searching is postponed
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    const styleActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = controller.text.isEmpty ? styleHint : styleActive;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 30, top: 20),
          child: Text(
            "Customer Details",
            style: TextStyle(
              fontFamily: "Nunito",
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: Padding(
                padding: EdgeInsets.only(
                    left: s.width * 0.1, right: s.width * 0.15, top: 10),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 5,
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 5))
                      ]),
                  child: Container(
                    height: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: TextField(
                      controller: controller,
                      decoration: InputDecoration(
                        icon: Icon(Icons.search, color: style.color),
                        suffixIcon: controller.text.isNotEmpty
                            ? GestureDetector(
                                child: Icon(Icons.close, color: style.color),
                                onTap: () {
                                  controller.clear();
                                  searchcustomer('');
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                },
                              )
                            : null,
                        hintText: "Search",
                        hintStyle: style,
                        border: InputBorder.none,
                      ),
                      style: style,
                      onChanged: searchcustomer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: hpColor),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: const Row(
              children: [
                SizedBox(
                  width: 18,
                ),
                Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Center(
                      child: Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    )),
                Flexible(
                    fit: FlexFit.tight,
                    flex: 3,
                    child: Text(
                      "Address",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: white),
                    )),
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Center(
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                    )),
                SizedBox(
                  width: 145,
                  child: Center(
                    child: Text(
                      "Phone Number",
                      style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                  ),
                ),
                SizedBox(
                  width: 60,
                )
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 3,
                      blurRadius: 5,
                      color: Colors.black.withOpacity(0.1),
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: StreamBuilder<QuerySnapshot>(
                        stream: fb
                            .collection("organizations")
                            .doc("${widget.orgId}")
                            .collection('Customer')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return const Text(
                              'Something went Wrong',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Padding(
                              padding: EdgeInsets.only(top: s.height * 0.24),
                              child: const Center(
                                child: CircularProgressIndicator(
                                  color: bluebg,
                                ),
                              ),
                            );
                          }

                          _allcustomer.clear();
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                            Map a = document.data() as Map<String, dynamic>;
                            _allcustomer.add(a);
                            a['uid'] = document.id;
                          }).toList();

                          if (controller.text.isEmpty) {
                            resultc = _allcustomer;
                          }

                          return ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: resultc.length,
                              itemBuilder: (context, i) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 3),
                                    child: CustomerListCard(
                                      orgId: widget.orgId,
                                      name: resultc[i]['name'],
                                      address: resultc[i]['address'],
                                      loc: resultc[i]['loc'],
                                      phn1: resultc[i]['phn1'],
                                      phn2: resultc[i]['phn2'],
                                      upDate: resultc[i]['upDate'],
                                      upTime: resultc[i]['upTime'],
                                      docname: resultc[i]['docname'],
                                      prospec: resultc[i]['prospec'],
                                      instadate: resultc[i]['instadate'],
                                    ),
                                  ));
                        }),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
