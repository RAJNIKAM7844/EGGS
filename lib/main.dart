import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:testapp/home.dart' as home;
import 'package:testapp/home.dart';
import 'package:testapp/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "HMS Egg Distributions",
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.orange,
      ),
      home: home.HomePage(), // Starting with onboarding page
    );
  }
}

// Page 1 - Rolling Egg Animation
class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat(reverse: true);
    _animation = Tween<double>(begin: -10.0, end: 10.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PageTwo()));
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform.translate(
                    offset: Offset(_animation.value, 0),
                    child: Image.asset('assets/egg.png', width: 150),
                  );
                },
              ),
              const SizedBox(height: 30),
              const Text(
                "HMS EGG DISTRIBUTIONS",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Page 2 - Stacked Eggs Design
class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                  color: const Color.fromARGB(255, 51, 51, 51), width: 3),
            ),
            child: Image.asset('assets/image2.png', fit: BoxFit.cover),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Welcome to HMS EGG DISTRIBUTORS",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "At HMS, we deliver only the finest quality eggs with a strong commitment to excellence and customer satisfaction.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 17,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => PageThree()));
            },
            child: const Text("CONTINUE"),
          ),
        ],
      ),
    );
  }
}

// Page 3 - Egg on Forks Design
class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset('assets/image3.png', fit: BoxFit.cover),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Trusted & Nutritious Eggs",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "We ensure freshness, hygiene, and nutritional value with every egg we deliver. Choose from a wide range of organic, free-range, and specialty eggs!",
              style: TextStyle(color: Colors.white70, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => PageFour()));
            },
            child: const Text("CONTINUE"),
          ),
        ],
      ),
    );
  }
}

// Page 4 - Final Page with CTA (No Scroll, Fixed Layout)
// Page 4 - Final Page with Bullet Points and Same Layout as Page 3
// ✅ add this

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: Image.asset('assets/image4.png', fit: BoxFit.cover),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Why Choose HMS?",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "• Fast Delivery\n• Affordable Pricing\n• 100% Fresh Eggs\n• Trusted by 500+ customers",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterPage()));
            },
            child: const Text("GET STARTED"),
          ),
        ],
      ),
    );
  }
}
