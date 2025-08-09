import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:subtle/providers/task_provider.dart';

class DailyGoalCard extends StatefulWidget {
  const DailyGoalCard({super.key});

  @override
  State<DailyGoalCard> createState() => _DailyGoalCardState();
}

class _DailyGoalCardState extends State<DailyGoalCard> {
  final _controller = TextEditingController();
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final goal = context.read<TaskProvider>().dailyGoal;
      _controller.text = goal;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveGoal() {
    context.read<TaskProvider>().updateDailyGoal(_controller.text.trim());
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskProvider, child) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '🎯 Today\'s Goal',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  if (!_isEditing)
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _isEditing = true;
                        });
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                ],
              ),
              
              const SizedBox(height: 12),
              
              if (_isEditing)
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        decoration: InputDecoration(
                          hintText: 'What\'s your main goal today?',
                          hintStyle: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.7),
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                        ),
                        textCapitalization: TextCapitalization.sentences,
                        onSubmitted: (_) => _saveGoal(),
                      ),
                    ),
                    IconButton(
                      onPressed: _saveGoal,
                      icon: Icon(
                        Icons.check,
                        color: Theme.of(context).colorScheme.onPrimary,
                        size: 20,
                      ),
                    ),
                  ],
                )
              else
                Text(
                  taskProvider.dailyGoal.isEmpty 
                      ? 'Tap to set your daily goal'
                      : taskProvider.dailyGoal,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: taskProvider.dailyGoal.isEmpty
                        ? Theme.of(context).colorScheme.onPrimary.withValues(alpha: 0.7)
                        : Theme.of(context).colorScheme.onPrimary,
                    fontStyle: taskProvider.dailyGoal.isEmpty 
                        ? FontStyle.italic 
                        : FontStyle.normal,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}