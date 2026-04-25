import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/task_viewer/data/models/task_viewer_model.dart';


abstract class BaseTaskViewerRemoteDataSource {
  Future<List<TaskViewerModel>> getTaskViewer();
}

@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
 
  final SupabaseClient _supabase;

  
  

   TaskViewerRemoteDataSource( this._supabase);


@override
Future<List<TaskViewerModel>> getTaskViewer() async {
  return [
    TaskViewerModel(
      userName: "amaal",
      id: 1,
      title: "UX Design for MONS calendar",
      date: "Oct 25, 2025",
      status: "in_progress",
    ),
    TaskViewerModel(

      userName: "amaal",
      id: 2,
      title: "Meeting with client",
      date: "Oct 26, 2025",
      status: "in_progress",
    ),
    TaskViewerModel(

      userName: "amaal",
      id: 3,
      title: "Fix UI bugs",
      date: "Oct 27, 2025",
      status: "done",
    ),
     TaskViewerModel(

      userName: "amaal",
      id: 4,
      title: "Fix UI bugs",
      date: "Oct 27, 2026",
      status: "in_progress",
    ),
  ];
}}