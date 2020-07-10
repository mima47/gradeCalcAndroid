class User{
  final int id;
  final String nick;
  final String username;
  final String password;
  final String instCode;

  User({this.id,this.nick, this.username, this.password, this.instCode});

  factory User.fromMap(Map<String, dynamic> json) => new User(
    id: json['id'],
    nick: json['nick'],
    username: json['username'],
    password: json['password'],
    instCode: json['instCode'],
  );

  Map<String, dynamic> toMap() => {
    'id': id,
    'nick': nick,
    'username': username,
    'password': password,
    'instCode': instCode
  };
}