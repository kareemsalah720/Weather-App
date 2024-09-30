import 'package:dio/dio.dart';
import 'package:weather_app/model/wearther_model.dart';

class WeatherService {
  Future<List<WeatherModel>> getWeather({required String cityName}) async {
    try {
      Response response = await Dio().get(
          'http://api.weatherapi.com/v1/forecast.json?key=a42cf598a5274a1497b64737240305&q=$cityName&days=3&aqi=no&alerts=no');

      List<WeatherModel> weatherList = [
        WeatherModel.fromJson(response.data, 0),
        WeatherModel.fromJson(response.data, 1),
        WeatherModel.fromJson(response.data, 2),
      ];
      return weatherList;
    } on DioException catch (e) {
      final errorMessage =
          e.response?.data['error']['message'] ?? 'Ooops Something went wrong';
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('try again $e');
    }
  }
}
