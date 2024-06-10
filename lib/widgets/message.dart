import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants.dart';

Padding message({required String m, required String name}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
                bottomRight: Radius.circular(16)),
          ),
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name.substring(0,name.length-10),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                  Text(m,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              )),
        ),
      ],
    ),
  );
}

Padding messageFromMe({required String m, required String name}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5),
    child: Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.lightBlue[800],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(name.substring(0,name.length-10),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Text(m,
                    style: const TextStyle(color: Colors.white, fontSize: 18)),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
