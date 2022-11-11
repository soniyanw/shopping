import '../ui.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('UserPage'),
            ElevatedButton(
              onPressed: () => context.appNavigator.pop(),
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
