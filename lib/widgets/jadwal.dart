import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Jadwal extends StatelessWidget {
  Jadwal({super.key, this.nama, this.jam});

  String? nama;
  String? jam;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$nama',
          style: const TextStyle(fontSize: 18),
        ),
        Text(
          '$jam',
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
