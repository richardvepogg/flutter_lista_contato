class Contato{
  int id;
  String nome;
  String email;
  String imagem;

  Contato(this.id, this.nome, this.email);

Map<String,dynamic> toMap(){

  var map = <String,dynamic>{
    'id':id,
    'nome':nome,
    'email':email,
    'imagem' : imagem
  };
  return map;
}

Contato.fromMap(Map<String,dynamic> map){
  id = map['id'];
  nome = map['nome'];
  email = map['email'];
}

@override
  String toString() {

  return "Contato => (id: $id, nome: $nome, email: $email, imagem: $imagem)";
  }

}