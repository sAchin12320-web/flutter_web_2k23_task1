import 'package:flutter/material.dart';
import 'package:search_filter_app/model/member_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  static List<MemberModel> core_members_list = [
    MemberModel("Devatraj Bhattacharya", "GDSC", "president",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/devatraj_bhattacharjee.jpg"),
    MemberModel("Ritwik Singh", "GDSC", "project Lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/ritwik_singh_ipXx2VZ.jpg"),
    MemberModel("Sachin Kumar", "GDSC", "Event Lead",
        "https://lh3.googleusercontent.com/a/ACg8ocLiOZWhCaFDxr9s_8fQ8-5HLSnEuSqDhJsIOsSeZK4S9A=s432-c-no"),
    MemberModel("Jaspal Singh", "Flutter team", "Flutter Lead",
        "https://lh3.googleusercontent.com/a-/ALV-UjUsZhJZnm5UmRrtBWWREaSl7sI97S4selYn6bE-AGjloHU=s96-p-k-rw-no"),
    MemberModel("Ashutosh Bind", "Advanced Web team", " Advanced web lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/bind_parasnath.jpg"),
    MemberModel("Rohan Shetty", "AI/ML team", "AI/ML Lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/rohan_shetty_iqk9353.jpg"),
    MemberModel("Rahul Banavath", "Kotlin team", "Kotlin Lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/rahul_banavath.jpg"),
    MemberModel(
        "Ashish Patel",
        "Content and Media team",
        "Content and Media Lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/ashish_patel.jpeg"),
    MemberModel("Abhishek Agrahari", "Marketing team", "Marketing lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/abhishek_abhishek_7E3WWGH.jpg"),
    MemberModel("Rohan Choudhary", "Design team", "Design Lead",
        "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_250,q_auto:good,w_250/v1/gcs/platform-data-dsc/avatars/rohan_kumar_choudhary.jpg"),
  ];

  //creating list we are going to display and filter
  List<MemberModel> display_list = List.from(core_members_list);

  void updateList(String value) {
    // function to filter our list
    setState(() {
      display_list = core_members_list
          .where((element) =>
              element.member_name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1f1545),
      appBar: AppBar(
        backgroundColor: Color(0xff1f1545),
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "search for GDSC core members",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "eg: Jaspal Singh",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple.shade900,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: display_list.length == 0
                  ? Center(
                      child: Text(
                        "No Result Found",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: display_list.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(8.0),
                        title: Text(
                          display_list[index].member_name!,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          display_list[index].member_post!,
                          style: TextStyle(color: Colors.white60),
                        ),
                        trailing: Text(
                          display_list[index].member_team!,
                          style: TextStyle(color: Colors.amber),
                        ),
                        leading:
                            Image.network(display_list[index].member_pic_url!),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
