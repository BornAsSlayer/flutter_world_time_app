import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(url: "Europe/London", location: "London", flag: "uk.png"),
    WorldTime(
        url: "Asia/Singapore", location: "Singapore", flag: "singapore.png"),
    WorldTime(url: "Europe/Berlin", location: "Berlin", flag: "berlin.png"),
    WorldTime(url: "Asia/Seoul", location: "Seoul", flag: "seoul.jpg"),
    WorldTime(url: "Asia/Kolkata", location: "India", flag: "india.png"),
    WorldTime(url: "Europe/Madrid", location: "Madrid", flag: "spain.png"),
    WorldTime(url: "Etc/GMT+3", location: "Kuwait", flag: "kuwait.jpg"),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    if (mounted) {
      Navigator.pop(context, {
        "location": instance.location,
        "flag": instance.flag,
        "time": instance.time,
        "isDayTime": instance.isDayTime,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text("Choose a Location"),
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/image/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
