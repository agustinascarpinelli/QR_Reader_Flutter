import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/utils/utils.dart';

import '../providers/scans_provider.dart';

class ScansList extends StatelessWidget {
  final String type;
 
  
 
  const ScansList({super.key, required this.type});
  

  @override
  Widget build(BuildContext context) {
    final scansProvider=Provider.of<ScansProvider>(context);
    final scans=scansProvider.scans;
    return scansProvider.isLoading!=true ? 
    
  
    Scaffold(
        
      body: scans.isNotEmpty? ListView.builder(
        itemCount: scans.length,
        itemBuilder: (_,i)=>Dismissible(
          key:UniqueKey(),
          background: Container(
            color: Colors.deepOrange,
          ),
          onDismissed: (DismissDirection){
          final scansProvider=Provider.of<ScansProvider>(context,listen: false);
          scansProvider.deleteScanByid(scans[i].id!);
          },
          child: ListTile(
           leading: Icon(
            type=='http'?
            Icons.home_max_outlined
            :
            Icons.map,
            color: Colors.deepPurple,),
           title:Text(scans[i].value),
           subtitle: Text('Id:${scans[i].id}'),
           trailing: const Icon(Icons.keyboard_arrow_right,color: Colors.white,),
           onTap: ()=>launchUrl(context ,scans[i]),
          ),
        ),
      )
:
   
    Center(child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children:  [
         const Icon(
             Icons.warning,color: Colors.deepOrange,),
            type=='http'?
        const Text("There's no directions added")
          : const Text("There's no maps added")
           ],
         )
         ),
          
       )
    
 

     :
   const Center(
      child: CircularProgressIndicator(

      ),
    );


  }
}