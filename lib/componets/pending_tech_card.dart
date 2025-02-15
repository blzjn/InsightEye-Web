// import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:insighteye_web/constants/constants.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insighteye_web/Models/customer_history.dart';

// import 'package:insighteye_web/services/history.dart';
import 'package:insighteye_web/Models/pgm.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PendingTechcard extends StatelessWidget {
  String? uid;
  String? techuid;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? chrg;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  String? remarks;
  String? ptime;
  String? pdate;
  String? pdocname;
  String? prospec;
  String? instadate;
  String? techname;
  String? custdocname;
  String? orgId;

  PendingTechcard(
      {Key? key,
      this.uid,
      this.techuid,
      this.name,
      this.address,
      this.loc,
      this.phn,
      this.type,
      this.chrg,
      this.pgm,
      this.upDate,
      this.upTime,
      this.docname,
      this.remarks,
      this.pdate,
      this.ptime,
      this.pdocname,
      this.prospec,
      this.instadate,
      this.custdocname,
      this.techname
      , this.orgId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 5,
              color: secondbg.withOpacity(0.18),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      width: s.width * 0.1,
                      child: Text(
                        "$address",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: s.width * 0.4,
                      child: Text(
                        "$pgm",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF666666),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "$upDate",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "$upTime",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.pin_drop_outlined,
                        color: hpColor,
                      ),
                      Text(
                        "  $loc",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      Container(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Type : $type",
                          style: const TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            color: Color(0xFF0e2f44),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 50,
                      ),
                      const Icon(
                        Icons.phone_android,
                        color: Color(0xFF008080),
                      ),
                      Text(
                        "  $phn",
                        style: const TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF008080),
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ConfirmBox(
                              uid: uid,
                              techuid: techuid,
                              name: name,
                              address: address,
                              loc: loc,
                              phn: phn,
                              type: type,
                              chrg: chrg,
                              pgm: pgm,
                              upDate: upDate,
                              upTime: upTime,
                              docname: docname,
                              pdocname: pdocname,
                              prospec: prospec,
                              instadate: instadate,
                              techname: techname,
                              custdocname: custdocname,
                              orgId: orgId,
                            );
                          });
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent),
                      child: const Center(
                        child: Text(
                          "Convert",
                          style: TextStyle(
                            fontFamily: "Nunito",
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 20),
                    const Text(
                      "Remarks : ",
                      style: TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "$remarks",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Completed Date : $ptime",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Completed Time :  $pdate",
                      style: const TextStyle(
                        fontFamily: "Nunito",
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ConfirmBox extends StatelessWidget {
  String? uid;
  String? techuid;
  String? name;
  String? address;
  String? loc;
  String? phn;
  String? type;
  String? chrg;
  String? pgm;
  String? upDate;
  String? upTime;
  String? docname;
  String? pdocname;
  String? prospec;
  String? instadate;
  String? techname;
  String? custdocname;
  String? orgId;


  ConfirmBox({
    Key? key,
    this.uid,
    this.techuid,
    this.name,
    this.address,
    this.loc,
    this.phn,
    this.type,
    this.chrg,
    this.pgm,
    this.upDate,
    this.upTime,
    this.docname,
    this.pdocname,
    this.prospec,
    this.instadate,
    this.custdocname,
    this.techname,
    this.orgId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: SizedBox(
        height: 300,
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: primarybg,
                    size: 30,
                  ),
                  Text(
                    "Confirm",
                    style: TextStyle(
                      fontFamily: "Nunito",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Do you want to convert to Main List?",
              style: TextStyle(
                fontFamily: "Nunito",
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: white, borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                InkWell(
                  onTap: () => coverttomain(context),
                  child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: white),
                    child: const Center(
                      child: Text(
                        "Okay",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void coverttomain(BuildContext context) async {
    FirebaseFirestore fb = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    String hisdocname = DateFormat('MM d y kk:mm:ss').format(now);
    String date = DateFormat('d MMM y').format(now);
    String time = DateFormat('h:mma').format(now);
    Pgmdata pgmr = Pgmdata(
        uid: uid,
        name: name,
        address: address,
        loc: loc,
        phn: phn,
        pgm: pgm,
        chrg: chrg,
        type: type,
        upDate: upDate,
        upTime: upTime,
        prospec: prospec,
        instadate: instadate,
        docname: docname,
        custdocname: custdocname,
        status: "pending");

        CustomerPgmHistory custhistory = CustomerPgmHistory(
        upDate: date,
        upTime: time,
        msg: "Program is converted to Mainlist",
        status: "pending",
        docname: hisdocname,
        custdocname: custdocname);

    await fb
    .collection("organizations")
          .doc("$orgId")
        .collection("technician")
        .doc(techuid)
        .collection("Pendingpgm")
        .doc(pdocname)
        .delete()
        .catchError(
            (error) => print("Failed to Delete Pending pgm list : $error"));

    // customer program history updated
        fb
        .collection("organizations")
          .doc("$orgId")
            .collection("Customer")
            .doc(custdocname)
            .collection("Programs")
            .doc(docname)
            .collection("History")
            .doc(hisdocname)
            .set(custhistory.toMap());

    await fb
    .collection("organizations")
          .doc("$orgId")
        .collection("Programs")
        .doc("$docname")
        .set(pgmr.toMap())
        .then((value) {
      Navigator.pop(context);
    });
  }
}
