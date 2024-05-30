/// articleList : []
/// author : ""
/// children : [{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":60,"lisense":"","lisenseLink":"","name":"Android Studio相关","order":1000,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":169,"lisense":"","lisenseLink":"","name":"gradle","order":1001,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":269,"lisense":"","lisenseLink":"","name":"官方发布","order":1002,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1},{"articleList":[],"author":"","children":[],"courseId":13,"cover":"","desc":"","id":529,"lisense":"","lisenseLink":"","name":"90-120hz","order":1003,"parentChapterId":150,"type":0,"userControlSetTop":false,"visible":1}]
/// courseId : 13
/// cover : ""
/// desc : ""
/// id : 150
/// lisense : ""
/// lisenseLink : ""
/// name : "开发环境"
/// order : 1
/// parentChapterId : 0
/// type : 0
/// userControlSetTop : false
/// visible : 1

class KnowledgeData {
  KnowledgeData.fromJson(dynamic json) {
    if (json is List) {
      _list = [];
      for (var element in json) {
        _list?.add(KnowledgeListData.fromJson(element));
      }
    }
  }

  List<KnowledgeListData>? _list;

  List<KnowledgeListData>? get list => _list;
}

class KnowledgeListData {
  KnowledgeListData({
    List<dynamic>? articleList,
    String? author,
    List<KnowledgeListItem>? children,
    num? courseId,
    String? cover,
    String? desc,
    num? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    num? order,
    num? parentChapterId,
    num? type,
    bool? userControlSetTop,
    num? visible,
  }) {
    _articleList = articleList;
    _author = author;
    _children = children;
    _courseId = courseId;
    _cover = cover;
    _desc = desc;
    _id = id;
    _lisense = lisense;
    _lisenseLink = lisenseLink;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _type = type;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
  }

  KnowledgeListData.fromJson(dynamic json) {
    if (json['articleList'] != null) {
      _articleList = [];
      json['articleList'].forEach((v) {
        _articleList?.add(v);
      });
    }
    _author = json['author'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(KnowledgeListItem.fromJson(v));
      });
    }
    _courseId = json['courseId'];
    _cover = json['cover'];
    _desc = json['desc'];
    _id = json['id'];
    _lisense = json['lisense'];
    _lisenseLink = json['lisenseLink'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _type = json['type'];
    _userControlSetTop = json['userControlSetTop'];
    _visible = json['visible'];
  }

  List<dynamic>? _articleList;
  String? _author;
  List<KnowledgeListItem>? _children;
  num? _courseId;
  String? _cover;
  String? _desc;
  num? _id;
  String? _lisense;
  String? _lisenseLink;
  String? _name;
  num? _order;
  num? _parentChapterId;
  num? _type;
  bool? _userControlSetTop;
  num? _visible;

  KnowledgeListData copyWith({
    List<dynamic>? articleList,
    String? author,
    List<KnowledgeListItem>? children,
    num? courseId,
    String? cover,
    String? desc,
    num? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    num? order,
    num? parentChapterId,
    num? type,
    bool? userControlSetTop,
    num? visible,
  }) =>
      KnowledgeListData(
        articleList: articleList ?? _articleList,
        author: author ?? _author,
        children: children ?? _children,
        courseId: courseId ?? _courseId,
        cover: cover ?? _cover,
        desc: desc ?? _desc,
        id: id ?? _id,
        lisense: lisense ?? _lisense,
        lisenseLink: lisenseLink ?? _lisenseLink,
        name: name ?? _name,
        order: order ?? _order,
        parentChapterId: parentChapterId ?? _parentChapterId,
        type: type ?? _type,
        userControlSetTop: userControlSetTop ?? _userControlSetTop,
        visible: visible ?? _visible,
      );

  List<dynamic>? get articleList => _articleList;

  String? get author => _author;

  List<KnowledgeListItem>? get children => _children;

  num? get courseId => _courseId;

  String? get cover => _cover;

  String? get desc => _desc;

  num? get id => _id;

  String? get lisense => _lisense;

  String? get lisenseLink => _lisenseLink;

  String? get name => _name;

  num? get order => _order;

  num? get parentChapterId => _parentChapterId;

  num? get type => _type;

  bool? get userControlSetTop => _userControlSetTop;

  num? get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_articleList != null) {
      map['articleList'] = _articleList?.map((v) => v.toJson()).toList();
    }
    map['author'] = _author;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = _courseId;
    map['cover'] = _cover;
    map['desc'] = _desc;
    map['id'] = _id;
    map['lisense'] = _lisense;
    map['lisenseLink'] = _lisenseLink;
    map['name'] = _name;
    map['order'] = _order;
    map['parentChapterId'] = _parentChapterId;
    map['type'] = _type;
    map['userControlSetTop'] = _userControlSetTop;
    map['visible'] = _visible;
    return map;
  }
}

