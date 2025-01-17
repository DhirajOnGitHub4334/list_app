import 'package:flutter/material.dart';
import 'package:list_app/Screen/user_detail_screen.dart';

import '../Bloc/global_bloc.dart';
import '../Model/user_data_model.dart';
import '../Widget/user_list_widget.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key});

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  bool isLoading = false;

  List<UserVoterDataModel> userData = [];

  @override
  void initState() {
    super.initState();
    getcallToApi();
  }

  getcallToApi() async {
    setState(() {
      isLoading = true;
    });

    await globalBlock.doFetchUserData(
      id: 1,
      jsonrpc: "2.0",
      method: "bridge.get_ranked_posts",
    );

    setState(() {
      // userData.add(res);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                children: [
                  StreamBuilder<UserVoterDataModel>(
                    stream: globalBlock.getUserData.stream,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData || snapshot.data!.result.isEmpty) {
                        return const Expanded(
                          child: Center(
                            child: Text(
                              "No Data Found",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(
                            semanticsLabel: "Loading...",
                          ),
                        );
                      }

                      var result = snapshot.data!.result;

                      return Expanded(
                        child: ListView.builder(
                          itemCount: result.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return UserListWidget(
                              onTap: () {
                                clickOnParticularitem(result[index]);
                              },
                              author: result[index].author,
                              authorPayoutValue:
                                  result[index].authorPayoutValue,
                              authorReputation: result[index].authorReputation,
                              authorRole: result[index].authorRole!,
                              authorTitle: result[index].authorTitle!,
                              created: result[index].created,
                              title: result[index].title,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }

  void clickOnParticularitem(Result userData) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const UserDetailsScreen(),
        settings: RouteSettings(arguments: userData),
      ),
    );
  }
}
