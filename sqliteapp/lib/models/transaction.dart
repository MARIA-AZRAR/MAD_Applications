class Transactions {   
  final int id;  
  final int accountId;
  final int userId;
  final String description;
  final String? drAmount;  
  final String? CrAmount; 
  final String type;
  final int transactionDate;
  
  Transactions({
  required this.id,  
  required this.accountId,
  required this.userId,
  required this.description,
  this.drAmount,
  this.CrAmount, 
  required this.type,
  required this.transactionDate
  });  
   
  
  Map<String, dynamic> toMap() {  
    var map = new Map<String, dynamic>();  
    map['id'] = id; 
    map['userId'] = userId;
    map['accountId'] = accountId;
    map['description'] = description;
    map['drAmount'] = drAmount;
    map['CrAmount'] = CrAmount;  
    map['transactionDate'] = transactionDate;
    map['type'] = type;
    return map;  
  }  



  @override
  String toString() {
    return 'User{id: $id, description: ${description}, transactionDate: ${transactionDate}';
  }
} 