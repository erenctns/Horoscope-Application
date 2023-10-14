import 'package:flutter/material.dart';
import 'package:flutter_burc_proje/burc_detay.dart';
import 'package:flutter_burc_proje/model/burc.dart';

class BurcItem extends StatelessWidget {
  final Burc listelenenBurc;
  //çağırdığında burcu kesin vermesi için böyle yaptım.
  const BurcItem({required this.listelenenBurc});

  @override
  Widget build(BuildContext context) {
    var myTextStyle=Theme.of(context).textTheme;
    return Card(
      elevation: 5,
      child:Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>BurcDetay(secilenBurc: listelenenBurc)));
          },
          leading: Image.asset("images/"+listelenenBurc.burcKucukResim),
          title: Text(listelenenBurc.burcAdi,
          style: myTextStyle.headlineSmall,),
          subtitle: Text(listelenenBurc.burcTarihi,
          style: myTextStyle.titleMedium,),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink,),
        ),
      ),
    );
  }
}