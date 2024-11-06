import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/form_step_model.dart';

final campaignProvider = StateNotifierProvider<CampaignViewModel, int>((ref) {
  return CampaignViewModel();
});

class CampaignViewModel extends StateNotifier<int> {
  CampaignViewModel() : super(0);

  final List<FormStepModel> steps = [
    const FormStepModel(
      title: "Create New Campaign",
      label: "Fill out these details and get your campaign ready",
    ),
    const FormStepModel(
      title: "Create Segments",
      label: "Get full control over your audience",
    ),
    const FormStepModel(
      title: "Bidding Strategy",
      label: "Optimize your campaign reach with adstance",
    ),
    const FormStepModel(
      title: "Site Links",
      label: "Setup your customer journey flow",
    ),
    const FormStepModel(
      title: "Review Campaign",
      label: "Double check your campaign is ready to go!",
    ),
  ];

  List<FormStepModel> get campaignSteps => steps;

  void nextStep() {
    if (state < steps.length - 1) {
      state++;
    }
  }

  FormStepModel get currentStep => steps[state];
}