part of '../screens/dashboard_screen.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the top safe area inset
    final topSafeArea = MediaQuery.of(context).padding.top;
    
    return Container(
      // Add padding that accounts for the safe area at the top
      padding: EdgeInsets.fromLTRB(
        AppSpacing.spacing20,
        topSafeArea + AppSpacing.spacing20,
        AppSpacing.spacing20,
        AppSpacing.spacing20,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: GreetingCard()),
          ActionButton(),
        ],
      ),
    );
  }
}
