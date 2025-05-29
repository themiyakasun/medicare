import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsAndConditionsPage extends StatefulWidget {
  const TermsAndConditionsPage({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsPageState createState() => _TermsAndConditionsPageState();
}

class _TermsAndConditionsPageState extends State<TermsAndConditionsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolledToEnd = false;
  bool _hasAccepted = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 100) {
      setState(() {
        _isScrolledToEnd = true;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: const Color(0xFF2E7D9B),
        foregroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF2E7D9B),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.health_and_safety,
                  size: 50,
                  color: Colors.white.withOpacity(0.9),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Medicare App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Last updated: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Content Section
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Progress Indicator
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF8F9FA),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: const Color(0xFF2E7D9B),
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          'Please read carefully before proceeding',
                          style: TextStyle(
                            color: Color(0xFF666666),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Terms Content
                  Expanded(
                    child: Scrollbar(
                      controller: _scrollController,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSection(
                              '1. Acceptance of Terms',
                              'By downloading, installing, or using the Medicare App ("App"), you agree to be bound by these Terms and Conditions. If you do not agree with any part of these terms, you must not use the App.',
                            ),
                            _buildSection(
                              '2. Medical Disclaimer',
                              'This App is designed to provide information and tools related to Medicare services. It is not intended to replace professional medical advice, diagnosis, or treatment. Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.',
                            ),
                            _buildSection(
                              '3. Privacy and Data Protection',
                              'We are committed to protecting your privacy and personal health information. Our Privacy Policy, which is incorporated into these Terms, explains how we collect, use, and protect your information in compliance with HIPAA and other applicable privacy laws.',
                            ),
                            _buildSection(
                              '4. User Responsibilities',
                              'You are responsible for:\n• Providing accurate and complete information\n• Maintaining the confidentiality of your account credentials\n• Using the App in accordance with applicable laws and regulations\n• Notifying us immediately of any unauthorized use of your account',
                            ),
                            _buildSection(
                              '5. Permitted Use',
                              'You may use this App for lawful purposes only. You agree not to use the App to:\n• Violate any laws or regulations\n• Transmit harmful or malicious code\n• Attempt to gain unauthorized access to our systems\n• Share your account with others',
                            ),
                            _buildSection(
                              '6. Service Availability',
                              'While we strive to maintain continuous service, we do not guarantee that the App will be available at all times. We reserve the right to modify, suspend, or discontinue the service with or without notice.',
                            ),
                            _buildSection(
                              '7. Limitation of Liability',
                              'To the fullest extent permitted by law, we shall not be liable for any indirect, incidental, special, consequential, or punitive damages arising from your use of the App.',
                            ),
                            _buildSection(
                              '8. Updates and Changes',
                              'We may update these Terms and Conditions from time to time. We will notify you of any material changes through the App or via email. Your continued use of the App after such changes constitutes acceptance of the new terms.',
                            ),
                            _buildSection(
                              '9. Contact Information',
                              'If you have any questions about these Terms and Conditions, please contact us at:\n\nEmail: support@medicareapp.com\nPhone: 1-800-MEDICARE\nAddress: 123 Healthcare Ave, Medical City, MC 12345',
                            ),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Agreement Section
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        CheckboxListTile(
                          value: _hasAccepted,
                          onChanged: _isScrolledToEnd
                              ? (value) {
                                  setState(() {
                                    _hasAccepted = value ?? false;
                                  });
                                }
                              : null,
                          title: const Text(
                            'I have read and agree to the Terms and Conditions',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          activeColor: const Color(0xFF2E7D9B),
                          controlAffinity: ListTileControlAffinity.leading,
                          contentPadding: EdgeInsets.zero,
                        ),
                        if (!_isScrolledToEnd)
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              'Please scroll to the end to enable acceptance',
                              style: TextStyle(
                                color: Colors.orange[700],
                                fontSize: 12,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(false),
                                style: OutlinedButton.styleFrom(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  side: const BorderSide(
                                      color: Color(0xFF2E7D9B)),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Decline',
                                  style: TextStyle(
                                    color: Color(0xFF2E7D9B),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: _hasAccepted
                                    ? () => Navigator.of(context).pop(true)
                                    : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2E7D9B),
                                  foregroundColor: Colors.white,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 2,
                                ),
                                child: const Text(
                                  'Accept',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D9B),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(
              fontSize: 14,
              height: 1.5,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }
}
