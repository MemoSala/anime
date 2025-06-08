class BroadcastModel {
  final String day;
  final String time;
  final String timezone;
  final String string;

  const BroadcastModel({
    required this.day,
    required this.time,
    required this.timezone,
    required this.string,
  });

  BroadcastModel.fromJson(Map<String, dynamic> json)
    : day = json['day'],
      time = json['time'],
      timezone = json['timezone'],
      string = json['string'];
}
