import 'package:flutter/material.dart';

class ApplicationFormPage extends StatefulWidget {
  final String opportunityTitle;

  const ApplicationFormPage({super.key, required this.opportunityTitle});

  @override
  State<ApplicationFormPage> createState() => _ApplicationFormPageState();
}

class _ApplicationFormPageState extends State<ApplicationFormPage> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final collegeController = TextEditingController();
  final courseController = TextEditingController();
  final resumeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    collegeController.dispose();
    courseController.dispose();
    resumeController.dispose();
    super.dispose();
  }

  Widget buildField(
    String label,
    TextEditingController controller,
    IconData icon, {
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator:
            validator ??
            (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Please enter $label';
              }
              return null;
            },
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xff5B5FEF)),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(color: Color(0xffE5E5F5)),
          ),
        ),
      ),
    );
  }

  void submitApplication() {
    if (!_formKey.currentState!.validate()) return;

    final application = {
      'opportunity': widget.opportunityTitle,
      'name': nameController.text.trim(),
      'email': emailController.text.trim(),
      'phone': phoneController.text.trim(),
      'college': collegeController.text.trim(),
      'course': courseController.text.trim(),
      'resume': resumeController.text.trim(),
      'status': 'Submitted',
      'submittedAt': DateTime.now().toIso8601String(),
    };

    Navigator.pop(context, application);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7FF),

      appBar: AppBar(
        title: const Text(
          'Student Application',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff202040),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),

        child: Form(
          key: _formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const Text(
                'Apply for Opportunity',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff202040),
                ),
              ),

              const SizedBox(height: 10),

              Text(
                widget.opportunityTitle,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color(0xff5B5FEF),
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 28),

              const Text(
                'Personal Information',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              buildField('Full Name', nameController, Icons.person_outline),

              buildField(
                'Email Address',
                emailController,
                Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null ||
                      !RegExp(
                        r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                      ).hasMatch(value.trim())) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),

              buildField(
                'Phone Number',
                phoneController,
                Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null ||
                      !RegExp(r'^[0-9]{10}$').hasMatch(value.trim())) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 12),

              const Text(
                'Education Details',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              buildField(
                'College Name',
                collegeController,
                Icons.school_outlined,
              ),

              buildField(
                'Course / Branch',
                courseController,
                Icons.menu_book_outlined,
              ),

              const SizedBox(height: 12),

              const Text(
                'Professional Details',
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 18),

              buildField(
                'Resume Link (Google Drive / Portfolio)',
                resumeController,
                Icons.link,
                keyboardType: TextInputType.url,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter your resume link';
                  }

                  final uri = Uri.tryParse(value.trim());

                  if (uri == null ||
                      !['http', 'https'].contains(uri.scheme) ||
                      uri.host.isEmpty) {
                    return 'Enter a valid URL starting with https://';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 54,

                child: ElevatedButton.icon(
                  onPressed: submitApplication,

                  icon: const Icon(Icons.send),

                  label: const Text(
                    'Submit Application',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff5B5FEF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
