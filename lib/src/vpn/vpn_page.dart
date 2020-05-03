import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vpn/src/app_assets.dart';
import 'package:vpn/src/vpn/vpn_server_dropdown.dart';
import 'package:vpn/src/vpn/vpn_status_widget.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';


class VpnPage extends StatefulWidget {
  @override
  _VpnPageState createState() => _VpnPageState();
}

class _VpnPageState extends State<VpnPage> {
  bool isConnected = false;
  String buttonText = 'Connect Now';
  String statusLabel = 'Disconnected';
  Color statusColor = Colors.grey;
  int sec=00,min=00,hour=00;
  String seco="00",mino="00";
  Timer t;

  _buildCard({Config config, Color backgroundColor = Colors.transparent}) {
    return Container(
      padding: EdgeInsets.all(0),
      color: Colors.transparent,
      height: 72.0,
      width: double.infinity,
      child: Card(
        color: backgroundColor,
        elevation: 32.0,
        clipBehavior: Clip.antiAlias,
        child: WaveWidget(
          config: config,
          backgroundColor: backgroundColor,
          size: Size(double.infinity, double.infinity),
          waveAmplitude: 0,
        ),
      ),
    );
  }

  void  Starttimer() async{
   Timer.periodic(Duration(seconds: 1), (t){
     if(isConnected){
    sec++;
     if(sec%60==0){
       min++;
       sec=0;
     }
     if(min%60==0){
       hour++;
       min=0;
     }
     setState(() {
       if(sec<10){
         seco="0"+sec.toString();
       }else{
         seco=sec.toString();
       }
       if(min<10){
         mino="0"+min.toString();
       }else{
         mino=min.toString();
       }
     });
     }else{
       t.cancel();
       setState(() {
         min=0;
         sec=0;
       });
     }
   });
  }

  onConnect() {
    setState(() {
      isConnected = !isConnected;
      buttonText = isConnected ? 'Disconnect' : 'Connect Now';
      statusLabel = isConnected ? 'Connected' : 'Disconnected';
      statusColor = isConnected ? Colors.green : Colors.grey;
      if(isConnected){
        Starttimer();
      }else{
        Starttimer();
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 30,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 20,),
            Image(
              height: 100,
              image: AssetImage("assets/images/logo3.png"),
            ),
            SizedBox(height: 40,),
            ListTile(
              title: Text("Servers List",style: TextStyle(fontSize: 24),),
              trailing: Icon(Icons.settings,color: Colors.black,),
            ),
            ListTile(
              title: Text("Settings",style: TextStyle(fontSize: 24),),
              trailing: Icon(Icons.settings,color: Colors.black,),
            ),
            ListTile(
              title: Text("About",style: TextStyle(fontSize: 24),),
              trailing: Icon(Icons.settings,color: Colors.black,),
            ),

          ],
        ),
      ),
      appBar: AppBar(
        elevation: 22,
        backgroundColor: Colors.blue[300],
        title: Text(
          'INiesta VPN',
          style: GoogleFonts.tradeWinds(color: Colors.black,letterSpacing: 5,fontSize: 24 ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          VpnServerDropDown(),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child:
                      VpnStatus(label: statusLabel, statusColor: statusColor),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Image.asset(isConnected ? AppAssets.online : AppAssets.offline),
                SizedBox(
                  height: 20.0,
                ),
                Text("00:$mino:$seco",style: GoogleFonts.lato(fontSize: 22),),
                SizedBox(
                  height: 20.0,
                ),
                MaterialButton(
                  minWidth: 200.0,
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: isConnected
                          ? BorderSide(color: Colors.black)
                          : BorderSide(color: Colors.transparent)),
                  color: isConnected ? Colors.white : Theme.of(context).primaryColor,
                  textColor: isConnected ? Colors.black : Colors.white,
                  onPressed: () => {onConnect()},
                  child: Text(buttonText.toUpperCase()),
                ),
              ],
            ),
          ),
          Container(
            child:_buildCard(
              config: CustomConfig(
                gradients: [
                  [Colors.blue[200], Color(0xEEF44336)],
                  [Colors.blue[800], Color(0x77E57373)],
                  [Colors.blue[200], Colors.blueGrey],
                  [Colors.blue[800], Colors.lightBlueAccent[200]]
                ],
                durations: [35000, 19440, 10800, 6000],
                heightPercentages: [0.20, 0.23, 0.25, 0.30],
                gradientBegin: Alignment.bottomLeft,
                gradientEnd: Alignment.topRight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
