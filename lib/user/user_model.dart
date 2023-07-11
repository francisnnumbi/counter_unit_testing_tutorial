/// id : 1
/// name : "Leanne Graham"
/// username : "Bret"
/// email : "Sincere@april.biz"
/// phone : "1-770-736-8031 x56442"
/// website : "hildegard.org"

class User {
 late  num _id;
 late  String _name;
 late  String _username;
 late  String _email;
 late  String _phone;
 late String _website;

  User({
    required num id,
    required String name,
    required String username,
    required String email,
    required String phone,
    required String website,
  }) {
    _id = id;
    _name = name;
    _username = username;
    _email = email;
    _phone = phone;
    _website = website;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _username = json['username'];
    _email = json['email'];
    _phone = json['phone'];
    _website = json['website'];
  }

  User copyWith({
   required num id,
   required String name,
   required String username,
   required String email,
   required String phone,
   required String website,
  }) =>
      User(
        id: id ?? _id,
        name: name ?? _name,
        username: username ?? _username,
        email: email ?? _email,
        phone: phone ?? _phone,
        website: website ?? _website,
      );
  num get id => _id;
  String get name => _name;
  String get username => _username;
  String get email => _email;
  String get phone => _phone;
  String get website => _website;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['username'] = _username;
    map['email'] = _email;
    map['phone'] = _phone;
    map['website'] = _website;
    return map;
  }
}
