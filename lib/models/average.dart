class Average {
  final String subject;
  final double value;

  Average({this.subject, this.value});

  Map<String, dynamic>toMap(){
    return {
      'subject': subject,
      'value': value
    };
  }
}