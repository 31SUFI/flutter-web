import 'package:flutter/material.dart';
import 'package:portfolio_website/utils/constants.dart';
import 'package:animate_do/animate_do.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        width: double.infinity,
        color: Colors.white,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth > 800;
            return Container(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 80 : 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'My ',
                          style: AppStyles.headerText.copyWith(
                            fontSize: 28,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: 'Professional Journey',
                          style: AppStyles.headerText.copyWith(
                            fontSize: 28,
                            color: AppColors.accentColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Building digital experiences through diverse roles and challenges',
                    style: AppStyles.subHeaderText.copyWith(
                      color: AppColors.accentColor,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildTimeline(isDesktop),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTimeline(bool isDesktop) {
    final experiences = [
      {
        'title': 'Freelance Flutter Developer',
        'company': 'Self-Employed',
        'period': '2025',
        'description': '''
• Developed custom mobile applications for various clients
• Worked closely with clients to gather requirements and deliver tailored solutions
• Managed project timelines and deliverables independently
• Handled full app development lifecycle from concept to deployment
• Provided ongoing maintenance and support for existing applications
''',
        'icon': Icons.computer,
        'color': Colors.green,
      },
      {
        'title': 'Junior Flutter Developer',
        'company': 'Pluton',
        'period': '2024-2025',
        'description': '''
• Developed and maintained cross-platform mobile applications using Flutter
• Implemented new features and improved existing functionality
• Collaborated with cross-functional teams to define, design, and ship new features
• Optimized application performance and resolved bugs
• Participated in code reviews and team knowledge sharing sessions
''',
        'icon': Icons.work,
        'color': Colors.blue,
      },
      {
        'title': 'Flutter Developer Intern',
        'company': 'Invision Custom Solutions',
        'period': '2023',
        'description': '''
• Assisted in developing mobile applications using Flutter
• Worked with senior developers to implement new features
• Participated in team meetings and code reviews
• Gained experience with state management solutions
• Contributed to UI/UX improvements and bug fixes
''',
        'icon': Icons.school,
        'color': Colors.orange,
      },
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: experiences.length,
      separatorBuilder: (context, index) => const SizedBox(height: 30),
      itemBuilder: (context, index) {
        final exp = experiences[index];
        return _buildTimelineItem(
          title: exp['title'] as String,
          company: exp['company'] as String,
          period: exp['period'] as String,
          description: exp['description'] as String,
          icon: exp['icon'] as IconData,
          color: exp['color'] as Color,
          isDesktop: isDesktop,
        );
      },
    );
  }

  Widget _buildTimelineItem({
    required String title,
    required String company,
    required String period,
    required String description,
    required IconData icon,
    required Color color,
    required bool isDesktop,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isDesktop) ..._buildDesktopTimeline(icon, color),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(icon, color: color, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        title,
                        style: AppStyles.subHeaderText.copyWith(
                          fontSize: isDesktop ? 22 : 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  company,
                  style: AppStyles.bodyText.copyWith(
                    fontSize: isDesktop ? 18 : 16,
                    color: AppColors.accentColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  period,
                  style: AppStyles.bodyText.copyWith(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  description,
                  style: AppStyles.bodyText.copyWith(
                    color: Colors.black87,
                    fontSize: isDesktop ? 15 : 14,
                    height: 1.8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildDesktopTimeline(IconData icon, Color color) {
    return [
      Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
              border: Border.all(color: color, width: 2),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 10),
          Container(
            width: 2,
            height: 40,
            color: Colors.grey[300],
          ),
        ],
      ),
      const SizedBox(width: 30),
    ];
  }
}
