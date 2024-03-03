
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool containerVisible = true;
  

  void toggleContainerVisibility() {
    setState(() {
      containerVisible = !containerVisible;
    });
  }

 bool sendmessage = false;
  void sendtoggle() {
    setState(() {
      sendmessage = !sendmessage;
    });
  }
  
 bool messageReceived = false;

  void NFCmessageReceived() { //If Message Received through NFC call this function     
    // contact = //Add contact details
      
    setState(() {
      messageReceived = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text(
                'NFC Social Exchange',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     toggleContainerVisibility();
              //     sendtoggle();                 

              //   },
              //   child: Text(
              //     'Send',
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
              SizedBox(width: 10.0),
              // ElevatedButton(
              //   onPressed: () {
              //     toggleContainerVisibility();
              //     NFCmessageReceived();
              //   },
              //   child: Text(
              //     'Receive',
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
            ],
          ),
          FractionallySizedBox(
            widthFactor: 1.0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainerWidget(
                isVisible: containerVisible, 
                finalmessageReceived: messageReceived, 
                finalsendmessage: sendmessage,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedContainerWidget extends StatelessWidget {
  final bool isVisible;
  final bool finalsendmessage;
  final bool finalmessageReceived;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phoneNumber = '';
  String _email = '';
  String _githubRepo = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _githubController = TextEditingController();

  


  AnimatedContainerWidget({required this.isVisible, required this.finalmessageReceived, required this.finalsendmessage});

  @override
  Widget build(BuildContext context) {
    
  return Container(
      padding: EdgeInsets.all(16), // Add padding around the container
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) => _name = value!,
                validator: (value) => value!.isEmpty ? 'Please enter your name' : null,
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) => _phoneNumber = value!,
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Please enter your phone number' : null,
              ),
              TextFormField(
                controller:_emailController,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) => _email = value!,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => value!.isEmpty ? 'Please enter your email' : null,
              ),
              TextFormField(
                controller: _githubController,
                decoration: InputDecoration(labelText: 'GitHub Repo'),
                onSaved: (value) => _githubRepo = value!,
                validator: (value) => value!.isEmpty ? 'Please enter your GitHub repository URL' : null,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      //add funcio
                                         
                      }
                  },
                  child: Text('Share'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

      }
    


                  
    // return AnimatedContainer(
    //   duration: Duration(milliseconds: 500),
    //   height: isVisible ? 350.0 : 0,
    //   width: isVisible ? 300.0 : 0,
    //   curve: Curves.easeInOut,
    //   decoration: BoxDecoration(
    //     color: Colors.white,
    //     borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(20.0),
    //       topRight: Radius.circular(20.0),
    //     ),
    //     boxShadow: [
    //       BoxShadow(
    //         color: Colors.grey.withOpacity(0.5),
    //         spreadRadius: 5,
    //         blurRadius: 7,
    //         offset: Offset(0, 3), // changes position of shadow
    //       ),
    //     ],
    //   ),
    //   padding: EdgeInsets.all(20.0),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,

    //     children: [Text(
    //           finalmessageReceived ? 'Received' : 'Scanning NFC tag',
    //           style: TextStyle(
    //             color: Colors.black,
    //             fontSize: 20.0,
    //             fontWeight: FontWeight.bold,
    //           ),
    //         ),
    //     SizedBox(height: 20.0),
        
    //       Image.asset('assets/images/phone.png', // image path
    //         width: 70, // Adjust width as needed
    //         height: 70, // Adjust height as needed
    //         fit: BoxFit.cover,
    //       ),
                    
    //     // CircularProgressIndicator(
    //     //         color: Color.fromARGB(255, 70, 165, 73),
    //     //         strokeWidth: 3,
    //     //         // semantics: true,
    //     //         // scale: 1.5,
    //     //       ),
    //     ],
    //   ),

    
}





