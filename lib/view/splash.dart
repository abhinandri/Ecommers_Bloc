
import 'package:ecommers/controllers/blocs/splash_bloc/bloc/splash_bloc.dart';
import 'package:ecommers/view/login.dart';
import 'package:ecommers/view/screens/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc()..add(StartSplashEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => Bottom_Nav()));
          } else if (state is SplashNavigateToLogin) {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: TweenAnimationBuilder(
              duration: const Duration(milliseconds: 1500),
              tween: Tween<double>(begin: 0, end: 1),
              builder: (context, double value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.scale(
                    scale: value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Container
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 20,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.shopping_bag,
                            size: 80,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // App Name
                        Text(
                          'QuickCart',
                          style: GoogleFonts.quicksand(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3,
                            color: Colors.black87,
                          ),
                        ),

                        const SizedBox(height: 12),

                        // Tagline
                        Text(
                          'Shop Smarter, Shop Better',
                          style: GoogleFonts.quicksand(
                            fontSize: 16,
                            color: Colors.black54,
                            letterSpacing: 1,
                          ),
                        ),

                        const SizedBox(height: 48),

                        // Loading Indicator
                        TweenAnimationBuilder(
                          duration: const Duration(milliseconds: 1000),
                          tween: Tween<double>(begin: 0, end: 1),
                          builder: (context, double value, child) {
                            return SizedBox(
                              width: 40,
                              height: 40,
                              child: CircularProgressIndicator(
                                value: value,
                                strokeWidth: 3,
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.black87,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat();

    _animations = List.generate(3, (index) {
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve:
              Interval(index * 0.2, 0.7 + index * 0.2, curve: Curves.easeOut),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (index) {
        return AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black87.withOpacity(_animations[index].value),
              ),
            );
          },
        );
      }),
    );
  }
}
