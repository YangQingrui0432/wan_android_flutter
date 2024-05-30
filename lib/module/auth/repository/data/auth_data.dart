/// admin : false
/// chapterTops : []
/// coinCount : 21114
/// collectIds : [7736,7755,7752,7565,7557,7651,2975,3423,7709,7791,7805,7789,7786,7795,7712,7809,7829,7823,7895,7900,7907,6159,7956,7979,7987,7984,7988,8038,8037,8037,8081,8080,8040,8105,8106,8052,8134,8043,2985,8208,8251,8252,8257,8283,8279,8295,8246,8225,8374,8364,8360,7996,8410,8497,8509,8505,8534,8627,8646,8674,8736,8788,8814,8809,8917,8916,8921,9002,9007,9059,9057,9066,9077,9222,9110,9220,9300,9284,9271,9398,9389,1877,9428,9563,9593,9608,9619,9663,9760,9741,9897,9992,10081,10031,10182,11143,11178,11227,11236,11302,11321,11058,11333,11343,11385,11470,11426,11439,12228,12460,12488,12319,12666,12773,12959,12922,13052,13206,13347,13390,9103,13590,13786,13928,13932,13973,14068,11963,14172,14004,14434,14479,13936,14525,14538,14347,14600,14709,14755,14753,14873,14823,15016,15048,15061,15224,15198,15331,15277,15421,15406,15468,15414,15686,15174,15712,15809,15816,15953,15994,15999,16046,16127,16421,15998,16558,14427,16641,16659,16800,17094,16974,11677,17534,17526,17611,17616,17585,17586,17681,17651,-1,17716,17666,17743,17629,17747,16190,15215,14409,8852,13949,13701,13244,12502,12230,12614,12489,12018,11689,8857,17641,17800,17816,17083,-1,17874,18072,18217,18281,18615,18771,18853,18868,18453,19006,18930,12119,11506,12424,19222,19296,19550,16717,19623,19815,19867,19313,19456,18965,16771,16848,8476,12229,11521,9078,-1,20087,20354,20379,20391,14774,21409,21826,22457,22665,22744,22814,13906,22539,23484,23479,24889,24976,10049,8680,8672,8663,26122,26578]
/// email : "544002999@qq.com"
/// icon : ""
/// id : 15975
/// nickname : "yqr"
/// password : ""
/// publicName : "yqr"
/// token : ""
/// type : 0
/// username : "YangQR"

class AuthData {
  AuthData({
      bool? admin, 
      List<dynamic>? chapterTops, 
      num? coinCount, 
      List<num>? collectIds, 
      String? email, 
      String? icon, 
      num? id, 
      String? nickname, 
      String? password, 
      String? publicName, 
      String? token, 
      num? type, 
      String? username,}){
    _admin = admin;
    _chapterTops = chapterTops;
    _coinCount = coinCount;
    _collectIds = collectIds;
    _email = email;
    _icon = icon;
    _id = id;
    _nickname = nickname;
    _password = password;
    _publicName = publicName;
    _token = token;
    _type = type;
    _username = username;
}

  AuthData.fromJson(dynamic json) {
    _admin = json['admin'];
    if (json['chapterTops'] != null) {
      _chapterTops = [];
      json['chapterTops'].forEach((v) {
        _chapterTops?.add(v);
      });
    }
    _coinCount = json['coinCount'];
    _collectIds = json['collectIds'] != null ? json['collectIds'].cast<num>() : [];
    _email = json['email'];
    _icon = json['icon'];
    _id = json['id'];
    _nickname = json['nickname'];
    _password = json['password'];
    _publicName = json['publicName'];
    _token = json['token'];
    _type = json['type'];
    _username = json['username'];
  }
  bool? _admin;
  List<dynamic>? _chapterTops;
  num? _coinCount;
  List<num>? _collectIds;
  String? _email;
  String? _icon;
  num? _id;
  String? _nickname;
  String? _password;
  String? _publicName;
  String? _token;
  num? _type;
  String? _username;
AuthData copyWith({  bool? admin,
  List<dynamic>? chapterTops,
  num? coinCount,
  List<num>? collectIds,
  String? email,
  String? icon,
  num? id,
  String? nickname,
  String? password,
  String? publicName,
  String? token,
  num? type,
  String? username,
}) => AuthData(  admin: admin ?? _admin,
  chapterTops: chapterTops ?? _chapterTops,
  coinCount: coinCount ?? _coinCount,
  collectIds: collectIds ?? _collectIds,
  email: email ?? _email,
  icon: icon ?? _icon,
  id: id ?? _id,
  nickname: nickname ?? _nickname,
  password: password ?? _password,
  publicName: publicName ?? _publicName,
  token: token ?? _token,
  type: type ?? _type,
  username: username ?? _username,
);
  bool? get admin => _admin;
  List<dynamic>? get chapterTops => _chapterTops;
  num? get coinCount => _coinCount;
  List<num>? get collectIds => _collectIds;
  String? get email => _email;
  String? get icon => _icon;
  num? get id => _id;
  String? get nickname => _nickname;
  String? get password => _password;
  String? get publicName => _publicName;
  String? get token => _token;
  num? get type => _type;
  String? get username => _username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['admin'] = _admin;
    if (_chapterTops != null) {
      map['chapterTops'] = _chapterTops?.map((v) => v.toJson()).toList();
    }
    map['coinCount'] = _coinCount;
    map['collectIds'] = _collectIds;
    map['email'] = _email;
    map['icon'] = _icon;
    map['id'] = _id;
    map['nickname'] = _nickname;
    map['password'] = _password;
    map['publicName'] = _publicName;
    map['token'] = _token;
    map['type'] = _type;
    map['username'] = _username;
    return map;
  }

}