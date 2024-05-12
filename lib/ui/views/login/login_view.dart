import 'package:elia_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 27,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                TextField(
                  onTap: () {
                    viewModel.setFocus(Type.email, context);
                  },
                  focusNode: viewModel.emailFocusNode,
                  cursorColor: AppColors.secondary,
                  onChanged: (value) {
                    viewModel.validateForm();
                  },
                  controller: viewModel.emailController,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      color: viewModel.emailFocus
                          ? AppColors.secondary
                          : AppColors.midnight70,
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  onTap: () {
                    viewModel.setFocus(Type.password, context);
                  },
                  focusNode: viewModel.passFocusNode,
                  cursorColor: AppColors.secondary,
                  obscureText: true,
                  onChanged: (value) {
                    viewModel.validateForm();
                  },
                  controller: viewModel.passController,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Color(0xFF393939),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        color: viewModel.passFocus
                            ? AppColors.secondary
                            : AppColors.midnight70),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xFF837E93),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    width: 329,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: viewModel.isFormValid
                          ? () {
                              print('Saad');
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                      ),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // Row(
                //   children: [
                //     const Text(
                //       'Don’t have an account?',
                //       style: TextStyle(
                //         color: Color(0xFF837E93),
                //         fontSize: 13,
                //         fontFamily: 'Poppins',
                //         fontWeight: FontWeight.w500,
                //       ),
                //     ),
                //     const SizedBox(
                //       width: 2.5,
                //     ),
                //     InkWell(
                //       onTap: (viewModel.emailController.text.isNotEmpty &&
                //               viewModel.passController.text.isNotEmpty)
                //           ? () {

                //             }
                //           : null,
                //       child: const Text(
                //         'Sign Up',
                //         style: TextStyle(
                //           color: Color(0xFF755DC1),
                //           fontSize: 13,
                //           fontFamily: 'Poppins',
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 15,
                // ),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
