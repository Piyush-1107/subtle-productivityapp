import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtle/providers/timer_provider.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TimerProvider>(
        builder: (context, timerProvider, child) {
          return SafeArea(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(
                        'Focus Timer',
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    
                      // Timer Circle - responsive size
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final screenHeight = MediaQuery.of(context).size.height;
                          final double circleSize = screenHeight < 700 ? 220 : 280;
                          
                          return Container(
                            width: circleSize,
                            height: circleSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.primary,
                                  Theme.of(context).colorScheme.secondary,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Theme.of(context).colorScheme.surface,
                              ),
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      timerProvider.formattedTime,
                                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                        fontWeight: FontWeight.w300,
                                        color: Theme.of(context).colorScheme.primary,
                                        fontSize: screenHeight < 700 ? 32 : null,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      timerProvider.isBreak ? 'Break Time' : 'Focus Time',
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      
                      // Control Buttons
                      if (!timerProvider.isRunning) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _TimerButton(
                              label: '25 min',
                              subtitle: 'Focus',
                              onPressed: () => timerProvider.startTimer(25),
                              icon: Icons.work_outline,
                            ),
                            _TimerButton(
                              label: '15 min',
                              subtitle: 'Focus',
                              onPressed: () => timerProvider.startTimer(15),
                              icon: Icons.flash_on,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _TimerButton(
                              label: '5 min',
                              subtitle: 'Break',
                              onPressed: () => timerProvider.startBreak(5),
                              icon: Icons.coffee_outlined,
                            ),
                            _TimerButton(
                              label: '15 min',
                              subtitle: 'Break',
                              onPressed: () => timerProvider.startBreak(15),
                              icon: Icons.spa,
                            ),
                          ],
                        ),
                      ] else
                        FilledButton.icon(
                          onPressed: timerProvider.stopTimer,
                          icon: const Icon(Icons.stop),
                          label: const Text('Stop'),
                          style: FilledButton.styleFrom(
                            backgroundColor: Theme.of(context).colorScheme.error,
                            foregroundColor: Theme.of(context).colorScheme.onError,
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                          ),
                        ),
                      
                      SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                      
                      // Today's Stats
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  '${timerProvider.todayFocusMinutes}',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  'minutes focused',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
                            ),
                            Column(
                              children: [
                                Text(
                                  '${timerProvider.sessions.where((s) => s.isCompleted).length}',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                                Text(
                                  'sessions completed',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TimerButton extends StatelessWidget {
  final String label;
  final String subtitle;
  final VoidCallback onPressed;
  final IconData icon;

  const _TimerButton({
    required this.label,
    required this.subtitle,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 28,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}