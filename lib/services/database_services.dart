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

  

  Future<int> cfnupdateTask(TaskRecord record)async{
    final logdb = await database;

    if (record.id == null) {
    throw ArgumentError('Cannot update a TaskRecord without an ID.');
  }
    return await logdb.update("Records", 
          record.sendToDatabase(),
          where: 'id = ? ',
          whereArgs: [record.id]
          );


  }

  Future<int> cfndeleteTask(int id)async{
    final logdb = await database;
    return logdb.delete('Records', where: 'id =?',whereArgs: [id]);
    
  }

  Future<List<TaskRecord>> cfnloadTasks()async{
    final logdb = await database;
    final result = await logdb.query('Records',orderBy: 'taskNo ASC, Date ASC');
    return result.map((cvmap) => TaskRecord.comeFromDatabase(cvmap)).toList();


  }



}