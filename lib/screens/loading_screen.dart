import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

String apiKey = 'Get API key from openweathermap.org';
String city = 'Riyadh';

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    print(loc.latitude.toString() + ', ' + loc.longitude.toString());
  }

  void getWeatherData() async {
    Response response = await get(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey');
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
            //getWeatherData();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
