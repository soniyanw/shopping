import '../../ui.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(this.icon,{Key? key,}) : super(key: key);
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
