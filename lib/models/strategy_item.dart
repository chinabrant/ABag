import 'av_object.dart';
import 'user.dart';
import 'av_file.dart';

/*
* 攻略 model
* */
class StrategyModel extends AVObject {

  User user;          // 创建人
  String title;       // 标题
  String subtitle;    // 副标题
  String desc;        // 详情
  int likeCount;      // 喜欢数
  int commentCount;   // 评论数
  AVFile cover;       // 封面图片

  StrategyModel({
    this.user,
    this.title,
    this.subtitle,
    this.desc,
    this.likeCount,
    this.commentCount,
    this.cover
  });


  StrategyModel.fromMap(Map<String, dynamic> map) : super.fromMap(map) {

    this.user = new User.fromMap(map['user']);
    this.desc = map['desc'] ?? '';
    this.title = map['title'] ?? '';
    this.subtitle = map['subtitle'];
    this.likeCount = map['likeCount'];
    this.cover = map['cover'] != null ? new AVFile.fromMap(map['cover']) : null;
    this.commentCount = map['commentCount'];
  }


}