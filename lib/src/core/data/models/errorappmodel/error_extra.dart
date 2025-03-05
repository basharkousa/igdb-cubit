/// access_type : "none"
/// event_id : "09df22b7c2c7402090cfd13ed3e9285f"
/// retry_after : 3

class ErrorExtra {
  ErrorExtra({
      this.accessType, 
      this.eventId, 
      this.retryAfter,});

  ErrorExtra.fromJson(dynamic json) {
    accessType = json['access_type'];
    eventId = json['event_id'];
    retryAfter = json['retry_after'];
  }
  String? accessType;
  String? eventId;
  int? retryAfter;
ErrorExtra copyWith({  String? accessType,
  String? eventId,
  int? retryAfter,
}) => ErrorExtra(  accessType: accessType ?? this.accessType,
  eventId: eventId ?? this.eventId,
  retryAfter: retryAfter ?? this.retryAfter,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_type'] = accessType;
    map['event_id'] = eventId;
    map['retry_after'] = retryAfter;
    return map;
  }

}