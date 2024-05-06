import 'package:clima/components/details_widget.dart';
import 'package:clima/components/error_message.dart';
import 'package:clima/components/loading_widget.dart';
import 'package:clima/model/weather_model.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/utilities/weather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getPermission();
  }

  bool isDataLoaded = false;
  bool isErrorOccurred = false;
  String? title, message;
  GeolocatorPlatform geolocatorPlatform = GeolocatorPlatform.instance;
  LocationPermission? permission;
  int code = 0;
  WeatherModel? weatherModel;
  Weather weather = Weather();
  var weatherData;

  void getPermission() async {
    permission = await geolocatorPlatform.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await geolocatorPlatform.requestPermission();
      if (permission != LocationPermission.denied) {
        if (permission == LocationPermission.deniedForever) {
          // print(
          //     'Permission permanently denied, please provide the permission to the app from the setting.');
          setState(() {
            isErrorOccurred = true;
            isDataLoaded = true;
            title = 'permission is permanently denied';
            message =
                'Please provide permission to the app from device setting';
          });
        } //else {
        // print('permission granted');
        //}
        updateUi();
      } //else {
      // print('User denied the request.');
      //}
    } else {
      updateUi();
    }
  }

  void updateUi({String? cityName}) async {
    if (cityName == null || cityName == '') {
      weatherData = null;
      if (!await geolocatorPlatform.isLocationServiceEnabled()) {
        setState(() {
          isErrorOccurred = true;
          isDataLoaded = true;
          title = 'Location is turn off';
          message =
              'Please enable the location service to see weather condition for your location';
          return;
        });
      }
      weatherData = await weather.getLocation();
    } else {
      weatherData = await weather.getCityWeather(cityName);
    }

    if (weatherData == null) {
      setState(() {
        title = 'City not found';
        message = 'Please make sure you have entered the right city name';
        isDataLoaded = true;
        isErrorOccurred = true;
        return;
      });
    }
    code = weatherData['weather'][0]['id'];
    weatherModel = WeatherModel(
      description: weatherData['weather'][0]['description'],
      temperature: weatherData['main']['temp'],
      location: weatherData['name'] + ', ' + weatherData['sys']['country'],
      feelsLike: weatherData['main']['feels_like'],
      humidity: weatherData['main']['humidity'],
      wind: weatherData['wind']['speed'],
      icon:
          'images/weather-icons/${getIconPrefix(code)}${kWeatherIcons[code.toString()]!['icon']}.svg',
    );
    setState(() {
      isDataLoaded = true;
      isErrorOccurred = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isDataLoaded != true) {
      return const LoadingWidget();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kOverlayColor,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: TextField(
                        decoration: kFilledDecoration,
                        onSubmitted: (String typedName) {
                          setState(
                            () {
                              isDataLoaded = false;
                              updateUi(cityName: typedName);
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isDataLoaded = false;
                            isErrorOccurred = false;
                            getPermission();
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white12,
                          elevation: 1,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const SizedBox(
                          height: 60,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'My Location',
                                  style: kTextFilledTextStyle,
                                ),
                              ),
                              Icon(
                                Icons.gps_fixed,
                                color: Colors.white60,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              isErrorOccurred
                  ? ErrorMessage(title: title!, message: message!)
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.location_city,
                                color: kMidnightColor,
                              ),
                              const SizedBox(width: 12),
                              Text(weatherModel!.location!,
                                  style: kLocationTextStyle),
                            ],
                          ),
                          const SizedBox(height: 12),
                          SvgPicture.asset(
                            weatherModel!.icon!,
                            height: 280,
                            colorFilter: const ColorFilter.mode(kLightColor, BlendMode.srcIn),
                          ),
                          const SizedBox(height: 40),
                          Text('${weatherModel!.temperature!.round()}°',
                              style: kTempTextStyle),
                          Text(weatherModel!.description!.toUpperCase(),
                              style: kLocationTextStyle),
                        ],
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: kOverlayColor,
                  child: SizedBox(
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DetailsWidget(
                          title: 'FEELS LIKE',
                          value:
                              '${weatherModel != null ? weatherModel!.feelsLike!.round() : 0}°',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                        DetailsWidget(
                          title: 'HUMIDITY',
                          value:
                              '${weatherModel != null ? weatherModel!.humidity! : 0}',
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                        ),
                        DetailsWidget(
                          title: 'WIND',
                          value:
                              '${weatherModel != null ? weatherModel!.wind!.round() : 0}',
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
