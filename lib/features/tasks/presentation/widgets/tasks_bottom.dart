part of 'index.dart';

class TasksBottom extends StatelessWidget {
  const TasksBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: _buildTaskList(),
        ),
      ),
    );
  }

  List<Widget> _buildTaskList() {
    return AppGlobals.tasks
        .map((e) => TaskCard(
              task: e,
            ))
        .toList();
  }
}
