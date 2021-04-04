import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (String value) {
        print(value);
      },
      decoration: InputDecoration(
        hintText: "Gericht suchen...",
        hintStyle: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: 12,
          letterSpacing: 0.4,
        ),
        prefixIcon: iconBtn(),
        border: InputBorder.none,
      ),
    );
  }

  Widget iconBtn() {
    return IconButton(
        icon: Icon(
          Icons.search,
          size: 40,
          color: Colors.red[700],
        ),
        onPressed: () {
          print('Buttom OnPressed!!');
        });
  }
}
