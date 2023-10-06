import 'package:flutter/material.dart';

import '../model/cep_back4app_model.dart';

class detailPage extends StatefulWidget {
  const detailPage({super.key, this.cepItem});

  final cepItem;

  @override
  State<detailPage> createState() => _detailPageState();
}

class _detailPageState extends State<detailPage> {

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
    return Scaffold(

      appBar: AppBar(title: const Text("Detalhes")),

      body: Center(
        child: Column(

          children: [
            const SizedBox(height: 20),

            Card(
              elevation: 50,
              shadowColor: Colors.black,

              child: SizedBox(
                width: 350,
                height: 575,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(

                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rua: ${cepInfo.logradouro}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),

                            const Padding( padding: EdgeInsets.symmetric(vertical: 16.0), child: Divider()),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Cep: ${cepInfo.cep}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                                Text("Uf: ${cepInfo.uf}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                              ],
                            ),

                            const Padding( padding: EdgeInsets.symmetric(vertical: 12.0), child: Divider()),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Bairro: ${cepInfo.bairro}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                Text("DDD: (${cepInfo.ddd})", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                              ],
                            ),

                            const Padding( padding: EdgeInsets.symmetric(vertical: 12.0), child: Divider()),

                            Text("Bairro: ${cepInfo.localidade}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),

                          ],
                        ),
                      ),

                      //SizedBox
                    ],
                  ), //Column
                ), //Padding
              ), //SizedBox
            ),




          ],
        ),
      ),
    );

  }
}
