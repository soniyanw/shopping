import 'package:shopping/ui.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    Key? key,
    this.onPressed,
    required this.child,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    Key? key,
    this.style,
    this.onPressed,
    required this.child,
    this.changed,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final Widget child;
  final ButtonStyle? style;
  final bool? changed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: changed == true ? onPressed : null,
      child: child,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(80, 48),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        backgroundColor:
            MaterialStateProperty.resolveWith((Set<MaterialState> states) {
          print(changed);
          if (states.contains(MaterialState.disabled) || changed != true) {
            return colors.primaryLight;
          }

          return colors.primary;
        }),
      ),
    );
  }
}
