class Evaluation {
  final int evaluationID;
  final String type;
  final String subject;
  final String weight;
  final int numberValue;
  final String creatingTime;

  Evaluation({this.evaluationID, this.type, this.subject, this.weight, this.numberValue, this.creatingTime});

  Map<String, dynamic> toMap() {
    return {
      'evaluationID': evaluationID,
      'type': type,
      'subject': subject,
      'weight': weight,
      'numberValue': numberValue,
      'creatingTime': creatingTime,
    };
  }

    @override
    String toString(){
      return 'Evaluation{evalID: $evaluationID, type: $type, subject: $subject, weight: $weight, numberValue: $numberValue, creatingTime: $creatingTime}';
    }

}