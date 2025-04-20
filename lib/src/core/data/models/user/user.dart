class User {
  String? userId;
  String? email;
  String? password;
  String? dob = '';
  String? gender;
  String? mobile;
  String? name;
  String? lastName;
  String? contact_id;
  String? profession;
  var function;
  String? nationality;
  String? imgB64;
  String? image;


  User(
      {this.userId,
      this.email,
      this.function,
      this.contact_id,
      this.dob,
      this.gender,
      this.mobile,
      this.name,
      this.lastName,
      this.password,
      this.nationality,
      this.profession,
      this.image
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      dob: json['dob'],
      gender: json['gender'],
      mobile: json['mobile'],
      name: json['name'],
      password: json['password'],
      profession: json['profession'],
      contact_id: json['contact_id'],
      function: json['function'],
      email: json['email'],
      nationality: json['nationality'],
      lastName: json['last_name'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dob'] = dob;
    data['gender'] = gender;
    data['mobile'] = mobile;
    data['name'] = name;
    data['password'] = password;
    data['profession'] = profession;
    data['contact_id'] = contact_id;
    data['function'] = function;
    data['email'] = email;
    data['nationality'] = nationality;
    data['last_name'] = lastName;
    data['image'] = image;
    return data;
  }

  @override
  String toString() {
    return 'toString_User {\n'
        'userId: $userId\n'
        'email: $email\n'
        'name: $name\n'
        'password: $password\n'
        'function: $function\n'
        'contact_id: $contact_id\n'
        'dob: $dob\n'
        'gender: $gender\n'
        'profession: $profession\n'
        'image: $image\n'
        '}';
  }
}
