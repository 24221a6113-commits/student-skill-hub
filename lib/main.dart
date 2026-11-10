import 'package:flutter/material.dart';
import 'explore_page.dart';

void main() {
  runApp(const StudentSkillHubApp());
}

class StudentSkillHubApp extends StatelessWidget {
  const StudentSkillHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StudentSkillHub',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff5B5FEF)),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void openExplore(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ExplorePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7FC),

      // ---------------- APP BAR ----------------
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        surfaceTintColor: Colors.transparent,

        title: const Row(
          children: [
            Icon(Icons.school_rounded, color: Color(0xff5B5FEF), size: 32),
            SizedBox(width: 10),
            Text(
              'StudentSkillHub',
              style: TextStyle(
                color: Color(0xff19192B),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Home',
              style: TextStyle(color: Color(0xff44445A), fontSize: 16),
            ),
          ),

          TextButton(
            onPressed: () => openExplore(context),
            child: const Text(
              'Explore',
              style: TextStyle(color: Color(0xff44445A), fontSize: 16),
            ),
          ),

          TextButton(
            onPressed: () => openExplore(context),
            child: const Text(
              'Opportunities',
              style: TextStyle(color: Color(0xff44445A), fontSize: 16),
            ),
          ),

          TextButton(
            onPressed: () {},
            child: const Text(
              'About',
              style: TextStyle(color: Color(0xff44445A), fontSize: 16),
            ),
          ),

          const SizedBox(width: 10),

          OutlinedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Login feature coming soon!')),
              );
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xff5B5FEF),
              side: const BorderSide(color: Color(0xff777789)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            child: const Text('Login'),
          ),

          const SizedBox(width: 10),

          ElevatedButton(
            onPressed: () => openExplore(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff5B5FEF),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Get Started',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          const SizedBox(width: 20),
        ],
      ),

      // ---------------- BODY ----------------
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ================= HERO =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xffF1F0FF), Color(0xffEFFAFF)],
                ),
              ),

              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),

                  child: Row(
                    children: [
                      // -------- LEFT --------
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                '🚀  YOUR CAREER STARTS HERE',
                                style: TextStyle(
                                  color: Color(0xff5B5FEF),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            const SizedBox(height: 28),

                            const Text(
                              'Build Your Skills.',
                              style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff17172B),
                              ),
                            ),

                            const Text(
                              'Discover Your Future.',
                              style: TextStyle(
                                fontSize: 52,
                                fontWeight: FontWeight.w800,
                                color: Color(0xff5B5FEF),
                              ),
                            ),

                            const SizedBox(height: 20),

                            const Text(
                              'Discover internships, hackathons, '
                              'certifications, workshops and career '
                              'opportunities designed for students like you.',
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.6,
                                color: Color(0xff666678),
                              ),
                            ),

                            const SizedBox(height: 30),

                            Row(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () => openExplore(context),
                                  icon: const Icon(Icons.explore_rounded),
                                  label: const Text('Explore Opportunities'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff5B5FEF),
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 17,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    elevation: 3,
                                  ),
                                ),

                                const SizedBox(width: 15),

                                OutlinedButton.icon(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'How StudentSkillHub Works',
                                          ),
                                          content: const Text(
                                            'Explore opportunities, '
                                            'discover useful skills, '
                                            'save opportunities and '
                                            'build your career profile.',
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.play_circle_outline),
                                  label: const Text('How it works'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: const Color(0xff5B5FEF),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 22,
                                      vertical: 17,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 60),

                      // -------- RIGHT CARD --------
                      Expanded(
                        child: Container(
                          height: 410,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xff6265F2), Color(0xff7A55EA)],
                            ),
                            borderRadius: BorderRadius.circular(32),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.18),
                                blurRadius: 30,
                                offset: const Offset(0, 15),
                              ),
                            ],
                          ),

                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text(
                                    '✦  ✨',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                              ),

                              const Icon(
                                Icons.rocket_launch_rounded,
                                color: Colors.white,
                                size: 120,
                              ),

                              const SizedBox(height: 30),

                              Container(
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 35,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 18,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.20),
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                child: const Center(
                                  child: Text(
                                    '📈  Grow • Learn • Succeed',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // ================= STATS =================
            Padding(
              padding: const EdgeInsets.all(35),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1150),

                  child: Row(
                    children: const [
                      StatCard(number: '500+', title: 'Opportunities'),
                      StatCard(number: '50+', title: 'Companies'),
                      StatCard(number: '1000+', title: 'Students'),
                      StatCard(number: '25+', title: 'Skill Areas'),
                    ],
                  ),
                ),
              ),
            ),

            // ================= FEATURES =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
              color: Colors.white,

              child: Column(
                children: [
                  const Text(
                    'Everything Students Need',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff19192B),
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Text(
                    'One platform to discover, learn and grow.',
                    style: TextStyle(fontSize: 16, color: Color(0xff777789)),
                  ),

                  const SizedBox(height: 40),

                  Wrap(
                    spacing: 25,
                    runSpacing: 25,
                    alignment: WrapAlignment.center,
                    children: [
                      FeatureCard(
                        icon: Icons.work_rounded,
                        title: 'Internships',
                        description: 'Find internships that match your skills.',
                        onTap: () => openExplore(context),
                      ),
                      FeatureCard(
                        icon: Icons.code_rounded,
                        title: 'Hackathons',
                        description:
                            'Participate in exciting coding challenges.',
                        onTap: () => openExplore(context),
                      ),
                      FeatureCard(
                        icon: Icons.workspace_premium_rounded,
                        title: 'Certifications',
                        description:
                            'Build your profile with useful certifications.',
                        onTap: () => openExplore(context),
                      ),
                      FeatureCard(
                        icon: Icons.groups_rounded,
                        title: 'Workshops',
                        description: 'Learn new skills from industry experts.',
                        onTap: () => openExplore(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ================= FOOTER =================
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(35),
              color: const Color(0xff18182B),
              child: const Column(
                children: [
                  Text(
                    'StudentSkillHub',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Empowering students to discover their future.',
                    style: TextStyle(color: Color(0xffBDBDCC)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '© 2026 StudentSkillHub • Built for Students',
                    style: TextStyle(color: Color(0xff88889A), fontSize: 13),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= STAT CARD =================

class StatCard extends StatelessWidget {
  final String number;
  final String title;

  const StatCard({super.key, required this.number, required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(vertical: 28),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.07),
              blurRadius: 18,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Text(
              number,
              style: const TextStyle(
                color: Color(0xff5B5FEF),
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(color: Color(0xff9999A7), fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= FEATURE CARD =================

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(22),
      child: Container(
        width: 250,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xffF8F8FD),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: const Color(0xffEEEEF5)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffEEEEFF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: const Color(0xff5B5FEF), size: 32),
            ),
            const SizedBox(height: 18),
            Text(
              title,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Color(0xff777789), height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
