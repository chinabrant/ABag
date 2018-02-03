import 'av_object.dart';
import 'av_file.dart';

/*
"nick": "爱家",
"sign": "一个爱家的人",
"ACL": {
  "*": {
    "read": true,
    "write": true
  }
},
"username": "222222",
"emailVerified": false,
"mobilePhoneVerified": false,
"objectId": "5a22767c570c350067033b36",
"createdAt": "2017-12-02T09:46:36.367Z",
"updatedAt": "2017-12-02T09:47:47.251Z"
*/
class User extends AVObject {

  User({this.nick, this.sign});

  String nick;
  String sign;
  AVFile avatar;
  String username;
  bool emailVerified;

  User.fromMap(Map<String, dynamic> map)
      : nick = map['nick'] ?? '',
        avatar = map['avatar'] != null ? new AVFile.fromMap(map['avatar']) : null,
        username = map['username'],
        emailVerified = map['emailVerified'],
        sign = map['sign'] ?? '这货好懒，什么都没有写';
}