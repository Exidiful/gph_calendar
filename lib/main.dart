// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white,
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black87,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Title(
                  title: "April",
                  color: Colors.white,
                  child: Column(
                    children: [
                      Text(
                        "April",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                      GridView.builder(
                        shrinkWrap: true,
                        itemCount: 31, // total number of items
                        itemBuilder: (context, index) {
                          return Status(
                              date: DateTime.now().copyWith(day: index));
                        },
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 1,
                          crossAxisCount: 7,
                        ),
                      ),
                    ],
                  )),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  GridTile(title: "Sun"),
                  GridTile(title: "Mon"),
                  GridTile(title: "Tue"),
                  GridTile(title: "Wed"),
                  GridTile(title: "Thu"),
                  GridTile(title: "Fri"),
                  GridTile(title: "Sat"),
                ],
              ),
            ],
          ),
        ));
  }
}

class GridTile extends StatelessWidget {
  final String title;
  const GridTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 10, color: Colors.white),
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final DateTime date;
  const Status({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
          child: DateTime.now().day == date.day
              ? Container(
                  margin: EdgeInsets.all(22.5),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 3, color: Colors.green)),
                )
              : date.day < DateTime.now().day
                  ? Container(
                      margin: EdgeInsets.all(22.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                    )
                  : Container(
                      margin: EdgeInsets.all(22.5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white30),
                    )

          // Text(
          //     date.day.toString(),
          //     style: TextStyle(fontSize: 13, color: Colors.white70),
          //   ),
          ),
    );
  }
}

class Day {
  final bool holiday;
  final DateTime date;
  final List<String> shiftsWorkingUser;

  Day(
    this.holiday,
    this.date,
    this.shiftsWorkingUser,
  );
}
