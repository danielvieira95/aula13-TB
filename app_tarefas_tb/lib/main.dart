// O pacote material permite criar aplicativos para celular Android com os
// widgets no padrão do sistema operacional Android
import 'package:flutter/material.dart';

// void main função principal do programa
void main() {
  // Run APP é a função que vai chamar a classe MyApp que contem a classe
  // Stateless do nosso aplicativo
  runApp(const MyApp());
}

// MyApp é a classe do tipo Stateless é uma classe que não é dinâmica
class MyApp extends StatelessWidget {
  // Contrutor da classe MyApp e permite a passagem de parâmetros para a classe
  const MyApp({super.key});

  // This widget is the root of your application.
  @override // Utiliza-se override para sobescrever os comandos de uma função
  // dentro da classe
  // Widget build método que reconstroi a tela toda vez que o app é iniciado
  Widget build(BuildContext context) {
    // return - retorno da classe
    return MaterialApp(
      // Material App faz parte do package Material
      // Home tela principal do Aplicativo
      // Scaffold estrutura pré pronta do Widget com
      // App bar, body, e Scaffold Bar
      debugShowCheckedModeBanner: false, // remove a faixa debug do aplicativo
      home: Scaffold(
        // App bar - Barra com título do aplicativo
        appBar: AppBar(
          // title - parametro do Widget AppBar
          // Text - Tipo de Widget para colocar no parâmetro
          //  Título do Scaffold
          title: Text('Aplicativo Tarefas'),
        ),
        // body - Corpo do Scaffold
        // Column - Tipo de Widget que permite colocar elementos
        // na vertical no aplicativo
        body: Column(
          // Children estabelece relação com os widgets que vão na coluna do app
          // Children utilizado para colocar mais de um elemento na coluna do app
          children: [
            // Chama a classe Task e passa como parâmetro o texto e o caminho da imagem
            Task("Aprender Flutter",
                "https://cdn-images-1.medium.com/v2/resize:fit:1024/0*vowtRZE_wvyVA7CB"),
            Task(" Jogar video game",
                "https://a-static.mlcdn.com.br/800x560/console-sony-playstation-5-825gb-marvels-spider-man-2-limited-edition/magazineluiza/237808200/7c0d5369fd416119d04202e4eb5513a0.jpg"),
            Task("Estudar",
                "https://img.imageboss.me/revista-cdn/cdn/6161/2264a8d4f17f8ee3f56155468163979b38eefbbf.jpg?1515696991"),
            Task("Jogar futebol",
                "https://conteudo.imguol.com.br/c/esporte/15/2022/12/18/messi-com-o-trofeu-da-copa-do-mundo-no-qatar-1671394673199_v2_900x506.jpg"),
          ], // Fim do children
        ),
      ),
    );
  }
}

// Criamos uma classe chamada Task que herda da Classe Stateless Widgets  o Widget Build
class Task extends StatelessWidget {
  final String
      tarefa; // Variavel do tipo String para pegar o nome da tarefa quando chamar
  // a Task
  final String
      img; // Variavel do tipo String para pegar o caminho/ endereço da imagem
  // Final palavra reservada que impede que as variáveis sofram alteração de valores de forma
  // acidental
  // Construtor da classe Task
  // this utiliza-se para acessar variáveis contidas dentro da própria classe
  const Task(this.tarefa, this.img, {super.key});

  @override // Override utilizado para sobescrever funções
  // Widget build método chamado para reconstruir a tela toda vez que a Task é chamada
  Widget build(BuildContext context) {
    // Return - retorno da função widget build
    return Container(
      // Criamos um container
      // color - Cor do Container
      color: Colors.white,
      // Child estabelece relação com apenas um elemento dentro do Widget
      child: Stack(
        // Stack utilizado para empilhar Containers
        // Children estabelece relação com mais de um elemento
        children: [
          // Cria Container Azul de altura 140
          Container(color: Colors.blue, height: 140),
          Container(
            // Cria Container Branco de altura 100
            color: Colors.white,
            height: 100,
            // Child cria relação do Container com a linha
            child: Row(
              // Row cria uma linha no aplicativo
              // mainAxisAlignment - Alinhamento principal do aplicativo
              // spaceBetween - Espaço entre os elementos
              // spaceEvenly - Espaço ajustado entre os elementos
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Children estabelece relação com mais de um elemento
                Container(
                  // Criamos um container Cinza de 100 de altura e 80 de largura

                  color: Colors.grey,
                  height: 100,
                  width: 80,
                  // child estabelece relação do Container com a imagem
                  // Image network image que passamos o caminho da url da internet
                  child: Image.network(
                    img,
                    // fit parâmetro que permite o ajuste da image no container
                    // BoxFit.fill parâmetro que permite o ajuste da image no container todo
                    fit: BoxFit.fill,
                  ),
                ),
                // Text - Widget Texto
                // Tarefa - variavel que irá receber o nome da tarefa
                // Quando a classe for chamada
                Text(
                  tarefa,
                  // Style parâmetro que permite customizar o texto com
                  // o parâmetro TextStyle( fontSize - permite ajustar
                  // o tamanho da fonte do texto)
                  style: TextStyle(fontSize: 22),
                ),
                // ElevatedButton permite criar um botão no app
                // onpressed - parâmetro para colocar uma função que é executada
                // quando o botão é pressionado
                ElevatedButton(
                    // onPressed função anônima que é chamada quando o botão é pressionado
                    onPressed: () {
                      print("Botão pressionado");
                    },
                    // Child estabelece a relação entre o botão e o icone
                    // Icon permite colocar um icone no botão
                    // Como parâmetro Icon recebe Icons.arrow_drop_up cria o icone de uma
                    // seta no botão
                    child: Icon(Icons.arrow_drop_up)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
