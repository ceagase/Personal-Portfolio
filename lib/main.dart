import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class AppColors {
  static const Color darkBlue = Color(0xFF0B2545);
  static const Color midBlue = Color(0xFF13315C);
  static const Color lightBlue = Color(0xFF8DA9C4);
  static const Color paleBlue = Color(0xFFEEF4FA);
  static const Color white = Colors.white;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chyna Agase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.paleBlue,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkBlue),
        useMaterial3: true,
      ),
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Chyna Agase",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppColors.darkBlue,
        foregroundColor: AppColors.white,
        centerTitle: true,
        elevation: 4,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            const SizedBox(height: 16),
            _buildSectionCard(
              title: "About Me",
              icon: Icons.person,
              child: Text(
                "I am a passionate and dedicated student pursuing a degree in IT. "
                "I have a strong interest in software development, problem-solving, and continuous learning. "
                "I strive to apply my knowledge and skills to create innovative solutions and contribute to the tech society.",
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            _buildSectionCard(
              title: "Academic Details",
              icon: Icons.school,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _infoRow(Icons.apartment, " University of Cabuyao"),
                  const Divider(color: AppColors.lightBlue),
                  _infoRow(Icons.grade, " 3rd Year"),
                  const Divider(color: AppColors.lightBlue),
                  _infoRow(Icons.menu_book, " BS in Information Technology"),
                ],
              ),
            ),
            _buildSectionCard(
              title: "Tech Skills",
              icon: Icons.code,
              child: const Text(
                "Flutter & Dart, Java, HTML, CSS, JavaScript, PHP, Git & Github, SQL",
                style: TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
            _buildSectionCard(
              title: "Contact Informations",
              icon: Icons.contact_mail,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(Icons.email, size: 18, color: AppColors.midBlue),
                        const SizedBox(width: 8),
                        const Text(
                          "cchynaagase@gmail.com",
                          style: TextStyle(color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.lightBlue),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.code_outlined,
                          size: 18,
                          color: AppColors.midBlue,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () async {
                            const url = "https://github.com/ceagase";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: const Text(
                            "Github Profile",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.lightBlue),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        Icon(
                          Icons.business_center,
                          size: 18,
                          color: AppColors.midBlue,
                        ),
                        const SizedBox(width: 8),
                        InkWell(
                          onTap: () async {
                            const url =
                                "https://www.linkedin.com/in/chyna-agase-b0729637a";
                            if (await canLaunchUrl(Uri.parse(url))) {
                              await launchUrl(
                                Uri.parse(url),
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          child: const Text(
                            "LinkedIn Profile",
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildClickMeButton(context),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.darkBlue, AppColors.midBlue],
        ),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/profile.jpg'),
          ),
          const SizedBox(height: 16),
          Text(
            "Hi! I'm Agase, Chyna",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Aspring Software Developer | IT Student",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: AppColors.lightBlue,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        color: AppColors.white,
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: AppColors.darkBlue),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.midBlue),
          const SizedBox(width: 10),
          Text("$text: ", style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClickMeButton(BuildContext context) {
    return Center(
      child: GestureDetector(
        //SINGLE TAP
        onTap: () {
          debugPrint("[GESTURE] Single Tap detected");
          debugPrint("Exam Date: ${DateTime.now().toLocal()}");
          debugPrint("=========================================");
        },
        //DOUBLE TAP
        onDoubleTap: () {
          debugPrint("[GESTURE] Double Tap detected");
          debugPrint("ITP107 Professor: Alforja, Albert");
          debugPrint("=========================================");
        },
        // LONG PRESS
        onLongPress: () {
          debugPrint("[GESTURE] Long Press detected");
          debugPrint("Student Full Name: Agase, Chyna E.");
          debugPrint("=========================================");
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.darkBlue, AppColors.midBlue],
            ),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkBlue,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Text(
            "Click Me",
            style: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
