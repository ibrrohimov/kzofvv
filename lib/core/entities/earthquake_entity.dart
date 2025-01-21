class EarthquakeEntity {
  final String icon;
  final String title;
  final int taskCount;
  final String routeName;
  final bool primary;

  const EarthquakeEntity({
    required this.icon,
    required this.title,
    required this.taskCount,
    required this.routeName,
    this.primary = true,
  });
}
