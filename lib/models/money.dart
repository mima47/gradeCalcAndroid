class Money {
  int value;
  String timePeriod;

  Money(this.value, this.timePeriod);

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'timePeriod': timePeriod,
    };
  }
}