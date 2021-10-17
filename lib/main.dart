import 'package:clubhouse/room_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1eee4),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              scrollDirection: Axis.vertical,
              // child: Column(
              children: [
                _AppBar(),
                const SizedBox(height: 24.0),
                _Room(
                  title1: "STARTUP CLUB 🏠",
                  title2: "🤓MASTERCLASS: Write a Tech\nResume That Pays",
                  users: 93,
                  talking: 7,
                  image1: "assets/user0.png",
                  image2: "assets/user1.png",
                  text1: Text("Kate Pozeznik"),
                  text2: Text("Nikita Gupta"),
                  text3: Text("Mike"),
                ),
                const SizedBox(height: 24.0),
                _Room(
                  title1: "YOUNG, WILD & FREE 🏠",
                  title2:
                      "TRUE CRIME 💀🎃Serial Killers,\nAbduction & DARK WEB",
                  users: 1000,
                  talking: 65,
                  image1: "assets/user3.png",
                  image2: "assets/user4.png",
                  text1: Text("Dhruvin busa"),
                  text2: Text("Marzia Dossal"),
                  text3: Text("Akshita Nikki"),
                ),
                const SizedBox(height: 24.0),
                _Room(
                  title1: "HOT ON THE MIC 🏠 ",
                  title2: "✨Afternoon Delight Comedy Show! \n😂🚀🍑",
                  users: 343,
                  talking: 61,
                  image1: "assets/user5.png",
                  image2: "assets/user6.png",
                  text1: Text("Leah Lamarr"),
                  text2: Text("Christine Little"),
                  text3: Text("Fizaa Dosani"),
                  text4: Text("Dylan Blau"),
                ),
              ],
            ),
            // ),
            Align(alignment: Alignment.bottomCenter, child: _BottomBar()),
          ],
        ),
      ),
    );
  }
}

class _Room extends StatelessWidget {
  final String title1;
  final String title2;
  final int users;
  final int talking;
  final String image1;
  final String image2;
  final Text? text1, text2, text3, text4;

  const _Room({
    Key? key,
    required this.title1,
    required this.title2,
    required this.users,
    required this.talking,
    required this.image1,
    required this.image2,
    this.text1,
    this.text2,
    this.text3,
    this.text4,
  }) : super(key: key);

  void open(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) {
        return RoomScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => open(context),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: double.infinity,
          height: 260.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title1,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w900,
                      )),
                  Spacer(),
                  Icon(Icons.more_horiz)
                ],
              ),
              Text(
                title2,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100.0,
                    width: 60.0,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        FractionalTranslation(
                          translation: Offset(0.3, 0.3),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(image2),
                            ),
                          ),
                        ),
                        FractionalTranslation(
                          translation: Offset(-0.1, -0.1),
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(16.0),
                              child: Image.asset(image1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 40.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Text("$text1 💬",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Text("$text2 💬",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Text("$text3 💬",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Text("$text4 💬",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8.0),
                      Text("$users 👤/ $talking 💬"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.search,
            size: 40.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.mark_email_unread_outlined, size: 40.0),
              const SizedBox(width: 24.0),
              Icon(Icons.calendar_today_outlined, size: 35.0),
              const SizedBox(width: 24.0),
              Icon(Icons.notifications_none, size: 40.0),
              const SizedBox(width: 24.0),
              SizedBox(
                height: 40.0,
                width: 40.0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset("assets/user0.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomBar extends StatelessWidget {
  // final Widget? child;
  // const _BottomBar ({
  //   Key? key,
  //   this.child,
  // }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [
            Color(0xfff1eee4),
            Colors.white.withOpacity(0.1),
          ],
          stops: [0.1, 1.0],
        ),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ()),
          );
        },
        child: const Text(
          "Start a Room",
        ),
      ),
    );
  }
}

      // child: Stack(
      //   children: [
      //     Center(
      //       child: Container(
      //         height: 60.0,
      //         width: 200.0,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(60.0),
      //           color: Color(0xff39ab64),
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //           children: [
      //             Icon(
      //               Icons.add,
      //               color: Colors.white,
      //               size: 40.0,
      //             ),
      //             Text(
      //               "Start a room",
      //               style: TextStyle(
      //                 fontSize: 20.0,
      //                 color: Colors.white,
      //                 fontWeight: FontWeight.bold,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
          // ),
//         child:  Align(
//             alignment: Alignment.centerLeft,
//             child: Padding(
//               padding: const EdgeInsets.only(left: 16.0),
//               child: Container(
//                 height: 40.0,
//                 width: 40.0,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     rowOfDots,
//                     rowOfDots,
//                     rowOfDots,
//                   ],
//                 ),
//               ),
//             ),
//           );
//     //     ],
//     //   ),
//     // );
//   }
// }

// final rowOfDots = Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: [
//     dot,
//     dot,
//     dot,
//   ],
// );

// final Widget dot = Container(
//   width: 8.0,
//   height: 8.0,
//   decoration: BoxDecoration(
//     color: Colors.black,
//     borderRadius: BorderRadius.circular(15.0),
//   ),
// );
