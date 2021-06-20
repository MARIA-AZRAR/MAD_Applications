class Transactions {   
  final String name;  
  final String phone;
  final String password;  
  
  Transactions({
   required this.name, 
   required this.phone,
   required this.password
  });  
   
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['name'] = name; 
    map['phone'] = phone;
    map['password'] = password;  
    return map;  
  }  

  @override
  String toString() {
    return 'User{name: $name, phone: ${phone}, password: ${password}';
  }
} 