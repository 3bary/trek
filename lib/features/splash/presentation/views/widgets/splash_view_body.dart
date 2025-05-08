import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:greendo/core/helpers/auth_helper.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation();
    navigateToNextView();
  }

  void initAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
     _scaleAnimation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    
    _controller.forward();
  }

  void navigateToNextView() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return; // <- Make sure widget still exists
      if (AuthHelper.isUserLoggedIn()) {
        context.go(AppRouter.kHomeView);
      }else{
        context.go(AppRouter.kOnboardingView);
      }
    });
  }


  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _fadeAnimation.value,
                child: child,
              ),
            );
          },
          child: Image.asset(
            kAppLogo,
            width: 250,
            height: 250,
          ),
        ),
      ),
    );
  }
}
