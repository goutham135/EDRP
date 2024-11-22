import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

import '../helpers.dart';
import '../widgets/customAppBarShape.dart';

class SelectLanguage extends StatefulWidget {
  const SelectLanguage({super.key});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        // backgroundColor: const Color.fromRGBO(213, 61, 61, 1),
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromRGBO(213, 61, 61, 1),
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(500),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Select your language', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectWidget(text: 'English',),
                SelectWidget(text: 'Hindi',),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SelectWidget extends StatefulWidget {

  String text;

  SelectWidget({super.key, required this.text});

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}
String group = 'English';

var selectedValue = StateProvider((ref) => 'English',);

class _SelectWidgetState extends State<SelectWidget> {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.45,
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          border: group == widget.text ? Border.all(color: primaryColor) : Border.all(color: Colors.transparent)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.text, style: TextStyle(fontSize: 12),),
          Radio(
            value: widget.text,
            activeColor: primaryColor,
            groupValue: group, onChanged: (value) {
            group = value!;
            setState(() {

            });
          },)
        ],
      ),
    );
  }
}

