import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:subtle/screens/settings_screen.dart';
import 'package:subtle/screens/about_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Branding
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'S',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subtle',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Mindful productivity',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 40),
              
              // Menu Options
              Expanded(
                child: Column(
                  children: [
                    DrawerMenuItem(
                      icon: Icons.palette_outlined,
                      title: 'Themes',
                      subtitle: 'Customize your app appearance',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SettingsScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    DrawerMenuItem(
                      icon: Icons.info_outline,
                      title: 'About Subtle',
                      subtitle: 'Learn more about the app',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AboutScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    DrawerMenuItem(
                      icon: Icons.share,
                      title: 'Share It',
                      subtitle: 'Share with friends',
                      onTap: () {
                        Navigator.pop(context);
                        _shareApp(context);
                      },
                    ),
                    const SizedBox(height: 16),
                    DrawerMenuItem(
                      icon: Icons.star_outline,
                      title: 'Rate This Application',
                      subtitle: 'Rate us on the App Store',
                      onTap: () {
                        Navigator.pop(context);
                        _rateApp(context);
                      },
                    ),
                    const SizedBox(height: 16),
                    DrawerMenuItem(
                      icon: Icons.mail_outline,
                      title: 'Contact',
                      subtitle: 'Get in touch with us',
                      onTap: () {
                        Navigator.pop(context);
                        _contactUs(context);
                      },
                    ),
                  ],
                ),
              ),
              
              // Footer
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Stay focused, stay productive',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _shareApp(BuildContext context) async {
  const appStoreUrl = 'https://apps.apple.com/app/subtle-productivity';
  const playStoreUrl = 'https://play.google.com/store/apps/details?id=com.subtle.productivity';
  
  // For this demo, we'll show a dialog with share options
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Share Subtle'),
        content: const Text('Share this amazing productivity app with your friends!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('App link copied to clipboard!')),
              );
            },
            child: const Text('Copy Link'),
          ),
        ],
      );
    },
  );
}

void _rateApp(BuildContext context) async {
  const appStoreUrl = 'https://apps.apple.com/app/subtle-productivity';
  const playStoreUrl = 'https://play.google.com/store/apps/details?id=com.subtle.productivity';
  
  // For this demo, we'll show a dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Rate Subtle'),
        content: const Text('Love using Subtle? Please rate us on the App Store!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Later'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening App Store...')),
              );
            },
            child: const Text('Rate Now'),
          ),
        ],
      );
    },
  );
}

void _contactUs(BuildContext context) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: 'piyushdubey1107@gmail.com',
    query: 'subject=Subtle App - Contact&body=Hi there,\n\nI wanted to reach out regarding the Subtle app.\n\n',
  );
  
  try {
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Could not open email app. Please email us at piyushdubey1107@gmail.com'),
            action: SnackBarAction(
              label: 'Copy Email',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Email copied to clipboard!')),
                );
              },
            ),
          ),
        );
      }
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Could not open email app. Please contact piyushdubey1107@gmail.com'),
        ),
      );
    }
  }
}

class DrawerMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const DrawerMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.4),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}