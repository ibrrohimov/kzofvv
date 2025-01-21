part of '_index.dart';

class QuakeComment extends StatefulWidget {
  const QuakeComment({super.key});

  @override
  State<QuakeComment> createState() => _QuakeCommentState();
}

class _QuakeCommentState extends State<QuakeComment> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: context.spaceM),
          CommonTextField(
            name: 'fio',
            hintText: "fio",
            required: true,
          ),
          SizedBox(height: context.spaceM),
          CommonTextField(
            name: 'comment',
            hintText: "comment_desc",
            required: true,
            minLines: 5,
            maxLines: 100,
          ),
          SizedBox(height: context.spaceM),
          ElevatedButton(onPressed: _onSubmit, child: Text("send").tr()),
        ],
      ),
    );
  }

  void _onSubmit() {
    if (_formKey.currentState!.saveAndValidate()) {
      print(_formKey.currentState!.value);
    }
  }
}
