import 'package:flutter/material.dart';
import 'opportunity_details_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedCategory = 'All';
  String searchText = '';

  final List<Map<String, dynamic>> opportunities = [
    {
      'title': 'AI & Machine Learning Internship',
      'company': 'TechNova Labs',
      'category': 'Internships',
      'icon': Icons.smart_toy_rounded,
      'location': 'Remote',
      'deadline': '20 Oct 2026',
      'description':
          'Work on real-world Artificial Intelligence and Machine Learning projects.',
      'skills': ['Python', 'Machine Learning', 'SQL'],
    },
    {
      'title': 'Smart India Hackathon',
      'company': 'Government of India',
      'category': 'Hackathons',
      'icon': Icons.code_rounded,
      'location': 'Online + Offline',
      'deadline': '25 Oct 2026',
      'description':
          'Build innovative solutions for real-world problems and compete with students across India.',
      'skills': ['Problem Solving', 'Programming', 'Innovation'],
    },
    {
      'title': 'Python Certification',
      'company': 'Skill Academy',
      'category': 'Certifications',
      'icon': Icons.workspace_premium_rounded,
      'location': 'Online',
      'deadline': '30 Oct 2026',
      'description':
          'Learn Python fundamentals and earn an industry-recognized certificate.',
      'skills': ['Python', 'Programming'],
    },
    {
      'title': 'Generative AI Workshop',
      'company': 'FutureTech',
      'category': 'Workshops',
      'icon': Icons.auto_awesome_rounded,
      'location': 'Online',
      'deadline': '18 Oct 2026',
      'description':
          'Learn the fundamentals of Generative AI, LLMs and modern AI tools.',
      'skills': ['AI', 'GenAI', 'Prompt Engineering'],
    },
    {
      'title': 'Web Development Internship',
      'company': 'CodeCraft Technologies',
      'category': 'Internships',
      'icon': Icons.web_rounded,
      'location': 'Remote',
      'deadline': '05 Nov 2026',
      'description':
          'Develop modern websites and applications using frontend technologies.',
      'skills': ['HTML', 'CSS', 'JavaScript'],
    },
    {
      'title': 'Flutter App Challenge',
      'company': 'DevCommunity',
      'category': 'Hackathons',
      'icon': Icons.phone_android_rounded,
      'location': 'Online',
      'deadline': '12 Nov 2026',
      'description':
          'Create an innovative mobile application using Flutter and Dart.',
      'skills': ['Flutter', 'Dart', 'UI/UX'],
    },
  ];

  List<Map<String, dynamic>> get filteredOpportunities {
    return opportunities.where((item) {
      final categoryMatch =
          selectedCategory == 'All' || item['category'] == selectedCategory;

      final searchMatch =
          item['title'].toString().toLowerCase().contains(
            searchText.toLowerCase(),
          ) ||
          item['company'].toString().toLowerCase().contains(
            searchText.toLowerCase(),
          ) ||
          item['category'].toString().toLowerCase().contains(
            searchText.toLowerCase(),
          );

      return categoryMatch && searchMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7FC),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff17172B),
        title: const Row(
          children: [
            Icon(Icons.school_rounded, color: Color(0xff5B5FEF), size: 30),
            SizedBox(width: 10),
            Text(
              'StudentSkillHub',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeroSection(),
            _buildSearchSection(),
            _buildCategories(),
            _buildOpportunitySection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 45),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffF0F0FF), Color(0xffEEF9FF)],
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: const Text(
                  '🚀 FIND YOUR NEXT OPPORTUNITY',
                  style: TextStyle(
                    color: Color(0xff5B5FEF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              const Text(
                'Explore Opportunities',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Color(0xff18182B),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Discover internships, hackathons, certifications and workshops designed for students.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Color(0xff68687A)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchSection() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 30, 25, 10),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 850),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search internships, hackathons, skills...',
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Color(0xff5B5FEF),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    final categories = [
      'All',
      'Internships',
      'Hackathons',
      'Certifications',
      'Workshops',
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        alignment: WrapAlignment.center,
        children: categories.map((category) {
          final selected = selectedCategory == category;

          return ChoiceChip(
            label: Text(category),
            selected: selected,
            onSelected: (_) {
              setState(() {
                selectedCategory = category;
              });
            },
            selectedColor: const Color(0xff5B5FEF),
            backgroundColor: Colors.white,
            labelStyle: TextStyle(
              color: selected ? Colors.white : const Color(0xff555568),
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOpportunitySection() {
    final items = filteredOpportunities;

    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 10, 25, 50),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Latest Opportunities',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff18182B),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${items.length} opportunities found',
                style: const TextStyle(color: Color(0xff777789), fontSize: 15),
              ),
              const SizedBox(height: 22),
              if (items.isEmpty)
                _buildEmptyState()
              else
                LayoutBuilder(
                  builder: (context, constraints) {
                    int columns = 1;

                    if (constraints.maxWidth > 900) {
                      columns = 3;
                    } else if (constraints.maxWidth > 600) {
                      columns = 2;
                    }

                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: columns,
                        crossAxisSpacing: 18,
                        mainAxisSpacing: 18,
                        childAspectRatio: 0.88,
                      ),
                      itemBuilder: (context, index) {
                        return _buildOpportunityCard(items[index]);
                      },
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOpportunityCard(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: const Color(0xffEEEEFF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(
                    item['icon'],
                    color: const Color(0xff5B5FEF),
                    size: 28,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Opportunity saved! ❤️')),
                    );
                  },
                  icon: const Icon(
                    Icons.bookmark_border_rounded,
                    color: Color(0xff5B5FEF),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xffF0F0FF),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                item['category'],
                style: const TextStyle(
                  color: Color(0xff5B5FEF),
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              item['title'],
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Color(0xff202034),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item['company'],
              style: const TextStyle(
                color: Color(0xff666678),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 17,
                  color: Color(0xff777789),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Text(
                    item['location'],
                    style: const TextStyle(color: Color(0xff777789)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const Icon(
                  Icons.calendar_month_outlined,
                  size: 17,
                  color: Color(0xff777789),
                ),
                const SizedBox(width: 5),
                Text(
                  'Deadline: ${item['deadline']}',
                  style: const TextStyle(color: Color(0xff777789)),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          OpportunityDetailsPage(opportunity: item),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff5B5FEF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                  elevation: 0,
                ),
                child: const Text(
                  'View Details →',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          Icon(Icons.search_off_rounded, size: 60, color: Color(0xff9999AA)),
          SizedBox(height: 15),
          Text(
            'No opportunities found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Try another search or category.',
            style: TextStyle(color: Color(0xff777789)),
          ),
        ],
      ),
    );
  }
}
