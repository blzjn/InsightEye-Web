import 'package:flutter/material.dart';
import 'package:insighteye_web/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:intl/intl.dart';

import 'package:insighteye_web/componets/completed_pgm_card.dart';

// ignore: must_be_immutable
class Completeddayview extends StatefulWidget {
  String? orgId;

  Completeddayview({Key? key, this.orgId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CompleteddayviewState createState() => _CompleteddayviewState();
}

class _CompleteddayviewState extends State<Completeddayview> {
  final List _allpgm = [];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String cday = DateFormat('MM d y').format(now);
    return ScrollConfiguration(
      behavior: htechassignswipe(),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("organizations")
                .doc("${widget.orgId}")
                .collection("Completedpgm")
                .doc("Day")
                .collection(cday)
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Something Went Wrong :(",
                    style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 17,
                        color: hpColor),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                  width: double.infinity,
                  color: white,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: hpColor,
                    ),
                  ),
                );
              }
              _allpgm.clear();
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map a = document.data() as Map<String, dynamic>;
                _allpgm.add(a);
                a['uid'] = document.id;
              }).toList();

              return Column(
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  for (var i = 0; i < _allpgm.length; i++) ...[
                    Completedpgmcard(
                      name: _allpgm[i]["name"],
                      address: _allpgm[i]["address"],
                      loc: _allpgm[i]["loc"],
                      pgm: _allpgm[i]["pgm"],
                      phn: _allpgm[i]["phn"],
                      type: _allpgm[i]["type"],
                      upDate: _allpgm[i]["upDate"],
                      upTime: _allpgm[i]["upTime"],
                      docname: _allpgm[i]["docname"],
                      remarks: _allpgm[i]["remarks"],
                      cdate: _allpgm[i]["cdate"],
                      ctime: _allpgm[i]["ctime"],
                      tname: _allpgm[i]["techname"],
                      chrg: _allpgm[i]["chrg"],
                      camount: _allpgm[i]["camount"],
                    )
                  ]
                ],
              );
            }),
      ),
    );
  }
}

// ignore: camel_case_types
class htechassignswipe extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}
