import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    String bgImage = data['isDayTime'] ? 'morninganime.jpg' : 'nightanime.jpg';

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/image/$bgImage"),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
            child: Column(children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(
                      fontSize: 28,
                      letterSpacing: 2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                data['time'],
                style: const TextStyle(
                  fontSize: 66,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              TextButton.icon(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      "time": result['time'],
                      "location": result["location"],
                      "isDayTime": result["isDayTime"],
                      "flag": result["flag"],
                    };
                  });
                },
                icon: const Icon(Icons.edit_location),
                label: const Text(
                  "Edit Location",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
