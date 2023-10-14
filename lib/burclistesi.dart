import 'package:flutter/material.dart';
import 'package:flutter_burc_proje/burc_item.dart';
import 'package:flutter_burc_proje/data/strings.dart';
import 'package:flutter_burc_proje/model/burc.dart';

class BurcListesi extends StatelessWidget {
  late List<Burc>tumBurclar;
   BurcListesi(){
    tumBurclar=veriKaynaginiHazirla();
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Burclar Listesi",style: TextStyle(),),
        ),
      ),
      body: Center(
      child:ListView.builder(itemBuilder: (context,index){
        return BurcItem(listelenenBurc: tumBurclar[index]);
      },itemCount: tumBurclar.length,),
    ),
    );
  }
  
    veriKaynaginiHazirla() {
    List<Burc>gecici=[];
    for(int i=0;i<12;i++){
      var burcAdi=Strings.BURC_ADLARI[i];
      var burcTarih=Strings.BURC_TARIHLERI[i];
      var burcDetay=Strings.BURC_GENEL_OZELLIKLERI[i];
      //koc1.png yi almaya calistim isimlerden Koc u koc a çevirdim sonra koc1.png yaptim
      var burcKucukResim=Strings.BURC_ADLARI[i].toLowerCase()+"${i+1}.png";
      //koc_buyuk1.png yi almaya calistim.
      var burcBuyukResim=Strings.BURC_ADLARI[i].toLowerCase()+"_buyuk"+"${i+1}.png";
      
      Burc eklenecekBurc=Burc(burcAdi,burcTarih,burcDetay,burcKucukResim,burcBuyukResim);
      gecici.add(eklenecekBurc);
    }
    return gecici;
  }
}