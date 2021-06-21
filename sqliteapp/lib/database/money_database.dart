import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqliteapp/models/user.dart';
import 'package:path_provider/path_provider.dart';
import '../models/account.dart';
import '../models/transaction.dart';

// void MoneyDatabase() async {
//   WidgetsFlutterBinding.ensureInitialized();

//     final database = openDatabase(

//     join(await getDatabasesPath(), 'money.db'),
//     onCreate: (db, version) async {
//       // Run the CREATE TABLE statement on the database.
//       await db.execute(
//         'CREATE TABLE Users(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, password TEXT)',
//       );
//       await db.execute(
//         'CREATE TABLE Accounts(accountId INTEGER PRIMARY KEY, title TEXT, type TEXT)',
//       );
//       await db.execute(
//         'CREATE TABLE Transactions(id INTEGER PRIMARY KEY, accountId INTEGER ,description TEXT, drAmount TEXT, CrAmount TEXT, transactionDate INTEGER)',
//       );
//     },
//     version: 1,
//   );

   
// }


class MoneyDatabase {
 //instance that is calling our private constructor
  static final MoneyDatabase instance = MoneyDatabase._init();

 //pribate constructor can have any name
  MoneyDatabase._init();

  //field for our database
  // only have a single app-wide reference to the database
  static Database? _database;

  //now we need to open our database
  Future<Database> get database async {
    //if database alredy creted
    if (_database != null) return _database!;

    // if not created instantiate the db the first time it is accessed
    _database = await _iniDB('money_database.db');
    return _database!;
  } 

    _iniDB(String filename) async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, filename);

    return await openDatabase(
      path, version: 1, 
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
          // Run the CREATE TABLE statement on the database.
      await db.execute(
        'CREATE TABLE Users(id INTEGER PRIMARY KEY, name TEXT, phone TEXT, password TEXT)',
      );
      await db.execute(
        'CREATE TABLE Accounts(accountId INTEGER PRIMARY KEY, title TEXT, type TEXT)',
      );
      await db.execute(
        'CREATE TABLE Transactions(id INTEGER PRIMARY KEY, accountId INTEGER, userId INTEGER ,description TEXT, drAmount TEXT, CrAmount TEXT, transactionDate INTEGER, type TEXT)',
      );
    });
  }

  void delete() async {
    // Get a location using getDatabasesPath
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
      String path = join(documentsDirectory.path, 'money_database.db');

      // Delete the database
      await deleteDatabase(path);
      print("deleted");

  }


    // Define a function that inserts account into the database
  Future<int> insertUser(User user) async {
    // Get a reference to the database.
    print(user);
    try{
    final db = await database;

    await db.insert(
      'Users',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return 1;
    }
    catch(exception){
      return 0;
    }
  }

  // A method that retrieves all the users from the
  Future<List<User>> getUsers() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('Users');

    // Convert the List<Map<String, dynamic> into a List<Users>.
    return List.generate(maps.length, (i) {
      return User(
        id: maps[i]['id'],
        name: maps[i]['name'],
        phone: maps[i]['phone'],
        password: maps[i]['password']
      );
    });
  }

  Future<User?> validateUser(String name, String password) async {  
    final db = await database;  
    var response = await db.rawQuery("SELECT * FROM Users WHERE name = '$name' and password = '$password'");  
      
    if (response.length > 0) {  
      return new User.fromMap(response.first);  
    }

    return null;
  }  

             //################################### ACCOUNTS #################################
  
    // Define a function that inserts account into the database
  Future<int> insertAccount(Accounts account) async {
    // Get a reference to the database.
    print(account);
    try{
    final db = await database;

    await db.insert(
      'Accounts',
      account.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return 1;
    }
    catch(exception){
      return 0;
    }
  }

  // A method that retrieves all the accounts from the
  Future<List<Accounts>> getAllAccounts() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('Accounts');

    // Convert the List<Map<String, dynamic> into a List<Users>.
    return List.generate(maps.length, (i) {
      return Accounts(
        accountId: maps[i]['accountId'],
        title: maps[i]['title'],
        type: maps[i]['type'],
      );
    });
  }

//check if account exists
  Future<int> validateAccount(String _id) async {  
    int? id;
    try {
      id = int.parse(_id);
    } on FormatException {
      print("Exception occured");
    }
    
    final db = await database;  
    var response = await db.rawQuery("SELECT * FROM Accounts WHERE accountId = '$id'");  

    if (response.length > 0) {  
      print("in here");
      print(response.length);
       return response.length ;
    }else{
      print("ehy");
      return response.length ;
    }
  }  

  //check if account exists
  Future<String> getSingleAccount(String _id) async { 
    int? id;
    try {
      id = int.parse(_id);
    } on FormatException {
      print("Exception occured");
    }
     
    final db = await database;  
    final List<Map<String, dynamic>> response = await db.rawQuery("SELECT type FROM Accounts WHERE accountId = '$id' limit 1");  
    if (response.length > 0) {  
      return response[0]['type'];
    }else{
      return "true";
    }
  }  

  Future<void> deleteAccount(int id) async {
    final db = await database;
    await db.delete(
      'Accounts',
      where: "accountId = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateAccount(Accounts account) async {
    
  final db = await database;
  var res = await db.update(
    'Accounts',
    account.toMap(),
    where: 'accountId = ?',
    whereArgs: [account.accountId],
  );
  return res;
}

//################################## TRANSACTIONS ###########################
    // Define a function that inserts transaction into the database
  Future<int> insertTransaction(Transactions transaction) async {
    // Get a reference to the database
    
    try{
    final db = await database;

    await db.insert(
      'Transactions',
      transaction.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return 1;
    }
    catch(exception){
      return 0;
    }
  }


  // A method that retrieves all the accounts from the
  Future<List<Transactions>> getUsersTransactions(int _id) async {
    // Get a reference to the database.
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM Transactions where userId = '${_id}'");  
    
    String? amount;
    // Convert the List<Map<String, dynamic> into a List<Users>.
    return List.generate(maps.length, (i) {
      if(maps[i]['drAmount'] != null){
        print("In here");
        amount = maps[i]['drAmount']; 
      }else{
        amount = maps[i]['CrAmount'];
      }
      return Transactions(
        id: maps[i]['id'],
        userId: maps[i]['userId'],
        accountId: maps[i]['accountId'],
        description: maps[i]['description'],
        transactionDate: maps[i]['transactionDate'],
        type: maps[i]['type'],
        drAmount: amount,
      );
    });
  }


    Future<void> deleteTransaction(int _id) async {
    final db = await database;
    await db.delete(
      'Transactions',
      where: "id = ?",
      whereArgs: [_id],
    );
  }



}