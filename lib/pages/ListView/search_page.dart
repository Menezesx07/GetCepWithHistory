import 'package:flutter/material.dart';

import '../../model/via_cep_model.dart';
import '../../repository/via_cep_repository.dart';

class searchPage extends StatefulWidget {
  const searchPage({super.key});

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {

  var cep = "";

  var cepController = TextEditingController(text: "");
  bool loading = false;
  var viaCepModel = ViaCepModel();
  var viaCepRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(

          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
          child: Column(
            children: [

              const SizedBox(height: 10),


              const Text("Consulta de Cep", style: TextStyle(fontSize: 22)),

              const SizedBox(height: 40),

              TextField(
                controller: cepController,
                maxLength: 8,
                keyboardType: TextInputType.number,
                onChanged: (String value) async {
                  //RegExp remove tudo que é simbolo, dexando vazio '', pegando só os numeros
                  cep = value.trim().replaceAll(RegExp(r'[^0-9]'), '');
                },
              ),


              FilledButton(onPressed: () async {

                if(cep.length == 8) {
                  setState(() {
                    loading = true;
                  });

                  viaCepModel = await viaCepRepository.getCep(cep);

                }
                setState(() {
                  loading = false;
                });

              }, child: const Text("Pesquisar")),


              const SizedBox(height: 50),
              Text(viaCepModel.logradouro ?? "",
                  style: const TextStyle(fontSize: 22)),
              Text("${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}",
                  style: const TextStyle(fontSize: 22)),

              Visibility(
                  visible: loading,
                  child: const CircularProgressIndicator()
              ),

            ],
          ),
        ),

    );

  }
}
