part of 'index.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: context.spaceM),
      child: AppCard(
        onTap: () {
          Navigator.pushNamed(context, TaskPreviewScreen.routeName);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.task, style: context.regular20),
                Text(
                  task.timeframe,
                  style: context.regular14?.copyWith(color: context.greyScale5),
                ),
              ],
            ),
            Icon(Icons.chevron_right, color: context.primary1)
          ],
        ),
      ),
    );
  }
}
