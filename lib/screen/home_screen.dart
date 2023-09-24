import 'package:chat_ui/model/userModel.dart';
import 'package:chat_ui/screen/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserModel> userModelLst = [
    UserModel(
      image:
          "https://images.squarespace-cdn.com/content/v1/58865912a5790a87a29447e5/1501777422700-0WW6HYF16XLP8ZTJ0PMU/Image+Profile+Photography2.jpg",
      name: "جواد",
      description: "خوبی؟",
      mmsgCount: "5",
    ),
    UserModel(
      image: "https://www.soorban.com/images/news/2021/09/1632295539_K8aY6.jpg",
      name: "عاطفه",
      description: "سلام",
      mmsgCount: "7",
    ),
    UserModel(
      image:
          "https://www.tasvirezendegi.com/wp-content/uploads/2021/01/best-profile-picture-for-girl-25.jpg",
      name: "زهرا",
      description: "فلاتر فارسی",
      mmsgCount: "8",
    ),
    UserModel(
      image: "https://thinksport.com.au/wp-content/uploads/2020/01/avatar-.jpg",
      name: "Y4CN",
      description: "FlutterFarsi.com",
      mmsgCount: "15",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Text(
                  "Chats",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: TextField(
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: "Search",
                    filled: true,
                    fillColor: Colors.black12,
                    prefixIcon: const Icon(CupertinoIcons.search),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 15),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: userModelLst.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  ChatScreen(
                            userModel: userModelLst[index],
                          ),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(userModelLst[index].image),
                    ),
                    title: Text(
                      userModelLst[index].name,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle:  Text(userModelLst[index].description),
                    trailing: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade500.withOpacity(.8),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child:  Text(
                        userModelLst[index].mmsgCount,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
