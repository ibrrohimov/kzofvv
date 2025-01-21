part of 'index.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});
  static const String routeName = 'tasks';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: AppContainer(
        child: Column(
          children: [SizedBox(height: context.spaceL), const TasksBottom()],
        ),
      ),
    );
  }
}
