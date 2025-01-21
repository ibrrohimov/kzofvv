part of 'index.dart';

class TaskPreviewScreen extends StatelessWidget {
  const TaskPreviewScreen({super.key});
  static const String routeName = 'preview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: AppContainer(
          child: Column(
            children: [
              const TaskPreviewTop(),
              SizedBox(height: context.spaceL),
              ...AppGlobals.tasks[0]
                  .toStringList()
                  .map((e) => PreviewSingleItem(preview: e))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
