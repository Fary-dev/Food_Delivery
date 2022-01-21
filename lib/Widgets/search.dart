import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mjam/Contants/Color.dart';

class Search extends StatefulWidget {
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      style:
<<<<<<< HEAD
          Theme.of(context).primaryTextTheme.headline3.apply(fontSizeDelta: 2),
=======
          Theme.of(context).primaryTextTheme.headline3!.apply(fontSizeDelta: 2),
>>>>>>> 8b751dfdac8e3c1220590962ac203aec42fcd6e8
      keyboardType: TextInputType.text,
      controller: textEditingController,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        filled: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
        fillColor: Theme.of(context).bottomAppBarTheme.color,
        hintText: "Gericht suchen...",
        hintStyle: Theme.of(context).primaryTextTheme.subtitle1,
        suffixIcon: textEditingController.text != ''
            ? IconButton(
                onPressed: () {
                  textEditingController.clear();
                  setState(() {});
                },
                icon: Icon(
                  CupertinoIcons.clear_circled_solid,
                  size: 20,
                  color: primaryColor,
                ),
              )
            : Icon(CupertinoIcons.search, color: Colors.grey[600]),
        border: InputBorder.none,
      ),
      onChanged: (value) {
        setState(() {});
      },
    );
  }
}
