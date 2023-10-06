import 'package:flutter/material.dart';
import 'package:viacepback4app/model/cep_back4app_model.dart';
import 'package:viacepback4app/pages/detail_page.dart';

class cepCard extends StatefulWidget {
  const cepCard({super.key, this.cepItem});

  final cepItem;

  @override
  State<cepCard> createState() => _cepCardState();
}

class _cepCardState extends State<cepCard> {

  CepItemInfo cepInfo = CepItemInfo();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCepInfo(widget.cepItem);
  }

  getCepInfo(cepItem) {
    cepInfo = cepItem;
    setState(() { });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Material(
        child: ListTile(
          //leading: cardImage,
          title:  Text(cepInfo.logradouro.toString() ,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          subtitle: Text("Cep: ${cepInfo.cep}", style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          trailing: Text("uf: ${cepInfo.uf}", style: const TextStyle(fontSize: 16),),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)),

          onTap: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => detailPage(cepItem: cepInfo)
              )
            );
          },

        ),
      ),
    );
  }
}
