import 'package:flutter/cupertino.dart';
import 'package:qr_reader/models/scan_model.dart';
import 'package:url_launcher/url_launcher_string.dart';


launchUrl(BuildContext context,ScanModel scan)async{
 final String urls=scan.value;
 final Uri url = Uri.parse(urls);




    if(scan.type=='http'){
      await launchUrlString(urls);
    if(!await launchUrlString(urls)){
     }
  
//   if (await canLaunch(urls)) {
//     await launch(urls);
//   } else{
//     print('Could not launch ${url}');
//   }
 }else{
  Navigator.pushNamed(context,'maps',arguments: scan);
 }
  
}