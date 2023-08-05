import 'package:flutter/material.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  final String email;
  final String name;
  final String password;
  final String confirmpassword;
  final String homeAddress;
  final String postcode;
  final String mobileNumber;

  SignUp({
    this.email = '',
    this.name = '',
    this.password = '',
    this.confirmpassword = '',
    this.homeAddress = '',
    this.postcode = '',
    this.mobileNumber = '',
  });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.text = widget.password;
    _confirmPasswordController.text = widget.confirmpassword;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Flutter Stepper Demo'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  type: stepperType,
                  physics: ScrollPhysics(),
                  currentStep: _currentStep,
                  onStepTapped: (step) => tapped(step),
                  onStepContinue: continued,
                  onStepCancel: cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Account'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Enter Name'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email Address'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              // Add more email validation if needed
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(labelText: 'Password'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              // Add more password validation if needed
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _confirmPasswordController,
                            decoration: InputDecoration(labelText: 'Confirm Password'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != _passwordController.text) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Address'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Home Address'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your home address';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Postcode'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your postcode';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Mobile Number'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Mobile Number'),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your mobile number';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                      isActive: _currentStep >= 0,
                      state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text("Already have an account?"),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to login page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text("Sign In"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep < 2) {
      setState(() => _currentStep += 1);
    } else {
      // If it's the last step, navigate to the login page
      if (_formKey.currentState!.validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    }
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
