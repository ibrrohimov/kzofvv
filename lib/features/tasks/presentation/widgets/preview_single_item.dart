part of 'index.dart';

class PreviewSingleItem extends StatelessWidget {
  final PreviewEntity preview;

  const PreviewSingleItem({
    super.key,
    required this.preview,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: context.spaceL),
      margin: EdgeInsets.only(bottom: context.spaceL),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 2, color: context.greyScale7),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            preview.type,
            style: context.light18?.copyWith(
              color: context.greyScale4,
            ),
          ),
          SizedBox(height: context.spaceS),
          Text(preview.value, style: context.regular22),
        ],
      ),
    );
  }
}
