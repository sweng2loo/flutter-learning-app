class TaskRecord{
  final int? id;
  final int taskNo;
  final String date;
  final String title;
  final String? description;
  final String? responsibility;
  final String? detail;
  final String? problem;
  final String? solution;
  final String? tools;
  final String? othertools;
  final String? specialRemark;

  const TaskRecord({
    this.id,
    required this.taskNo,
    required this.date,
    required this.title,
    this.description,
    this.responsibility,
    this.detail,
    this.problem,
    this.solution,
    this.tools,
    this.othertools,
    this.specialRemark
  });



  Map<String,Object?> sendToDatabase(){// data conversion function for save to database
    return {
      if(id !=null )"id" : id,
      "taskNo":taskNo,
      "date":date,
      "title":title,
      "description":description,
      "responsibility":responsibility,
      "detail":detail,
      "problem":problem,
      "solution":solution,
      "tools" :tools,
      "othertools" :othertools,
      "specialRemark":specialRemark
      };

  }




  // data conversion function for receive from database
  factory TaskRecord.comeFromDatabase(Map<String,Object?> map) { return TaskRecord(
    id : map['id'] as int?,
    taskNo: map['taskNo'] as int,
    date: map['date'] as String,
    title : map['title'] as String,
    description: map['description'] as String?,
    responsibility: map['responsibility'] as String?,
    detail: map['detail'] as String?,
    problem: map['problem'] as String?,
    solution: map['solution'] as String?,
    tools: map['tools'] as String?,
    othertools: map['othertools'] as String?,
    specialRemark: map['specialRemark'] as String?,);}

  



}