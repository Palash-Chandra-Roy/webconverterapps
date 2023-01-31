import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:web_converter/Screen/Home/Home%20Controller/home_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
           var data = await _homeController.controller.canGoBack();
            if(data){
              await _homeController.controller.goBack();
            
            }else{
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text("Relly??"),
                      content: const Text("Do you went to Exit the app!"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toEnd(() => exit(0));
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                     },
                );
            }
              return false;
       },
      child: Scaffold(
        backgroundColor: const Color(0xFF27262D),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: const Color(0xFF202025),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          leading: IconButton(
              onPressed: () async {
                var data = await _homeController.controller.canGoBack();
                print(data);
                if (data) {
                  print("onwill goback");
                  _homeController.controller.goBack();
                }else{
                       showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.white,
                      title: const Text("Relly??"),
                      content: const Text("Do you went to Exit the app!"),
                      actions: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text(
                            "No",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.toEnd(() => exit(0));
                          },
                          child: const Text(
                            "Yes",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    );
                  },
                );
                }
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFFFFFFF),
              )),

          // title: Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 4.0),
          //   decoration: BoxDecoration(
          //       color: const Color(0xFFFFFFFF),
          //       borderRadius: BorderRadius.circular(12)),
          //   child: TextFormField(
          //     onChanged: (value) {

          //     },
          //     textAlignVertical: TextAlignVertical.center,
          //     decoration: const InputDecoration(
          //       hintText: "Search ",
          //       suffixIcon: Icon(Icons.search)
          //     ),
          //   ),

          // ),
          // actions: [
          //   IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          // ],
        ),
        body: Stack(children: <Widget>[
          WebViewWidget(controller: _homeController.controller),
          Positioned(
              child: Center(
            child: SizedBox(
              child: Obx(() => _homeController.loading.value
                  ? const CircularProgressIndicator()
                  : const SizedBox()),
            ),
          ))
        ]),
      ),
    );
  }
}
