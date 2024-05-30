/// id : 6
/// link : ""
/// name : "面试"
/// order : 1
/// visible : 1

class HotKeyData {
  HotKeyData.fromJson(dynamic json) {
    if (json is List) {
      _list = [];
      for (var element in json) {
        _list?.add(HotKeyItemData.fromJson(element));
      }
    }
  }

  List<HotKeyItemData>? _list;

  List<HotKeyItemData>? get list => _list;
}

class HotKeyItemData {
  HotKeyItemData({
    num? id,
    String? link,
    String? name,
    num? order,
    num? visible,
  }) {
    _id = id;
    _link = link;
    _name = name;
    _order = order;
    _visible = visible;
  }

  HotKeyItemData.fromJson(dynamic json) {
    _id = json['id'];
    _link = json['link'];
    _name = json['name'];
    _order = json['order'];
    _visible = json['visible'];
  }

  num? _id;
  String? _link;
  String? _name;
  num? _order;
  num? _visible;

  HotKeyItemData copyWith({
    num? id,
    String? link,
    String? name,
    num? order,
    num? visible,
  }) =>
      HotKeyItemData(
        id: id ?? _id,
        link: link ?? _link,
        name: name ?? _name,
        order: order ?? _order,
        visible: visible ?? _visible,
      );

  num? get id => _id;

  String? get link => _link;

  String? get name => _name;

  num? get order => _order;

  num? get visible => _visible;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['link'] = _link;
    map['name'] = _name;
    map['order'] = _order;
    map['visible'] = _visible;
    return map;
  }
}
