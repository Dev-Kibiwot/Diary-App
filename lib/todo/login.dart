import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}
  bool isSelected = false;
class _loginState extends State<login> {  
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  late Box box1;
  void createBox()async{
    box1 = await Hive.openBox("LoginData");
    getData();
  }
  void getData()async{
    if(box1.get(email) != null){
      email.text = box1.get(email);
      isSelected = true;
      setState(() {
        
      });      
    }
    if(box1.get(pass) != null){
      pass.text = box1.get(pass);
      isSelected = true;
      setState(() {
        
      });
    }
  }
  @override
  void initState(){
    super.initState();
    createBox();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size .height * 0.2,),
            Container(
              height: 80,
              width: 80,
              child: Image(image: AssetImage("assets/todo.png")
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size .width * 0.12
              ),
              child: TextFormField(            
                controller: email,  
                decoration: InputDecoration(  
                  suffixIcon: Icon(Icons.email),                
                  label: Text("E-mail"),                
                  border: OutlineInputBorder(      
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size .width * 0.12
              ),
              child: TextFormField(            
                controller: pass,  
                decoration: InputDecoration(  
                  suffixIcon: Icon(Icons.lock),                
                  label: Text("Password"),                
                  border: OutlineInputBorder(      
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:  EdgeInsets.only(
               left: 120
              ),
              child: Row(
                children: [
                  Text("Remember me"),
                  Checkbox(
                    value: isSelected, 
                    onChanged:(value){
                      setState(() {
                        isSelected = !isSelected;
                      });
                    }
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
               data();
              },
              child: Text("LogIn"),
            )
          ],
        ),
      ),
    );
  }
  void data(){
    if(isSelected == true){
      box1.put("Email", email.value.text);
      box1.put("Password", pass.value.text);
    }
  }
}