class User {
  String nick;
  String username;
  String password;
  String instCode;

  User({this.nick, this.username, this.password, this.instCode});

  Map<String, dynamic> toMap() {
    return {
      'nick': nick,
      'username': username,
      'password': password,
      'instCode': instCode,
    };
  }

  String toString() {
    return '{nick: $nick, username: $username, password: $password, instCode: $instCode}';
  }
}