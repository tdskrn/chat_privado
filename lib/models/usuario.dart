class Usuario {
  bool online;
  final String name;
  final String email;
  String uid;
  Usuario({
    required this.online,
    required this.name,
    required this.email,
    required this.uid,
  });

  Usuario copyWith({
    bool? online,
    String? name,
    String? email,
    String? uid,
  }) {
    return Usuario(
      online: online ?? this.online,
      name: name ?? this.name,
      email: email ?? this.email,
      uid: uid ?? this.uid,
    );
  }

  set isOnline(bool isOnline) {
    online = isOnline;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'online': online,
      'name': name,
      'email': email,
      'uid': uid,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    return Usuario(
      online: map['online'] as bool,
      name: map['name'] as String,
      email: map['email'] as String,
      uid: map['uid'] as String,
    );
  }
}
