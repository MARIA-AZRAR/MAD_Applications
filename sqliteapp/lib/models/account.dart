class Accounts {   
  late final int accountId;  
  late final String title;
  late final String type;  
  
  Accounts({
   required this.accountId,
   required this.title,
   required this.type
  });  
   
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['accountId'] = accountId; 
    map['title'] = title;
    map['type'] = type;  
    return map;  
  }  
  
  Accounts.fromMap(dynamic obj) { 
   this.accountId = obj['accountId'];
   this.title = obj['title'];
   this.type = obj['type'];  
  } 

  @override
  String toString() {
    return 'User{title: $title, type: ${type}';
  }
} 