/// articleList : []
/// author : ""
/// children : []
/// courseId : 13
/// cover : ""
/// desc : ""
/// id : 60
/// lisense : ""
/// lisenseLink : ""
/// name : "Android Studio相关"
/// order : 1000
/// parentChapterId : 150
/// type : 0
/// userControlSetTop : false
/// visible : 1

class KnowledgeListItem {
  KnowledgeListItem({
    List<dynamic>? articleList,
    String? author,
    List<dynamic>? children,
    num? courseId,
    String? cover,
    String? desc,
    num? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    num? order,
    num? parentChapterId,
    num? type,
    bool? userControlSetTop,
    num? visible,
  }) {
    _articleList = articleList;
    _author = author;
    _children = children;
    _courseId = courseId;
    _cover = cover;
    _desc = desc;
    _id = id;
    _lisense = lisense;
    _lisenseLink = lisenseLink;
    _name = name;
    _order = order;
    _parentChapterId = parentChapterId;
    _type = type;
    _userControlSetTop = userControlSetTop;
    _visible = visible;
  }

  KnowledgeListItem.fromJson(dynamic json) {
    if (json['articleList'] != null) {
      _articleList = [];
      json['articleList'].forEach((v) {
        _articleList?.add(v);
      });
    }
    _author = json['author'];
    if (json['children'] != null) {
      _children = [];
      json['children'].forEach((v) {
        _children?.add(v);
      });
    }
    _courseId = json['courseId'];
    _cover = json['cover'];
    _desc = json['desc'];
    _id = json['id'];
    _lisense = json['lisense'];
    _lisenseLink = json['lisenseLink'];
    _name = json['name'];
    _order = json['order'];
    _parentChapterId = json['parentChapterId'];
    _type = json['type'];
    _userControlSetTop = json['userControlSetTop'];
    _visible = json['visible'];
  }

  List<dynamic>? _articleList;
  String? _author;
  List<dynamic>? _children;
  num? _courseId;
  String? _cover;
  String? _desc;
  num? _id;
  String? _lisense;
  String? _lisenseLink;
  String? _name;
  num? _order;
  num? _parentChapterId;
  num? _type;
  bool? _userControlSetTop;
  num? _visible;

  KnowledgeListItem copyWith({
    List<dynamic>? articleList,
    String? author,
    List<dynamic>? children,
    num? courseId,
    String? cover,
    String? desc,
    num? id,
    String? lisense,
    String? lisenseLink,
    String? name,
    num? order,
    num? parentChapterId,
    num? type,
    bool? userControlSetTop,
    num? visible,
  }) =>
      KnowledgeListItem(
        articleList: articleList ?? _articleList,
        author: author ?? _author,
        children: children ?? _children,
        courseId: courseId ?? _courseId,
        cover: cover ?? _cover,
        desc: desc ?? _desc,
        id: id ?? _id,
        lisense: lisense ?? _lisense,
        lisenseLink: lisenseLink ?? _lisenseLink,
        name: name ?? _name,
        order: order ?? _order,
        parentChapterId: parentChapterId ?? _parentChapterId,
        type: type ?? _type,
        userControlSetTop: userControlSetTop ?? _userControlSetTop,
        visible: visible ?? _visible,
      );

  List<dynamic>? get articleList => _articleList;

  String? get author => _author;

  List<dynamic>? get children => _children;

  num? get courseId => _courseId;

  String? get cover => _cover;

  String? get desc => _desc;

  num? get id => _id;

  String? get lisense => _lisense;

  String? get lisenseLink => _lisenseLink;

  String? get name => _name;

  num? get order => _order;

  num? get parentChapterId => _parentChapterId;

  num? get type => _type;

  bool? get userControlSetTop => _userControlSetTop;

  num? get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_articleList != null) {
      map['articleList'] = _articleList?.map((v) => v.toJson()).toList();
    }
    map['author'] = _author;
    if (_children != null) {
      map['children'] = _children?.map((v) => v.toJson()).toList();
    }
    map['courseId'] = _courseId;
    map['cover'] = _cover;
    map['desc'] = _desc;
    map['id'] = _id;
    map['lisense'] = _lisense;
    map['lisenseLink'] = _lisenseLink;
    map['name'] = _name;
    map['order'] = _order;
    map['parentChapterId'] = _parentChapterId;
    map['type'] = _type;
    map['userControlSetTop'] = _userControlSetTop;
    map['visible'] = _visible;
    return map;
  }
}
