import 'package:flutter/material.dart';
import 'package:VitalityTracker/controllers/StepCounterController.dart';

class Entries extends StatelessWidget {
  final StepCounterController controller = StepCounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0x00ffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
        ),
        title: Text(
          "Entries",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            fontSize: 20,
            color: Color(0xff000000),
          ),
        ),
        leading: Icon(
          Icons.home,
          color: Color(0xff212435),
          size: 24,
        ),
        actions: [
          Icon(Icons.done, color: Color(0xff212435), size: 24),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Color(0x00ffffff),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
            border: Border.all(color: Color(0x4dffffff), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                child: Text(
                  "Steps & Status",
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 18,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(12),
                width: MediaQuery.of(context).size.width * 0.7000000000000001,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Color(0xffe4e7e9),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Color(0x4d9e9e9e), width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StreamBuilder<String>(
                      stream: controller.stepCountStream.map((event) => event.steps.toString()),
                      initialData: '?',
                      builder: (context, snapshot) {
                        return Text(
                          "Steps: ${snapshot.data ?? ''}",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20, // Adjusted font size
                            color: Color(0xff000000),
                          ),
                        );
                      },
                    ),
                    StreamBuilder<String>(
                      stream: controller.pedestrianStatusStream.map((event) => event.status),
                      initialData: '?',
                      builder: (context, snapshot) {
                        return Text(
                          "${snapshot.data ?? ''}",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 20, // Adjusted font size
                            color: Color(0xff000000),
                          ),
                        );
                      },
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
}

void main() {
  runApp(MaterialApp(
    home: Entries(),
  ));
}
