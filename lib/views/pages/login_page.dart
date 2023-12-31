import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecommerce_app/utils/app_colors.dart';
import 'package:flutter_ecommerce_app/utils/app_routes.dart';
import 'package:flutter_ecommerce_app/views/widgets/forgot_password_modal_bottomsheet.dart';
import 'package:flutter_ecommerce_app/views/widgets/social_item.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

 class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

    late final GlobalKey<FormState> _formKey;
    late final TextEditingController _emailController, _passwordController;
    late FocusNode _emailFocusNode, _passwordFocusNode;
    bool visibility = false;
    String? _email, _password;

  @override
  void initState(){
    _formKey = GlobalKey<FormState>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login(){
    // debugPrint('Email: ${_emailController.text}, Password: ${_passwordController.text}');
    debugPrint('Email: $_email, Password: $_password');
    if(_formKey.currentState!.validate()){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login Success!'),
        ),
      );
      Navigator.of(context).pushNamed(AppRoutes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24.0,),
                  Text(
                    'Login Account',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0,),
                  Text(
                    'Please, login with registered account',
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
                  TextFormField(
                    controller: _emailController,
                    onChanged: (value) => _email = value,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: _emailFocusNode,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: (){
                      _emailFocusNode.unfocus();
                      FocusScope.of(context).requestFocus(_passwordFocusNode);
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
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.email),
                      prefixIconColor: _emailController.text.isNotEmpty ? Theme.of(context).colorScheme.primary : AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 36.0,),
                  Text(
                    'Password',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12.0,),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !visibility,
                    onChanged: (value) => _password = value,
                    focusNode: _passwordFocusNode,
                    onEditingComplete: () {
                      _passwordFocusNode.unfocus();
                      login();
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.password),
                      prefixIconColor: _passwordController.text.isNotEmpty ? Theme.of(context).colorScheme.primary : AppColors.grey,
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            visibility = !visibility;
                          });
                        },
                        child: Icon(
                          visibility 
                          ? Icons.visibility_off
                          : Icons.visibility
                        ),
                      ),
                      suffixIconColor: AppColors.grey,
                    ),
                    validator: (value){
                      if(value == null || value.isEmpty){
                        return 'Please enter your password';
                      }else if(value.length<6){
                        return 'Password must be at least 6 characters';
                      }else{
                        return null;
                      }
                    },
                  ),
                  const SizedBox(height: 8.0,),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => showModalBottomSheet(
                        useSafeArea: true,
                        isScrollControlled: true,
                        context: context, 
                        builder: (ctx) => ForgotPasswordModalBottomsheet(userEmail: _emailController.text),
                      ),
                      child: Text(
                        'Forgot Password?',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0,),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () => login(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: AppColors.white,
                      ), 
                      child: Text(
                        'Login',
                        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Or using other methods:',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0,),
                  SocialItem(
                    icon: FontAwesomeIcons.google,
                    title: 'Login with Google',
                    color: AppColors.red,
                    onTap: (){},
                  ),
                  const SizedBox(height: 16.0,),
                  SocialItem(
                    icon: FontAwesomeIcons.facebookF,
                    title: 'Login with Facebook',
                    color: AppColors.blue,
                    onTap: (){},
                  ),
                  const SizedBox(height: 16.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.grey,
                        ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRoutes.createAccount);
                        }, 
                        child: Text(
                          'Create Account',
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 36.0,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}