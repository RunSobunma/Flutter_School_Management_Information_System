import 'package:flutter/material.dart';
import 'package:smis_mobile/core/constants/app_constants.dart';
import 'package:smis_mobile/core/theme/app_colors.dart';
import 'package:smis_mobile/core/theme/app_size.dart';
import 'package:smis_mobile/core/theme/app_text_styles.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEditing = false;

  Map infor = {
    "id": "000023442",
    "firstName": "Sobunma",
    "lastName": "Run",
    "dateOfBirth": "24/03/2005",
    "gender": "Male",
    "phone": "0999999999",
  };

  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController phoneController;
  late final TextEditingController emailController;
  late final TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController(text: infor["firstName"]);
    lastNameController = TextEditingController(text: infor["lastName"]);
    phoneController = TextEditingController(text: infor["phone"]);
    emailController = TextEditingController(text: "runsobunma10@gmail.com");
    dobController = TextEditingController(text: infor["dateOfBirth"]);
    selectedDate = DateTime(selectedyear(), selectedmonth(), selectedday());
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    dobController.dispose();
    super.dispose();
  }

  int selectedyear() {
    return int.parse(dobController.text.split("/")[2]);
  }

  int selectedmonth() {
    return int.parse(dobController.text.split("/")[1]);
  }

  int selectedday() {
    return int.parse(dobController.text.split("/")[0]);
  }

  String gender = "Male";
  DateTime? selectedDate;

  Future<void> _pickDate() async {
    DateTime initialDate = selectedDate ?? DateTime(2000);
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1970),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dobController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
    }
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  void _updateProfile() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile updated successfully!")),
    );
    setState(() {
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   backgroundColor: AppColors.background,
      //   elevation: 0,
      //   title: Image.asset(
      //     "${AppConstants.imagesPath}Rupp_logo.png",
      //     height: 35,
      //   ),
      //   actions: [
      //     Row(
      //       children: [
      //         Image.asset(
      //           "${AppConstants.iconsPath}feedback.png",
      //           width: 30,
      //           color: AppColors.textPrimary,
      //         ),
      //         const SizedBox(width: 8),
      //         Stack(
      //           children: [
      //             Image.asset(
      //               "${AppConstants.iconsPath}notification.png",
      //               width: 30,
      //             ),
      //             Positioned(
      //               right: 0,
      //               top: 2,
      //               child: Container(
      //                 width: 18,
      //                 height: 18,
      //                 decoration: BoxDecoration(
      //                   color: Colors.red,
      //                   borderRadius: BorderRadius.circular(20),
      //                 ),
      //                 child: const Center(
      //                   child: Text(
      //                     '99+',
      //                     style: TextStyle(
      //                       color: Colors.white,
      //                       fontSize: 7,
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         const SizedBox(width: 15),
      //       ],
      //     ),
      //   ],
      // ),
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
              title: Text(
                "My Profile",
                style: AppTextStyles.heading,
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: _toggleEdit,
                  icon: Icon(
                    isEditing ? Icons.close_rounded : Icons.edit_rounded,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),

            // 🔥 Divider under AppBar
            // const Divider(
            //   color: Color.fromARGB(255, 214, 213, 213),
            //   thickness: 2,
            //   height: 0,
            // ),
          ],
        ),
      ),

      // body
      body: Column(
        children: [
          const SizedBox(height: 10),

          // Header
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     IconButton(
          //       onPressed: () => Navigator.pop(context),
          //       icon: Icon(
          //         Icons.arrow_back_rounded,
          //         color: AppColors.textPrimary,
          //       ),
          //     ),
          //     Text(
          //       "My Profile",
          //       style: TextStyle(
          //         fontSize: AppSizes.textMedium,
          //         fontWeight: FontWeight.bold,
          //         color: AppColors.textPrimary,
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: _toggleEdit,
          //       icon: Icon(
          //         isEditing ? Icons.close_rounded : Icons.edit_rounded,
          //         color: AppColors.textPrimary,
          //       ),
          //     ),
          //   ],
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingMedium,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),

                    // Profile Avatar
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 59,
                          backgroundColor: AppColors.textWhite,
                          child: CircleAvatar(
                            radius: 55,
                            backgroundImage: AssetImage(
                              "${AppConstants.devImagesPath}dev1.jpg",
                            ),
                          ),
                        ),
                        if (isEditing)
                          Positioned(
                            bottom: 10,
                            right: 5,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera_alt_rounded,
                                    color: AppColors.textWhite,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "ID: ${infor["id"]}",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Personal Information
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Personal Information",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.textMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: firstNameController,
                      enabled: isEditing,
                      decoration: const InputDecoration(
                        labelText: "First Name",
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: lastNameController,
                      enabled: isEditing,
                      decoration: const InputDecoration(labelText: "Last Name"),
                    ),
                    const SizedBox(height: 8),

                    // Date of Birth field with picker
                    GestureDetector(
                      onTap: isEditing ? _pickDate : null,
                      child: AbsorbPointer(
                        child: TextField(
                          controller: dobController,
                          enabled: isEditing,
                          decoration: const InputDecoration(
                            labelText: "Date of Birth",
                            suffixIcon: Icon(Icons.calendar_today),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Gender selection (dot style)
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: isEditing
                                ? () => setState(() => gender = "Male")
                                : null,
                            child: Row(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isEditing
                                          ? AppColors.textDarkGrey
                                          : AppColors.textSecondary,
                                      width: 2,
                                    ),
                                    color: gender == "Male"
                                        ? AppColors.textPrimary
                                        : Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "Male",
                                  style: TextStyle(
                                    color: isEditing
                                        ? AppColors.textDarkGrey
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: isEditing
                                ? () => setState(() => gender = "Female")
                                : null,
                            child: Row(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isEditing
                                          ? AppColors.textDarkGrey
                                          : AppColors.textSecondary,
                                      width: 2,
                                    ),
                                    color: gender == "Female"
                                        ? AppColors.textDarkGrey
                                        : Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "Female",
                                  style: TextStyle(
                                    color: isEditing
                                        ? AppColors.textDarkGrey
                                        : AppColors.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Row(
                    //   children: [
                    //     Expanded(
                    //       child: ChoiceChip(
                    //         label: const Text("Male"),
                    //         selected: gender == "Male",
                    //         onSelected: isEditing
                    //             ? (val) => setState(() => gender = "Male")
                    //             : null,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Expanded(
                    //       child: ChoiceChip(
                    //         label: const Text("Female"),
                    //         selected: gender == "Female",
                    //         onSelected: isEditing
                    //             ? (val) => setState(() => gender = "Female")
                    //             : null,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 20),

                    // Contact Detail
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Contact Detail",
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: AppSizes.textMedium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: phoneController,
                      style: TextStyle(
                        color: isEditing
                            ? AppColors.textPrimary
                            : AppColors.textSecondary,
                      ),
                      enabled: isEditing,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: emailController,
                      enabled: isEditing,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email Address",
                      ),
                    ),

                    const SizedBox(height: 20),

                    if (isEditing)
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton.icon(
                          onPressed: _updateProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusCircular,
                              ),
                            ),
                          ),
                          icon: const Icon(Icons.save, color: Colors.white),
                          label: const Text(
                            "Save Changes",
                            style: TextStyle(
                              fontSize: AppSizes.textSmall,
                              color: AppColors.textWhite,
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
