class User {  
  late final int id;  
  late final String name;  
  late final String phone;
  late final String password;  
   
  User({
   required this.id, 
   required this.name, 
   required this.phone,
   required this.password
  });  
    
  User.fromMap(dynamic obj) { 
   this.id = obj['id'];
   this.phone = obj['phone'];
   this.name = obj['name'];  
   this.password = obj['password'];  
  } 
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['id'] = id;
    map['name'] = name; 
    map['phone'] = phone;
    map['password'] = password;  
    return map;  
  }  
 

  @override
  String toString() {
    return 'User{id: $id, name: $name, phone: ${phone}, password: ${password}';
  }
} 