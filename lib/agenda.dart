import 'package:flutter/material.dart';
import 'package:agenda_medica/lista.dart';

class Agenda extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
  
class _HomeState extends State<Agenda> {

  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nomeController = TextEditingController();
  TextEditingController dataController = TextEditingController();
  TextEditingController horaController = TextEditingController();
  TextEditingController medicoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String _infoText = "Campos a serem Preenchidos";
  String nome;
  String data;
  String hora;
  String medico;
  String telefone;
  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agenda Medica"),
        centerTitle: true,
        backgroundColor: Colors.black26,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh),
            onPressed: () {
              _resetaValores();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildTextFormFieldNome(),
              buildTextFormFieldData(),
              buildTextFormFieldHora(),
              buildTextFormFieldMedico(),
              buildTextFormFieldTelefone(),
              buildTextFormFieldEmail(),
              buildContainerButtonAgendar(context),
              buildTextInfo(),
              buildContainerButtonListaAgendamento(context)
            ]
          )
        )
      )
    );
  }
 
  buildTextFormFieldNome(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nome",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 20.0
        ),
      ),
      style: TextStyle(fontSize: 30.0),
      controller: nomeController,
      validator: (value){
        if(value.isEmpty){
          return 'Informe seu Nome';
        }
        return null;
      }
    );
  }

  buildTextFormFieldData(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Data",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 30.0),
      controller: dataController,
      validator: (value){
        if(value.isEmpty){
          return 'Informe a Data';
        }
        return null;
      }
    );
  }

    buildTextFormFieldHora(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Hora",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 30.0),
      controller: horaController,
      validator: (value){
        if(value.isEmpty){
          return 'Informe a Hora';
        }
        return null;
      }
    );
  }

  buildTextFormFieldMedico(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Nome Medico",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 30.0),
      controller: medicoController,
      validator: (value){
        if(value.isEmpty){
          return 'Informe o Medico';
        }
        return null;
      }
    );
  }

  buildTextFormFieldTelefone(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Telefone",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 30.0),
      controller: telefoneController,
      validator: (value){
        if(value.isEmpty){
          return 'Informe o Telefone';
        }
        return null;
      }
    );
  }

  buildTextFormFieldEmail(){
    return TextFormField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: TextStyle(color: Colors.black,
          fontSize: 20.0
        )
      ),
      style: TextStyle(fontSize: 30.0),
      controller: emailController,
      validator: (value){
        if(value.isEmpty){
          return 'Informe o Email';
        }
        return null;
      }
    );
  }

  buildContainerButtonAgendar(BuildContext context){
    return Container(
      child: RaisedButton(
        onPressed: (){
          if(_formkey.currentState.validate()){
            _pegarRagistros();
            Focus.of(context).requestFocus(new FocusNode());
          }
        },
        child: Text("Agendar",
          style: TextStyle(color: Colors.white,
            fontSize: 30.0
            )
        ),
        color: Colors.lightBlue
      ),
    );
  }

    buildContainerButtonListaAgendamento(BuildContext context){
    return Container(
      child: RaisedButton(
        onPressed: (){
           Navigator.push(
          context, MaterialPageRoute(builder: (context) => Lista(text: this.nome)
          ),
        );
        },
        child: Text("Lista Pacientes",
          style: TextStyle(color: Colors.white,
            fontSize: 30.0
            )
        ),
        color: Colors.orange
      ),
    );
  }

  buildTextInfo(){
     return Text(_infoText,
      textAlign: TextAlign.left,
      style: TextStyle(color: Colors.black,
        fontSize: 15.0
        ),
     );
  }

  _pegarRagistros(){
    setState(() {
      this.nome = nomeController.text;
      this.data = dataController.text;
      this.hora = horaController.text;
      this.medico = medicoController.text;
      this.telefone = telefoneController.text;
      this.email = emailController.text;
    _resetaValores();
    });
  }

  _resetaValores(){
    setState(() {
      nomeController.text="";
      dataController.text="";
      horaController.text="";
      medicoController.text="";
      telefoneController.text="";
      emailController.text="";
      _infoText="Informe os registro";
    });
  }
}