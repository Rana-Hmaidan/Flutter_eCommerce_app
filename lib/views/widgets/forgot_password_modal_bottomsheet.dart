import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';

class ForgotPasswordModalBottomsheet extends StatefulWidget {

  final String userEmail;
  const ForgotPasswordModalBottomsheet({super.key, required this.userEmail});

  @override
  State<ForgotPasswordModalBottomsheet> createState() => _ForgotPasswordModalBottomsheetState();
}

class _ForgotPasswordModalBottomsheetState extends State<ForgotPasswordModalBottomsheet> {

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _emailController;
  late FocusNode _emailFocusNode;

  // ignore: unused_field
  String? _email;

  @override
  void initState(){
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _emailFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0,),
              Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8.0,),
              Text(
                'Enter your email',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 36.0,),
              Text(
                'Email',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextFormField(
                        controller: _emailController,
                        onChanged: (value) => _email = value,
                        keyboardType: TextInputType.emailAddress,
                        focusNode: _emailFocusNode,
                        textInputAction: TextInputAction.next,
                        onEditingComplete: (){
                          _emailFocusNode.unfocus();
                        },
                        validator: (value){
                          if(value == null || value.isEmpty){
                            return 'Please enter your email';
                          }else if(!value.contains('@')){
                            return 'Please enter a valid email';
                          }else{
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: widget.userEmail.isEmpty ? 'Enter your email' : widget.userEmail,
                          prefixIcon: const Icon(Icons.email),
                          prefixIconColor: widget.userEmail.isEmpty ? AppColors.grey : Theme.of(context).colorScheme.primary,
                        ),
                      ),
              ),
                    const SizedBox(height: 36.0,),
                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          foregroundColor: AppColors.white,
                        ), 
                        child: Text(
                          'Send Code',
                          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                            color: AppColors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                ],
          ),
        ),
      ),
    );
  }
}