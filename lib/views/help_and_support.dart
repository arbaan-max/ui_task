import 'package:flutter/material.dart';
import 'package:task_validation/constants/custome_colors.dart';
import 'package:task_validation/widgets/custome_text_form_field.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  /// A key used to identify the form and validate its fields.
  final _formKey = GlobalKey<FormState>();

  /// Controllers for the form fields.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  /// The user's selected preference for contact method. Defaults to "Call".
  String _preference = 'Call';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.background,

      /// AppBar configuration
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColors.background,
        title: const Text(
          'Help & Support',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message_rounded),
          ),
        ],
      ),

      /// Form and UI layout
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Name field
                CustomFormField(
                  title: "Full Name",
                  hintText: 'Your Name',
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                /// Email field
                CustomFormField(
                  title: "Email",
                  hintText: 'Enter Email Address',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                ),

                /// Phone field
                CustomFormField(
                  title: "Phone",
                  hintText: 'Enter Your Number',
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                ),

                /// Message field
                CustomFormField(
                  title: "Message",
                  hintText: 'Write here...',
                  controller: _messageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a message';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),

                const SizedBox(height: 16),

                /// Contact Preference section
                Text(
                  'Preference',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Row(
                  children: [
                    RadioOption(
                      label: 'Call',
                      value: 'Call',
                      groupValue: _preference,
                      onChanged: (value) {
                        setState(() {
                          _preference = value ?? 'Call';
                        });
                      },
                    ),
                    RadioOption(
                      label: 'Email',
                      value: 'Email',
                      groupValue: _preference,
                      onChanged: (value) {
                        setState(() {
                          _preference = value ?? 'Email';
                        });
                      },
                    ),
                    RadioOption(
                      label: 'WhatsApp',
                      value: 'WhatsApp',
                      groupValue: _preference,
                      onChanged: (value) {
                        setState(() {
                          _preference = value ?? 'WhatsApp';
                        });
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                /// Submit button
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: CustomColors.primary,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Close the keyboard
                        FocusScope.of(context).unfocus();

                        // Show the success modal bottom sheet
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          builder: (context) {
                            return Container(
                              width: MediaQuery.sizeOf(context).width,
                              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 54),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      color: CustomColors.grey,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.check_circle_outline,
                                    color: CustomColors.ternary,
                                    size: 50,
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Submitted!',
                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    'Your Preference Details\nsuccessfully submitted.',
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: CustomColors.grey,
                                        ),
                                  ),
                                  const SizedBox(height: 24),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.w500,
                            color: CustomColors.secondary,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is removed from the widget tree
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
