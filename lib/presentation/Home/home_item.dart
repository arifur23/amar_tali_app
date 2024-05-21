import 'package:flutter/material.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
  super.key,
  required this.size, required this.firstColor, required this.secondColor, required this.child, required this.title, required this.icon,
  });

  final Size size;
  final Color firstColor;
  final Color secondColor;
  final Widget child;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * .21,
      width: size.height * .2,
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(18),
          gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                firstColor,
                secondColor
              ]
          )
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (_){
            return child;
          }));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Icon(icon, color: Colors.blueAccent,)),
              const SizedBox(height: 10,),

              const SizedBox(height: 5,),
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: Colors.white)),
              const SizedBox(height: 15,),
              const Text('Tap to View', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}