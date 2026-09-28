import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter',
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF0284C7)),
      ),
      home: const ProfileScreen(),
    );
  }
}

class StatItem {
  final String value;
  final String label;
  final Color color;
  const StatItem({
    required this.value,
    required this.label,
    this.color = const Color(0xFF0F172A),
  });
}

class Skill {
  final String label;
  final IconData icon;
  final Color bg;
  final Color fg;
  const Skill({
    required this.label,
    required this.icon,
    required this.bg,
    required this.fg,
  });
}

class Project {
  final String title;
  final String subtitle;
  final String imageUrl;
  const Project({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });
}

class ProfileData {
  static const String name = 'Alex Rivers';
  static const String role = 'Lead Mobile Engineer';
  static const String location = 'Tokyo, Japan';

  static const String avatarAsset = 'images/avata.png';

  static const String about =
      'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and '
      'building high-performance cross-platform applications. Focused on elegant ';
  static const List<StatItem> stats = [
    StatItem(value: '148', label: 'Projects'),
    StatItem(value: '9 Yrs', label: 'Experience'),
    StatItem(value: '4.9 ★', label: 'Rating', color: Color(0xFFEAB308)),
  ];

  static const List<Skill> skills = [
    Skill(
      label: 'Flutter',
      icon: Icons.flutter_dash,
      bg: Color(0xFFE0F2FE),
      fg: Color(0xFF0369A1),
    ),
    Skill(
      label: 'Dart',
      icon: Icons.code,
      bg: Color(0xFFDCFCE7),
      fg: Color(0xFF15803D),
    ),
    Skill(
      label: 'Clean Arch',
      icon: Icons.layers_outlined,
      bg: Color(0xFFFFE4E6),
      fg: Color(0xFFBE123C),
    ),
    Skill(
      label: 'UI/UX',
      icon: Icons.ads_click,
      bg: Color(0xFFF3E8FF),
      fg: Color(0xFF7E22CE),
    ),
    Skill(
      label: 'Firebase',
      icon: Icons.local_fire_department_outlined,
      bg: Color(0xFFFEF3C7),
      fg: Color(0xFFB45309),
    ),
  ];

  static const List<Project> projects = [
    Project(
      title: 'E-Shop Flutter',
      subtitle: 'Mobile App • 2026',
      imageUrl: 'images/left.png',
    ),
    Project(
      title: 'Crypto Vault',
      subtitle: 'Finance • Clean Arch',
      imageUrl: 'images/right.png',
    ),
  ];

  static const String email = 'alex.rivers@email.com';
  static const String phone = '+81 (90) 1234-5678';
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              width: 390,
              constraints: const BoxConstraints(minHeight: 1163),
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(44),
                border: Border.all(color: const Color(0xFFCBD5E1), width: 3),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 44, 24, 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      TopBar(),
                      SizedBox(height: 24),
                      ProfileHeader(),
                      SizedBox(height: 24),
                      StatsCard(),
                      SizedBox(height: 24),
                      SectionTitle('About Me'),
                      SizedBox(height: 8),
                      AboutText(),
                      SizedBox(height: 24),
                      SectionTitle('Skills & Expertise'),
                      SizedBox(height: 10),
                      SkillsWrap(),
                      SizedBox(height: 24),
                      SectionTitle('Featured Projects'),
                      SizedBox(height: 12),
                      ProjectsRow(),
                      SizedBox(height: 24),
                      ContactCard(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconButton(icon: Icons.arrow_back_ios_new),
        const Text(
          'Profile',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF0F172A),
          ),
        ),
        _iconButton(icon: Icons.share_outlined),
      ],
    );
  }

  Widget _iconButton({required IconData icon}) {
    return Container(
      width: 20,
      height: 42,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
      ),
      alignment: Alignment.center,
      child: Icon(icon, size: 14, color: const Color(0xFF1E293B)),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 140,
          height: 140,
          child: Stack(
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFFFB087),
                      Color(0xFFFF8080),
                      Color(0xFFFFCF70),
                    ],
                    stops: [0.0, 0.3571, 0.7143],
                  ),
                ),
              ),
              Positioned(
                left: 4,
                top: 4,
                child: Container(
                  width: 132,
                  height: 132,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                left: 8,
                top: 8,
                child: ClipOval(
                  child: Image.asset(
                    ProfileData.avatarAsset,
                    width: 124,
                    height: 124,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      width: 124,
                      height: 124,
                      color: const Color(0xFFE2E8F0),
                      child: const Icon(Icons.person, size: 60),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 4,
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(3),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF0284C7),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          ProfileData.name,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 1.0,
            letterSpacing: 0,
            color: Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          ProfileData.role,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Color(0xFF64748B),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.location_on_outlined,
                size: 14,
                color: Color(0xFF475569),
              ),
              SizedBox(width: 6),
              Text(
                ProfileData.location,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF475569),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = ProfileData.stats;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1729).withOpacity(0.05),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _statColumn(stats[0]),
          _divider(),
          _statColumn(stats[1]),
          _divider(),
          _statColumn(stats[2]),
        ],
      ),
    );
  }

  Widget _statColumn(StatItem item) {
    return SizedBox(
      width: 90,
      child: Column(
        children: [
          Text(
            item.value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: item.color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xFF94A3B8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() =>
      Container(width: 1, height: 28, color: const Color(0xFFE2E8F0));
}

class SectionTitle extends StatelessWidget {
  final String text;
  const SectionTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: Color(0xFF0F172A),
      ),
    );
  }
}

class AboutText extends StatelessWidget {
  const AboutText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      ProfileData.about,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 21 / 14,
        letterSpacing: 0,
        color: Color(0xFF475569),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final Skill skill;
  const SkillChip({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: skill.bg,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(skill.icon, size: 14, color: skill.fg),
          const SizedBox(width: 6),
          Text(
            skill.label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: skill.fg,
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsWrap extends StatelessWidget {
  const SkillsWrap({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: ProfileData.skills.map((s) => SkillChip(skill: s)).toList(),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1729).withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              project.imageUrl,
              height: 85,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                height: 85,
                color: const Color(0xFFF1F5F9),
                child: const Icon(Icons.image, color: Color(0xFF94A3B8)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    project.title,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    project.subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
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

class ProjectsRow extends StatelessWidget {
  const ProjectsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: ProjectCard(project: ProfileData.projects[0])),
        const SizedBox(width: 12),
        Expanded(child: ProjectCard(project: ProfileData.projects[1])),
      ],
    );
  }
}

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F1729).withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          _contactRow(
            icon: Icons.contact_page_outlined,
            label: 'Contact Information',
            isBold: true,
          ),
          _divider(),
          _contactRow(icon: Icons.mail_outline, label: ProfileData.email),
          _divider(),
          _contactRow(icon: Icons.phone_outlined, label: ProfileData.phone),
        ],
      ),
    );
  }

  Widget _contactRow({
    required IconData icon,
    required String label,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF0F172A)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: isBold ? FontWeight.w700 : FontWeight.w500,
                color: isBold
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF334155),
              ),
            ),
          ),
          const Icon(Icons.chevron_right, size: 18, color: Color(0xFFCBD5E1)),
        ],
      ),
    );
  }

  Widget _divider() => Container(height: 1, color: const Color(0xFFF1F5F9));
}
