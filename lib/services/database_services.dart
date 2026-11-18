import 'package:logbook/model/taskrecord.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseServices {
  static Database? _db;
  static final DatabaseServices useDatabase = DatabaseServices._contructor();

  DatabaseServices._contructor();

  Future<Database> get database async{
    if(_db != null) return _db!;
    _db = await getDatabase();
    return _db!;

  }
 

  Future<Database> getDatabase() async {
    final databaseFolderpath = await getDatabasesPath();
    final databasepath = join(databaseFolderpath,"logbook_Database.db");
    
    final database = await openDatabase(databasepath,
                      version: 1,
                      onCreate: (db, version) async{
                        await db.execute('''
                              CREATE TABLE Records (
                              id INTEGER PRIMARY KEY AUTOINCREMENT,
                              taskNo INTEGER Not NULL,
                              date TEXT NOT NULL, 
                              title TEXT NOT NULL,
                              description TEXT,
                              detail TEXT,
                              responsibility TEXT,
                              problem TEXT,
                              solution TEXT,
                              tools TEXT,
                              othertools TEXT,
                              specialRemark TEXT
                              
                              )
                              ''');
                      },
                    );
                    return database;
  }

  Future<void> addTask(TaskRecord record) async{
    final logdb = await database;
    await logdb.insert("Records", record.sendToDatabase(),conflictAlgorithm: ConflictAlgorithm.replace,
    );

  }

  

  Future<void> updateTask()async{

  }

  Future<void> deleteTask()async{}

  Future<void> loadTask()async{}



}