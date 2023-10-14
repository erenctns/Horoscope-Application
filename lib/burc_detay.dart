import 'package:flutter/material.dart';
import 'package:flutter_burc_proje/model/burc.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color arkaPlanRengi=Colors.transparent;
  late PaletteGenerator _generator,_generator2;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    basginRengiBul();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: arkaPlanRengi,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            backgroundColor:arkaPlanRengi,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset("images/"+widget.secilenBurc.burcBuyukResim,fit: BoxFit.cover),
            title: Text(widget.secilenBurc.burcAdi+"Burcu Ve Ozellikleri"),
            centerTitle: true),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Text(widget.secilenBurc.burcDetayi,
                style: TextStyle(color: Colors.white,fontSize:22 ),
                )
              ),
            ),
          ),
          
        ],
      ),
    );
  }
  
  void basginRengiBul()async {
    _generator=await PaletteGenerator.fromImageProvider(AssetImage("images/${widget.secilenBurc.burcBuyukResim}"));
    setState(() {
      arkaPlanRengi=_generator.dominantColor!.color;
    });
  }
}