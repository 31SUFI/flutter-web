import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static final List<Project> projectsList = [
    const Project(
      title: 'Real Estate Web 🏫 - Innovative Housing Solutions',
      githubUrl: 'https://github.com/31SUFI/Real-Estate-Website.git',
      liveUrl: 'https://bauction.netlify.app',
      iconUrl: 'assets/icons/projects_icons/real_estate.svg',
      isLive: true,
    ),
    const Project(
      title: 'Furniture Store App 🛋️ - Elegant Furniture Shopping Experience',
      githubUrl: 'https://github.com/31SUFI/furniture_Store_app_UI.git',
      liveUrl:
          'https://drive.google.com/file/d/10T6Rk-02wvmAKu86f6_tBFu9Z92gxAvK/view?usp=drivesdk',
      iconUrl: 'assets/icons/projects_icons/furniture.svg',
      isLive: true,
    ),
    const Project(
      title: 'Car Marketplace App 🚗 - Buy Cars Easily',
      githubUrl: 'https://github.com/31SUFI/Car_Shop',
      liveUrl:
          'https://drive.google.com/file/d/10Sh9dzM4qhNXWcdaqWcBR1_VCt5lArYs',
      iconUrl: 'assets/icons/projects_icons/car.svg',
      isLive: true,
    ),
    const Project(
      title: 'Bookify 📚 - Your Digital Library Companion',
      githubUrl: 'https://github.com/31SUFI/Bookify.git',
      iconUrl: 'assets/icons/projects_icons/bookify.svg',
      liveUrl: '',
    ),
    const Project(
      title: 'E-commerce App - Your Online Grocery Partner',
      githubUrl: 'https://github.com/31SUFI/E-Commerce-app.git',
      iconUrl: 'assets/icons/projects_icons/e-commerce.svg',
      liveUrl: '',
    ),
    const Project(
      title: 'Nayapay Clone - Seamless Payment Gateway Experience',
      githubUrl: 'https://github.com/31SUFI/NayaPay_Clone.git',
      iconUrl: 'assets/icons/projects_icons/nayapay.svg',
      liveUrl: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 1200),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Projects',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0A2472),
              ),
            ),
            const SizedBox(height: 40),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth <= 600) {
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projectsList.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemBuilder: (context, index) => ProjectCard(
                      project: projectsList[index],
                    ),
                  );
                }

                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: projectsList.length,
                  itemBuilder: (context, index) => ProjectCard(
                    project: projectsList[index],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Project project;

  const ProjectCard({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: SvgPicture.asset(
                project.iconUrl,
                height: 40,
                width: 40,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            project.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 12),
          const Text(
            'Available on GitHub',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: () async {
              final url = project.githubUrl;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: SvgPicture.asset(
              'assets/icons/github.svg',
              height: 24,
              width: 24,
            ),
          ),
          if (project.isLive) ...[
            const SizedBox(height: 12),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue, // Text color
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 8), // Padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
              ),
              onPressed: () async {
                if (await canLaunch(project.liveUrl)) {
                  await launch(project.liveUrl);
                } else {
                  throw 'Could not launch ${project.liveUrl}';
                }
              },
              child: const Text('Preview'),
            ),
          ],
        ],
      ),
    );
  }
}

class Project {
  final String title;
  final String githubUrl;
  final String iconUrl;
  final String liveUrl;
  final bool isLive;

  const Project({
    required this.title,
    required this.githubUrl,
    required this.iconUrl,
    required this.liveUrl,
    this.isLive = false,
  });
}
