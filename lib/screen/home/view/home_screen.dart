import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rendom/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvidert;
  HomeProvider? homeProviderf;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).JsonParsing();
  }

  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context, listen: false);
    homeProvidert = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Rendom api"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(
                onPressed: () {
                  homeProviderf!.JsonParsing();
                },
                child: Text('Rendomcall'),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.grey.shade900)),
              ),
            )
          ],
        ),
        body: (homeProviderf!.homeModal == null)
            ? Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  color: Colors.grey.shade900,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              '${homeProviderf!.homeModal!.results![0].picture!.medium}'),
                          maxRadius: 75),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${homeProviderf!.homeModal!.results![0].name!.title} ${homeProviderf!.homeModal!.results![0].name!.first} ${homeProviderf!.homeModal!.results![0].name!.last}',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(onTap: () {
                            homeProviderf!.ChangeIndex(0);
                          },child: Column(
                            children: [
                              Text("Profile",style: TextStyle(color: Colors.white,fontSize: 20),),
                              SizedBox(height: 2,),
                              Container(
                                height: 2,
                                width: 45,
                                color: (homeProviderf!.i==0)?Colors.white:Colors.black,
                              ),
                            ],
                          )),
                          InkWell(onTap: () {
                            homeProviderf!.ChangeIndex(1);
                          },child: Column(
                            children: [
                              Text("Contacts",style: TextStyle(color: Colors.white,fontSize: 20),),
                              SizedBox(height: 2,),
                              Container(
                                height: 2,
                                width: 60,
                                color: (homeProviderf!.i==1)?Colors.white:Colors.black,
                              ),
                            ],
                          )),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(height: 1,color: Colors.grey.shade900,),
                      IndexedStack(
                        index: homeProvidert!.i,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text("Name : ${homeProviderf!.homeModal!.results![0].name!.title} ${homeProviderf!.homeModal!.results![0].name!.first} ${homeProviderf!.homeModal!.results![0].name!.last}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Gender : ${homeProviderf!.homeModal!.results![0].gender}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Age : ${homeProviderf!.homeModal!.results![0].dob!.age}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Date : ${(homeProviderf!.homeModal!.results![0].dob!.date).toString().substring(0,10)}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Registered Date : ${(homeProviderf!.homeModal!.results![0].registered!.date).toString().substring(0,10)}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Registered Age : ${homeProviderf!.homeModal!.results![0].registered!.age}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                Text("Adress : ${homeProviderf!.homeModal!.results![0].location!.street!.number!} - ${homeProviderf!.homeModal!.results![0].location!.street!.name!},  ${homeProviderf!.homeModal!.results![0].location!.city},  ${homeProviderf!.homeModal!.results![0].location!.state},  ${homeProviderf!.homeModal!.results![0].location!.country}",style: TextStyle(color: Colors.white,fontSize: 20),),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10,),
                                Text("Phone : ${homeProviderf!.homeModal!.results![0].phone}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Cell : ${homeProviderf!.homeModal!.results![0].cell}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                SizedBox(height: 5,),
                                Text("Email : ${homeProviderf!.homeModal!.results![0].email}",style: TextStyle(color: Colors.white,fontSize: 20),),
                                ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
