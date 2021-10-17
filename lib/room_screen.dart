import 'package:flutter/material.dart';

class RoomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff1eee4),
      child: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            Expanded(child: const _MainView()),
          ],
        ),
      ),
    );
  }
}

class _MainView extends StatelessWidget {
  const _MainView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.only(right: 16.0)),
                  Text(
                    "Add a title",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  // Icon(Icons.more_horiz, color: Colors.black, size: 35.0),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (_, index) => _User(
                  name: "user$index",
                  image: "assets/user$index.png",
                ),
              ),
            ),
            const _BottomBar(),
          ],
        ),
      ),
    );
  }
}

class _User extends StatelessWidget {
  final String name;
  final String image;

  const _User({Key? key, required this.name, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 90.0,
          width: 90.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40.0),
            child: Image.asset(image),
          ),
        ),
        const SizedBox(height: 8.0),
        Text(name)
      ],
    );
  }
}

class _BottomBar extends StatelessWidget {
  const _BottomBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: 300.0,
      child: Center(
        child: Text(
          "🎉 Let's go",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffe75b5b),
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
