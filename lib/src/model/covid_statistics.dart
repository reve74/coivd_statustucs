import 'package:covid_statistics/src/utils/data_utils.dart';
import 'package:covid_statistics/src/utils/xml_utils.dart';
import 'package:xml/xml.dart';

class Covid19StatisticsModel {
  double? accDefRate;
  double? accExamCompCnt;
  double? careCnt;

  double? accExamCnt;
  double? clearCnt;
  double? deathCnt;
  double? decideCnt;
  double? examCnt;
  double calcAccExamCnt = 0;
  double calcClearCnt = 0;
  double caclcDeathCnt = 0;
  double calcDecideCnt = 0;
  double calcExamCnt = 0;
  double? resutlNegCnt;
  double? seq;

  String? createDt;
  DateTime? stateDt;
  String? stateTime;
  String? updateDt;
  Covid19StatisticsModel({
    this.accDefRate,
    this.accExamCnt,
    this.accExamCompCnt,
    this.careCnt,
    this.clearCnt,
    this.createDt,
    this.deathCnt,
    this.decideCnt,

    this.examCnt,
    this.resutlNegCnt,
    this.seq,
    this.stateDt,
    this.stateTime,
    this.updateDt,
  });

  factory Covid19StatisticsModel.empty() {
    return Covid19StatisticsModel();
  } 

  factory Covid19StatisticsModel.fromXml(XmlElement xml) {
    return Covid19StatisticsModel(
      accDefRate: XmlUtils.searchResultForDouble(xml, 'accDefRate'),
      accExamCnt: XmlUtils.searchResultForDouble(xml, 'accExamCnt'),
      accExamCompCnt: XmlUtils.searchResultForDouble(xml, 'accExamCompCnt'),
      careCnt: XmlUtils.searchResultForDouble(xml, 'careCnt'),
      clearCnt: XmlUtils.searchResultForDouble(xml, 'clearCnt'),
      deathCnt: XmlUtils.searchResultForDouble(xml, 'deathCnt'),
      decideCnt: XmlUtils.searchResultForDouble(xml, 'decideCnt'),
      examCnt: XmlUtils.searchResultForDouble(xml, 'examCnt'),
      resutlNegCnt: XmlUtils.searchResultForDouble(xml, 'resutlNegCnt'),
      seq: XmlUtils.searchResultForDouble(xml, 'seq'),
      createDt: XmlUtils.searchResultForString(xml, 'createDt'),
      stateDt: XmlUtils.searchResultForString(xml, 'stateDt') != '' ? DateTime.parse(XmlUtils.searchResultForString(xml, 'stateDt')) : null,
      stateTime: XmlUtils.searchResultForString(xml, 'stateTime'),
      updateDt: XmlUtils.searchResultForString(xml, 'updateDt'),
    );
  }

  void updateCalcAboutYesterday(Covid19StatisticsModel yesterDayData) {
    _updateCalcExamCnt(yesterDayData.examCnt!);
    _updateCalcDeathCnt(yesterDayData.deathCnt!);
    _updateCalcDecideCnt(yesterDayData.decideCnt!);
    _updateCalcClearCnt(yesterDayData.clearCnt!);
    _updateCalcAccExamCnt(yesterDayData.accExamCnt!);
  }

  void _updateCalcDecideCnt(double beforeCnt) {
    calcDecideCnt = decideCnt! - beforeCnt;
  }

  void _updateCalcExamCnt(double beforeCnt) {
    calcExamCnt = examCnt! - beforeCnt;
  }

  void _updateCalcDeathCnt(double beforeCnt) {
    caclcDeathCnt = deathCnt! - beforeCnt;
  }

  void _updateCalcClearCnt(double beforeCnt) {
    calcClearCnt = clearCnt! - beforeCnt;
  }

  void _updateCalcAccExamCnt(double beforeCnt) {
    calcAccExamCnt = accExamCnt!-beforeCnt;
  }

  String get standardDayString => stateDt == null ? ' ' : 
  '${DataUtils.simpleDayFormat(stateDt!)} $stateTime 기준';
}
