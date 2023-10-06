import 'package:flutter/material.dart';
import 'package:viacepback4app/components/card.dart';
import 'package:viacepback4app/model/cep_back4app_model.dart';
import 'package:viacepback4app/model/via_cep_model.dart';
import 'package:viacepback4app/repository/back4app_repository.dart';

class listPage extends StatefulWidget {
  const listPage({super.key});

  @override
  State<listPage> createState() => _listPageState();
}

class _listPageState extends State<listPage> {

  CepBack4AppRepository cepBack4AppRepository = CepBack4AppRepository();
  var _cepList = CepBack4AppModel([]);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    _cepList = await cepBack4AppRepository.getAllCep();
    setState(() { });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Padding(
            padding: const EdgeInsets.only(top: 30),
            //results vem do Json que é envolvido dentro do objeto chamado results do back4app
            child: _cepList.results.isEmpty
                ?  const Center(child: Text("Lista Vazia"))
                :  ListView.builder(
                reverse: true,
                shrinkWrap: true,
                itemCount: _cepList.results.length,
                itemBuilder: (context, index) {

                  var cepItem = _cepList.results[index];

                  return cepCard(cepItem: cepItem);

                }
            )
        )

    );
  }
}
