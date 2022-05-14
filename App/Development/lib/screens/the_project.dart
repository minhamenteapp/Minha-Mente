import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class TheProject extends StatefulWidget {
  final String text;

  const TheProject({Key? key, required this.text}) : super(key: key);

  @override
  State<TheProject> createState() => _TheProjectState();
}

class _TheProjectState extends State<TheProject> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(48.0),
        child: AppBar(
          title: new Text(
            widget.text,
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 7.5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.delete),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 7.5),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            ),
          ],
        ),
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(5.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).colorScheme.secondary),
              color: Colors.white,
            ),
            ),
        ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FittedBox(
        child: SpeedDial(
          backgroundColor: Theme.of(context).colorScheme.primary,
          icon: Icons.add,
          activeIcon: Icons.close,
          overlayColor: Theme.of(context).colorScheme.tertiary,
          overlayOpacity: 0.2,
          buttonSize: const Size(48.0, 48.0),
          childrenButtonSize: const Size(52.0, 52.0),
          direction: SpeedDialDirection.right,
          curve: Curves.bounceIn,
          children: [
            SpeedDialChild(
              child: Icon(Icons.edit),
              onTap: () {},
            ),
            SpeedDialChild(
              child: Icon(Icons.text_fields),
              onTap: () {},
            ),
            SpeedDialChild(
              child: Icon(Icons.mic),
              onTap: () {},
            ),
            SpeedDialChild(
              child: Icon(Icons.camera_alt_outlined),
              onTap: () {},
            ),
            SpeedDialChild(
              child: Icon(Icons.archive_outlined),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}