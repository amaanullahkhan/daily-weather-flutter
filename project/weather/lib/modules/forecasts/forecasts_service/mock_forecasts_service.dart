import 'package:weather/weather.dart';
import 'package:weather_app/modules/forecasts/forecasts_service/forecasts_service.dart';

class MockForecastsService extends ForecastsService {
  Future<List<List<Weather>>> forecastsOf(List<String> cities) async {
    List<dynamic> forecastsJson = await _response['list'];
    var weather = forecastsJson.map((w) => Weather(w)).toList();
    var weathers = [weather, weather, weather, weather];
    return weathers;
  }
}

var _response = {
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1577880000,
      "main": {
        "temp": 282.3,
        "feels_like": 279.19,
        "temp_min": 282.3,
        "temp_max": 285.71,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 995,
        "humidity": 46,
        "temp_kf": -3.41
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.24, "deg": 100},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-01 12:00:00"
    },
    {
      "dt": 1577890800,
      "main": {
        "temp": 281.21,
        "feels_like": 277.86,
        "temp_min": 281.21,
        "temp_max": 283.77,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 997,
        "humidity": 54,
        "temp_kf": -2.56
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.81, "deg": 60},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-01 15:00:00"
    },
    {
      "dt": 1577901600,
      "main": {
        "temp": 280.65,
        "feels_like": 277.66,
        "temp_min": 280.65,
        "temp_max": 282.35,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 998,
        "humidity": 63,
        "temp_kf": -1.7
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 99},
      "wind": {"speed": 1.63, "deg": 88},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-01 18:00:00"
    },
    {
      "dt": 1577912400,
      "main": {
        "temp": 281.59,
        "feels_like": 278.53,
        "temp_min": 281.59,
        "temp_max": 282.44,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 997,
        "humidity": 62,
        "temp_kf": -0.85
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.88, "deg": 73},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-01 21:00:00"
    },
    {
      "dt": 1577923200,
      "main": {
        "temp": 281.76,
        "feels_like": 278.68,
        "temp_min": 281.76,
        "temp_max": 281.76,
        "pressure": 1021,
        "sea_level": 1021,
        "grnd_level": 997,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.74, "deg": 67},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-02 00:00:00"
    },
    {
      "dt": 1577934000,
      "main": {
        "temp": 282.06,
        "feels_like": 279.33,
        "temp_min": 282.06,
        "temp_max": 282.06,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 998,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 69},
      "wind": {"speed": 1.25, "deg": 89},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-02 03:00:00"
    },
    {
      "dt": 1577944800,
      "main": {
        "temp": 289.44,
        "feels_like": 287.02,
        "temp_min": 289.44,
        "temp_max": 289.44,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 999,
        "humidity": 37,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 84},
      "wind": {"speed": 0.97, "deg": 94},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-02 06:00:00"
    },
    {
      "dt": 1577955600,
      "main": {
        "temp": 291.67,
        "feels_like": 289.13,
        "temp_min": 291.67,
        "temp_max": 291.67,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 996,
        "humidity": 30,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 0.92, "deg": 58},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-02 09:00:00"
    },
    {
      "dt": 1577966400,
      "main": {
        "temp": 287.66,
        "feels_like": 284.81,
        "temp_min": 287.66,
        "temp_max": 287.66,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 995,
        "humidity": 40,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.46, "deg": 334},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-02 12:00:00"
    },
    {
      "dt": 1577977200,
      "main": {
        "temp": 285.2,
        "feels_like": 281.81,
        "temp_min": 285.2,
        "temp_max": 285.2,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 996,
        "humidity": 42,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.91, "deg": 335},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-02 15:00:00"
    },
    {
      "dt": 1577988000,
      "main": {
        "temp": 284.51,
        "feels_like": 280.98,
        "temp_min": 284.51,
        "temp_max": 284.51,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 996,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 97},
      "wind": {"speed": 2.18, "deg": 360},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-02 18:00:00"
    },
    {
      "dt": 1577998800,
      "main": {
        "temp": 283.81,
        "feels_like": 281.25,
        "temp_min": 283.81,
        "temp_max": 283.81,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 995,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.03, "deg": 350},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-02 21:00:00"
    },
    {
      "dt": 1578009600,
      "main": {
        "temp": 283.41,
        "feels_like": 280.08,
        "temp_min": 283.41,
        "temp_max": 283.41,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 994,
        "humidity": 49,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.92, "deg": 318},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-03 00:00:00"
    },
    {
      "dt": 1578020400,
      "main": {
        "temp": 283.97,
        "feels_like": 280.82,
        "temp_min": 283.97,
        "temp_max": 283.97,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 995,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 97},
      "wind": {"speed": 1.84, "deg": 326},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-03 03:00:00"
    },
    {
      "dt": 1578031200,
      "main": {
        "temp": 290.31,
        "feels_like": 286.82,
        "temp_min": 290.31,
        "temp_max": 290.31,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 994,
        "humidity": 35,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 98},
      "wind": {"speed": 2.5, "deg": 302},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-03 06:00:00"
    },
    {
      "dt": 1578042000,
      "main": {
        "temp": 292.78,
        "feels_like": 289.48,
        "temp_min": 292.78,
        "temp_max": 292.78,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 991,
        "humidity": 29,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.11, "deg": 287},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-03 09:00:00"
    },
    {
      "dt": 1578052800,
      "main": {
        "temp": 287.95,
        "feels_like": 284.99,
        "temp_min": 287.95,
        "temp_max": 287.95,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 990,
        "humidity": 35,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 79},
      "wind": {"speed": 1.29, "deg": 291},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-03 12:00:00"
    },
    {
      "dt": 1578063600,
      "main": {
        "temp": 284.74,
        "feels_like": 282.03,
        "temp_min": 284.74,
        "temp_max": 284.74,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 991,
        "humidity": 41,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.79, "deg": 280},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-03 15:00:00"
    },
    {
      "dt": 1578074400,
      "main": {
        "temp": 283.32,
        "feels_like": 280.78,
        "temp_min": 283.32,
        "temp_max": 283.32,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 991,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.55, "deg": 341},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-03 18:00:00"
    },
    {
      "dt": 1578085200,
      "main": {
        "temp": 282.21,
        "feels_like": 279.83,
        "temp_min": 282.21,
        "temp_max": 282.21,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 991,
        "humidity": 49,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.35, "deg": 243},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-03 21:00:00"
    },
    {
      "dt": 1578096000,
      "main": {
        "temp": 281.24,
        "feels_like": 278.67,
        "temp_min": 281.24,
        "temp_max": 281.24,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 990,
        "humidity": 52,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.6, "deg": 166},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-04 00:00:00"
    },
    {
      "dt": 1578106800,
      "main": {
        "temp": 282.55,
        "feels_like": 279.81,
        "temp_min": 282.55,
        "temp_max": 282.55,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 991,
        "humidity": 52,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.09, "deg": 231},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-04 03:00:00"
    },
    {
      "dt": 1578117600,
      "main": {
        "temp": 289.83,
        "feels_like": 287.07,
        "temp_min": 289.83,
        "temp_max": 289.83,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 992,
        "humidity": 35,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.35, "deg": 281},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-04 06:00:00"
    },
    {
      "dt": 1578128400,
      "main": {
        "temp": 291.67,
        "feels_like": 288.4,
        "temp_min": 291.67,
        "temp_max": 291.67,
        "pressure": 1015,
        "sea_level": 1015,
        "grnd_level": 990,
        "humidity": 31,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 2.07, "deg": 277},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-04 09:00:00"
    },
    {
      "dt": 1578139200,
      "main": {
        "temp": 287.39,
        "feels_like": 284.54,
        "temp_min": 287.39,
        "temp_max": 287.39,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 989,
        "humidity": 42,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.57, "deg": 300},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-04 12:00:00"
    },
    {
      "dt": 1578150000,
      "main": {
        "temp": 284.57,
        "feels_like": 281.63,
        "temp_min": 284.57,
        "temp_max": 284.57,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 991,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.66, "deg": 340},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-04 15:00:00"
    },
    {
      "dt": 1578160800,
      "main": {
        "temp": 282.89,
        "feels_like": 280.43,
        "temp_min": 282.89,
        "temp_max": 282.89,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 992,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 0.98, "deg": 352},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-04 18:00:00"
    },
    {
      "dt": 1578171600,
      "main": {
        "temp": 282.17,
        "feels_like": 279.16,
        "temp_min": 282.17,
        "temp_max": 282.17,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 992,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.88, "deg": 334},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-04 21:00:00"
    },
    {
      "dt": 1578182400,
      "main": {
        "temp": 280.92,
        "feels_like": 278.1,
        "temp_min": 280.92,
        "temp_max": 280.92,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 992,
        "humidity": 70,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01n"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.8, "deg": 343},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-05 00:00:00"
    },
    {
      "dt": 1578193200,
      "main": {
        "temp": 282.12,
        "feels_like": 279.8,
        "temp_min": 282.12,
        "temp_max": 282.12,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 993,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {"id": 800, "main": "Clear", "description": "clear sky", "icon": "01d"}
      ],
      "clouds": {"all": 0},
      "wind": {"speed": 1.16, "deg": 331},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-05 03:00:00"
    },
    {
      "dt": 1578204000,
      "main": {
        "temp": 289.32,
        "feels_like": 286,
        "temp_min": 289.32,
        "temp_max": 289.32,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 993,
        "humidity": 41,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {"all": 17},
      "wind": {"speed": 2.58, "deg": 313},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-05 06:00:00"
    },
    {
      "dt": 1578214800,
      "main": {
        "temp": 291.65,
        "feels_like": 287.39,
        "temp_min": 291.65,
        "temp_max": 291.65,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 991,
        "humidity": 32,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.58, "deg": 319},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-05 09:00:00"
    },
    {
      "dt": 1578225600,
      "main": {
        "temp": 287.43,
        "feels_like": 284.5,
        "temp_min": 287.43,
        "temp_max": 287.43,
        "pressure": 1014,
        "sea_level": 1014,
        "grnd_level": 990,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2, "deg": 356},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-05 12:00:00"
    },
    {
      "dt": 1578236400,
      "main": {
        "temp": 286.3,
        "feels_like": 283.15,
        "temp_min": 286.3,
        "temp_max": 286.3,
        "pressure": 1016,
        "sea_level": 1016,
        "grnd_level": 993,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.99, "deg": 324},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-05 15:00:00"
    },
    {
      "dt": 1578247200,
      "main": {
        "temp": 284.64,
        "feels_like": 281.16,
        "temp_min": 284.64,
        "temp_max": 284.64,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 993,
        "humidity": 47,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.26, "deg": 325},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-05 18:00:00"
    },
    {
      "dt": 1578258000,
      "main": {
        "temp": 284.96,
        "feels_like": 280.9,
        "temp_min": 284.96,
        "temp_max": 284.96,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 993,
        "humidity": 45,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 3.02, "deg": 266},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-05 21:00:00"
    },
    {
      "dt": 1578268800,
      "main": {
        "temp": 283.16,
        "feels_like": 280.87,
        "temp_min": 283.16,
        "temp_max": 283.16,
        "pressure": 1017,
        "sea_level": 1017,
        "grnd_level": 993,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10n"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.3, "deg": 265},
      "rain": {"3h": 0.81},
      "sys": {"pod": "n"},
      "dt_txt": "2020-01-06 00:00:00"
    },
    {
      "dt": 1578279600,
      "main": {
        "temp": 282.61,
        "feels_like": 279.76,
        "temp_min": 282.61,
        "temp_max": 282.61,
        "pressure": 1019,
        "sea_level": 1019,
        "grnd_level": 994,
        "humidity": 83,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.98, "deg": 327},
      "rain": {"3h": 1},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-06 03:00:00"
    },
    {
      "dt": 1578290400,
      "main": {
        "temp": 282.37,
        "feels_like": 280.59,
        "temp_min": 282.37,
        "temp_max": 282.37,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 995,
        "humidity": 86,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 1.55, "deg": 293},
      "rain": {"3h": 1.19},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-06 06:00:00"
    },
    {
      "dt": 1578301200,
      "main": {
        "temp": 283.57,
        "feels_like": 281.44,
        "temp_min": 283.57,
        "temp_max": 283.57,
        "pressure": 1018,
        "sea_level": 1018,
        "grnd_level": 993,
        "humidity": 82,
        "temp_kf": 0
      },
      "weather": [
        {"id": 500, "main": "Rain", "description": "light rain", "icon": "10d"}
      ],
      "clouds": {"all": 100},
      "wind": {"speed": 2.2, "deg": 310},
      "rain": {"3h": 0.38},
      "sys": {"pod": "d"},
      "dt_txt": "2020-01-06 09:00:00"
    }
  ],
  "city": {
    "id": 1172451,
    "name": "Lahore",
    "coord": {"lat": 31.5497, "lon": 74.3436},
    "country": "PK",
    "timezone": 18000,
    "sunrise": 1577844113,
    "sunset": 1577880565
  }
};
