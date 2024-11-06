import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:screlmachinetest/widgets/constants.dart';
import '../viewmodels/campaign_view_model.dart';
import '../widgets/customButton.dart';
import '../widgets/multi_style_text_row.dart';
import '../widgets/toggle_row.dart';

final isFirstOptionSelectedProvider = StateProvider<bool>((ref) => true);

class CampaignForm extends ConsumerWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController campaignSubjectController = TextEditingController();
  final TextEditingController previewTextController = TextEditingController();
  final TextEditingController fromNameController = TextEditingController();
  final TextEditingController fromEmailController = TextEditingController();
  String jsonDataMessage = "";
  CampaignForm({Key? key}) : super(key: key);
  final Box campaignBox = Hive.box('campaignBox');

  void _loadSavedData() {
    campaignSubjectController.text = campaignBox.get('campaignSubject', defaultValue: '');
    previewTextController.text = campaignBox.get('previewText', defaultValue: '');
    fromNameController.text = campaignBox.get('fromName', defaultValue: '');
    fromEmailController.text = campaignBox.get('fromEmail', defaultValue: '');
  }

  void _saveFormData() {
    campaignBox.put('campaignSubject', campaignSubjectController.text);
    campaignBox.put('previewText', previewTextController.text);
    campaignBox.put('fromName', fromNameController.text);
    campaignBox.put('fromEmail', fromEmailController.text);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFirstOptionSelected = ref.watch(isFirstOptionSelectedProvider);
    final campaignViewModel = ref.watch(campaignProvider.notifier);
    final currentStepIndex = ref.watch(campaignProvider);

    _loadSavedData();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              const Column(
                children: [
                  Text(
                    'Create New Email Campaign',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Fill out these details to build your broadcast',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Campaign Subject",
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: campaignSubjectController,
                      decoration: InputDecoration(
                        hintText: "Enter Subject",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Campaign subject is required' : null,
                    ),
                    const SizedBox(height: 12),
                    const Text("Preview Text",
                      style: TextStyle(fontWeight: FontWeight.bold),),
                    TextFormField(
                      controller: previewTextController,
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: "Enter text here...",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor),
                        ),
                      ),
                      validator: (value) => value!.isEmpty ? 'Preview text is required' : null,
                    ),
                    const Text('Keep this simple of 50 character'),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('"From" Name',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                              TextFormField(
                                controller: fromNameController,
                                decoration: InputDecoration(
                                  hintText: "From Name",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                ),
                                validator: (value) => value!.isEmpty ? 'From Name is required' : null,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('"From" Email',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                              TextFormField(
                                controller: fromEmailController,
                                decoration: InputDecoration(
                                  hintText: "Anas@example.com",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey.shade300),
                                  ),
                                  focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: primaryColor),
                                  ),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) return 'From Email is required';
                                  if (!RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$").hasMatch(value)) return 'Enter a valid email';
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Divider(color: Colors.grey.shade300),
                    const SizedBox(height: 12),
                    ToggleRow(
                      label: "Run only once per customer",
                      value: isFirstOptionSelected,
                      onChanged: (value) => ref.read(isFirstOptionSelectedProvider.notifier).state = value,
                    ),
                    const SizedBox(height: 8),
                    ToggleRow(
                      label: "Custom audience",
                      value: !isFirstOptionSelected,
                      onChanged: (value) => ref.read(isFirstOptionSelectedProvider.notifier).state = !value,
                    ),
                    const SizedBox(height: 12),
                    const MultiStyleTextRow(),
                    const SizedBox(height: 12),
                    Divider(color: Colors.grey.shade300),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          text: "Save Draft",
                          onTap: _saveFormData,
                          isPrimary: false,
                          width: 250,
                          height: 40,
                        ),
                        CustomButton(
                          text: currentStepIndex == 4 ? "Submit" : "Next Step",
                          width: 350,
                          height: 40,
                          onTap: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              _saveFormData();
                              if (currentStepIndex == 4) {
                                final campaignData = {
                                  'campaignSubject': campaignSubjectController.text,
                                  'previewText': previewTextController.text,
                                  'fromName': fromNameController.text,
                                  'fromEmail': fromEmailController.text,
                                  'runOncePerCustomer': isFirstOptionSelected, // Directly use the boolean
                                };
                                jsonDataMessage = jsonEncode(campaignData);
                                log(jsonDataMessage);
                              } else {
                                ref.read(campaignProvider.notifier).nextStep();
                              }
                            }
                          },
                        ),
                      ],
                    ),
                    if (jsonDataMessage.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      const Text(
                        'Submitted Data in JSON format:',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        jsonDataMessage,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
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
