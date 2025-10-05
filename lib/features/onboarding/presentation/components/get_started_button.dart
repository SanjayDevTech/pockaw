part of '../screens/onboarding_screen.dart';

class GetStartedButton extends ConsumerWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Positioned(
      bottom: MediaQuery.of(context).padding.bottom,
      left: 0,
      right: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 20,
        ).copyWith(
          bottom: 20 + MediaQuery.of(context).padding.bottom,
        ),
        child: PrimaryButtonM3(
          label: 'Get Started',
          onPressed: () {
            if (context.mounted) context.push(Routes.getStarted); // route '/'
          },
        ),
      ),
    );
  }
}
