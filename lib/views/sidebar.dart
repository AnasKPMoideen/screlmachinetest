import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/form_step_model.dart';
import '../viewmodels/campaign_view_model.dart';

class Sidebar extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaignViewModel = ref.watch(campaignProvider.notifier);
    final currentStepIndex = ref.watch(campaignProvider);
    final steps = campaignViewModel.campaignSteps;

    final double sidebarWidth = MediaQuery.of(context).size.width / 3;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Container(
          width: sidebarWidth,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Campaign Steps',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ...steps.asMap().entries.map((entry) {
                    int index = entry.key;
                    FormStepModel step = entry.value;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: index == currentStepIndex ? Colors.orange : Colors.grey,
                        child: Text('${index + 1}'),
                      ),
                      title: Text(
                        step.title,
                        style: TextStyle(
                          fontWeight: index == currentStepIndex ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(step.label),
                      onTap: () => ref.read(campaignProvider.notifier).state = index,
                    );
                  }).toList(),
                ],
              ),

              const SizedBox(height: 100,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Need Help?',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Get to know how your campaign\ncan reach a wider audience.',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                    },
                    child: const Text('Contact Us'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
