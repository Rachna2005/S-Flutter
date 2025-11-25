import 'package:flutter/material.dart';

enum CityWeather {
  phnomPenh(
    city: 'Phnom Penh',
    minTemp: 10.0,
    maxTemp: 30.0,
    currentTemp: 12.2,
    image: '../../assets/ex4/cloudy.png',
    colors: [Color(0xFFAA75E6), Color(0xFF8E62DD)],
  ),
  paris(
    city: 'Paris',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 22.2,
    image: '../../assets/ex4/sunny.png',
    colors: [Color(0xFF72E1D1), Color(0xFF56C9B5)],
  ),
  rome(
    city: 'Rome',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    image: '../../assets/ex4/sunnyCloudy.png',
    colors: [Color(0xFFF1786A), Color(0xFFE46059)],
  ),
  toulouse(
    city: 'Toulouse',
    minTemp: 10.0,
    maxTemp: 40.0,
    currentTemp: 45.2,
    image: '../../assets/ex4/veryCloudy.png',
    colors: [Color(0xFFF6B975), Color(0xFFE5A45A)],
  );

  const CityWeather({
    required this.city,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.image,
    required this.colors,
  });

  final String city;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String image;
  final List<Color> colors;
}

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            spacing: 15,
            children: [
              WeatherCard(cityWeather: CityWeather.paris),
              WeatherCard(cityWeather: CityWeather.phnomPenh),
              WeatherCard(cityWeather: CityWeather.rome),
              WeatherCard(cityWeather: CityWeather.toulouse),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  CityWeather cityWeather;

  WeatherCard({required this.cityWeather});

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      elevation: 16,
      shadowColor: Colors.black.withOpacity(0.7),
      child: Stack(
        children: [
          Container(
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: cityWeather.colors,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white.withOpacity(0.8),
                      child: ClipOval(
                        child: Image.asset(
                          cityWeather.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cityWeather.city,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Min ${cityWeather.minTemp}°C",
                          style: TextStyle(color: Colors.white70),
                        ),
                        Text(
                          "Max ${cityWeather.maxTemp}°C",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${cityWeather.currentTemp}°C",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            top: -30,
            child: Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
