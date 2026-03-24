import '../models/app_task.dart';

int completedTasks(List<AppTask> tasks) {
  return tasks.where((task) => task.isDone).length;
}
