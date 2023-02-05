class Student {
  String? id;
  String? name;
  String? address;
  String? phone;
  String? email;

  Student({this.id, this.name, this.address, this.phone, this.email});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
  }
studentToMap(){
  Map<String, dynamic>  data = {};
 // data['id'] = id;
  data['name'] = name;
  data['address'] = address;
  data['email'] = email;
  data['phone'] = phone;
  return data;

}

}
