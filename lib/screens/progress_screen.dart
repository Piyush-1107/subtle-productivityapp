import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtle/providers/habit_provider.dart';
import 'package:subtle/providers/timer_provider.dart';
import 'package:subtle/providers/task_provider.dart';
import 'package:subtle/widgets/habit_card.dart';
import 'package:subtle/widgets/stats_card.dart';
import 'package:subtle/screens/add_habit_screen.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              children: [
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Progress',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Stats Overview
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Consumer3<TaskProvider, HabitProvider, TimerProvider>(
                    builder: (context, taskProvider, habitProvider, timerProvider, child) {
                      return Row(
                        children: [
                          Expanded(
                            child: StatsCard(
                              title: 'Tasks Done',
                              value: '${taskProvider.todayTasks.where((t) => t.isCompleted).length}',
                              subtitle: 'today',
                              icon: Icons.task_alt,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: StatsCard(
                              title: 'Focus Time',
                              value: '${timerProvider.todayFocusMinutes}m',
                              subtitle: 'today',
                              icon: Icons.timer,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Habits Section Header
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Text(
                        'Daily Habits',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const Spacer(),
                      Consumer<HabitProvider>(
                        builder: (context, habitProvider, child) {
                          return Text(
                            '${habitProvider.completedTodayCount}/${habitProvider.habits.length}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Consumer<HabitProvider>(
                    builder: (context, habitProvider, child) {
                      if (habitProvider.habits.isEmpty) {
                        return Center(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            padding: const EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surfaceContainerLow,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.spa,
                                  size: 48,
                                  color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  'No habits yet',
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Start building good habits',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.5),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: habitProvider.habits.length,
                        itemBuilder: (context, index) {
                          final habit = habitProvider.habits[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: HabitCard(habit: habit),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddHabitScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}