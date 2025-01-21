part of 'index.dart';

class TaskPreviewTop extends StatelessWidget {
  const TaskPreviewTop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Task Preview",
          style: context.semiBold30?.copyWith(
            color: context.primary1,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: context.primary3,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.delete,
              size: 30,
              color: context.primary1,
            ),
          ),
        )
      ],
    );
  }
}
