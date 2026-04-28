import 'package:flutter/material.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  int rating = 0;
  String? selectedCategory;
  final TextEditingController feedbackController = TextEditingController();
  final FocusNode feedbackFocus = FocusNode();

  final categories = [
    "Bug Report",
    "Feature Request",
    "UI/UX",
    "Performance",
    "Other",
  ];

  @override
  void dispose() {
    feedbackController.dispose();
    feedbackFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // ✅ Tap outside to close keyboard
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.background,

        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.background,
                elevation: 0,

                leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                // appBar title
                title: Text(
                  "Feedback",
                  style: AppTextStyles.heading,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                centerTitle: true,
              ),

              // 🔥 Divider under AppBar
              const Divider(
                color: Color.fromARGB(255, 214, 213, 213),
                thickness: 2,
                height: 0,
              ),
            ],
          ),
        ),

        body: Column(
          children: [
            // SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rate Your Experience",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: List.generate(5, (index) {
                          return IconButton(
                            icon: Icon(
                              Icons.star,
                              color: index < rating
                                  ? Colors.amber
                                  : Colors.grey[300],
                              size: 32,
                            ),
                            onPressed: () => setState(() => rating = index + 1),
                          );
                        }),
                      ),
                      if (rating > 0)
                        Text(
                          _ratingLabel(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      const SizedBox(height: 20),
                      const Text(
                        "Category (Optional)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: categories.map((cat) {
                          final bool isSelected = selectedCategory == cat;
                          return ChoiceChip(
                            label: Text(cat),
                            selected: isSelected,
                            selectedColor: Colors.purple,
                            backgroundColor: Colors.grey[200],
                            labelStyle: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            onSelected: (_) =>
                                setState(() => selectedCategory = cat),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Tell us more",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: feedbackController,
                        focusNode: feedbackFocus,
                        maxLines: 5,
                        maxLength: 500,
                        decoration: InputDecoration(
                          hintText:
                              "Share your thoughts, suggestions, or report an issue...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.purple,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: feedbackController.text.trim().isEmpty
                            ? null
                            : () {
                                // ✅ Close keyboard
                                FocusScope.of(context).unfocus();

                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Feedback submitted!"),
                                  ),
                                );
                                feedbackController.clear();
                                setState(() {
                                  rating = 0;
                                  selectedCategory = null;
                                });
                              },
                        child: const Text(
                          "Submit Feedback",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Text(
                          "Your feedback helps us create a better experience for everyone",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _ratingLabel() {
    switch (rating) {
      case 1:
      case 2:
        return "Poor";
      case 3:
        return "Good";
      case 4:
        return "Very Good";
      case 5:
        return "Excellent";
      default:
        return "";
    }
  }
}
