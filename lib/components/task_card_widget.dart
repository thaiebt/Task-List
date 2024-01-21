import 'package:flutter/material.dart';
import 'difficulty_widget.dart';

// ignore: must_be_immutable
class TaskCardWidget extends StatefulWidget {
  final String taskTitle;
  final int dificult;
  final String image;
  TaskCardWidget({super.key, required this.taskTitle, required this.dificult, required this.image});

  int level = 0;

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {

  bool isAssetImage() {
    if (widget.image.contains("http")) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)), 
              color: Colors.white),
            height: 100,  
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: Colors.black26),
                  width: 72, 
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: isAssetImage() ? 
                      Image.asset(widget.image, fit: BoxFit.cover) : 
                      Image.network(widget.image, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 72 - 60 - 32, 
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.taskTitle, 
                          style: const TextStyle(fontSize: 18), 
                          textAlign: TextAlign.left),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: DifficultyWidget(difficult: widget.dificult,),
                        )
                      ],
                    ),
                  )),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          if (widget.level < (widget.dificult) * 10) {
                            widget.level++;
                          }
                        });
                      }, 
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_drop_up),
                          Text("Llv up", textAlign: TextAlign.center)
                        ],
                      )
                    ),
                  ),
                )],
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.blue, 
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))),
            height: 40, 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      value: widget.dificult > 0 ? widget.level / widget.dificult / 10 : 1,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Nível ${widget.level}", 
                    style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )],
      ),
    );
  }
}