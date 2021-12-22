import 'package:covid_statistics/src/model/covid_statistics.dart';
import 'package:covid_statistics/src/repository/covid_statistics_repository.dart';
import 'package:get/get.dart';

class CovidStatisticsController extends GetxController {

  late CovidStatisticsRepository _covidStatisticsRepositoroy;
  Rx<Covid19StatisticsModel> covidStatistic = Covid19StatisticsModel().obs;

  @override
  void onInit() {
    super.onInit();
    _covidStatisticsRepositoroy = CovidStatisticsRepository();
    fetchCovidState();
  }
  void fetchCovidState() async {
    var  result = await _covidStatisticsRepositoroy.fetchCovid19Statistics();
    if(result != null) {
      covidStatistic(result);
    }
  }
}