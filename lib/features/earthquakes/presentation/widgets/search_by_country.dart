part of '_index.dart';

class SearchByCountry extends StatelessWidget {
  const SearchByCountry({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            onChanged: (v) {
              print(v);
            },
            name: 'task',
            required: true,
            hintText: "area_name",
            suffixIcon: Icon(Icons.search),
          ),
        ),
        // SizedBox(width: context.spaceM),
        // SizedBox(
        //   width: 60,
        //   child: ElevatedButton(onPressed: () {}, child: Icon(Icons.search)),
        // ),
      ],
    );
  }
}
