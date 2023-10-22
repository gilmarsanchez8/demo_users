class UserModel {
  final int id;
  final String name;
  final String lastname;
  final String birthdate;
  final String address;

  UserModel({
    this.id = -1,
    required this.name,
    required this.lastname,
    required this.birthdate,
    required this.address,
  });

  UserModel copyWith(
      {int? id,
      String? name,
      String? lastname,
      String? birthdate,
      String? address}) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      birthdate: birthdate ?? this.birthdate,
      address: address ?? this.address,
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      lastname: map['lastname'],
      birthdate: map['birthdate'],
      address: map['address'],
    );
  }

  Map<String, dynamic> toMap() => {
    'id' : id,
    'name': name,
    'lastname': lastname,
    'birthdate': birthdate,
    'address': address,
  };
}
