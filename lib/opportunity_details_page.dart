import 'package:flutter/material.dart';
import 'application_form_page.dart';

class OpportunityDetailsPage extends StatelessWidget {
  final Map<String, dynamic> opportunity;

  const OpportunityDetailsPage({super.key, required this.opportunity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7FF),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: const Color(0xff202040),
        title: const Text(
          'Opportunity Details',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // TOP HEADER
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(28),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xff6366F1), Color(0xff8B5CF6)],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 85,
                    width: 85,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Icon(
                      opportunity['icon'] ?? Icons.school,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),

                  const SizedBox(height: 18),

                  Text(
                    opportunity['title']?.toString() ?? 'Opportunity',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    opportunity['company']?.toString() ?? 'Organization',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // QUICK INFORMATION
                  const Text(
                    'Quick Information',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff202040),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          Icons.category_outlined,
                          'Category',
                          opportunity['category']?.toString() ?? 'Internship',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoCard(
                          Icons.location_on_outlined,
                          'Mode',
                          opportunity['mode']?.toString() ?? 'Online',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      Expanded(
                        child: _infoCard(
                          Icons.schedule_outlined,
                          'Duration',
                          opportunity['duration']?.toString() ?? '2 Months',
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _infoCard(
                          Icons.payments_outlined,
                          'Stipend',
                          opportunity['stipend']?.toString() ?? 'Available',
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // ABOUT
                  const Text(
                    'About this Opportunity',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff202040),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    opportunity['description']?.toString() ??
                        'This opportunity is designed for students who want to '
                            'develop practical skills and gain real-world experience. '
                            'Students can learn from industry professionals, work on '
                            'practical projects and improve their career readiness.',
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // SKILLS
                  const Text(
                    'Skills You Can Build',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff202040),
                    ),
                  ),

                  const SizedBox(height: 15),

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _skillChip('Problem Solving'),
                      _skillChip('Communication'),
                      _skillChip('Technical Skills'),
                      _skillChip('Teamwork'),
                      _skillChip('Project Experience'),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // BENEFITS
                  const Text(
                    'Why Should You Join?',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff202040),
                    ),
                  ),

                  const SizedBox(height: 15),

                  _benefit(
                    Icons.workspace_premium_outlined,
                    'Build your resume',
                  ),

                  _benefit(
                    Icons.psychology_outlined,
                    'Gain practical knowledge',
                  ),

                  _benefit(
                    Icons.groups_outlined,
                    'Connect with other students',
                  ),

                  _benefit(
                    Icons.rocket_launch_outlined,
                    'Improve career opportunities',
                  ),

                  const SizedBox(height: 35),

                  // SAVE AND APPLY BUTTONS
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'Opportunity saved successfully! 🔖',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(Icons.bookmark_border),
                          label: const Text('Save'),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: const Color(0xff5B5FEF),
                            side: const BorderSide(color: Color(0xff5B5FEF)),
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        flex: 2,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            final result =
                                await Navigator.push<Map<String, dynamic>>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ApplicationFormPage(
                                      opportunityTitle:
                                          opportunity['title']?.toString() ??
                                          'Opportunity',
                                    ),
                                  ),
                                );

                            if (!context.mounted) return;

                            if (result != null) {
                              debugPrint('Application Details: $result');

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    'Application submitted successfully! 🎉',
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text('Apply Now'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5B5FEF),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // INFORMATION CARD
  Widget _infoCard(IconData icon, String title, String value) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.04), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: const Color(0xff5B5FEF), size: 25),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 3),
          Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xff202040),
            ),
          ),
        ],
      ),
    );
  }

  // SKILL CHIP
  Widget _skillChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
      decoration: BoxDecoration(
        color: const Color(0xffEEEEFF),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xff5B5FEF),
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
    );
  }

  // BENEFIT ITEM
  Widget _benefit(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xffEEEEFF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xff5B5FEF), size: 21),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Color(0xff45455F)),
            ),
          ),
        ],
      ),
    );
  }
}
