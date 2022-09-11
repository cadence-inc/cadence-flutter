class CadenceModel {
  int interval;
  String mostRecentMeeting;
  String nextMeeting;
  int dateAdded;
  bool isDeleted;

  CadenceModel({
    required this.interval,
    required this.mostRecentMeeting,
    required this.nextMeeting,
    required this.dateAdded,
    required this.isDeleted,
  });
}
