import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../viewmodels/campaign_view_model.dart';
import 'sidebar.dart';
import 'campaign_form.dart';

class MainScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final campaignViewModel = ref.watch(campaignProvider);
    final currentStep = ref.read(campaignProvider.notifier).currentStep;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isSmallScreen = constraints.maxWidth < 600;
          return isSmallScreen
              ? Column(
            children: [
              Expanded(child: CampaignForm()),
              Sidebar(),
            ],
          )
              : Row(
            children: [
              Expanded(flex: 2, child: CampaignForm()),
              Expanded(flex: 1, child: Sidebar()),
            ],
          );
        },
      ),
    );
  }
}