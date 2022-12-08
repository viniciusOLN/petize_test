# Documentação
Tecnologias utilizadas: Flutter, http, bloc e clean architecture.

# Informações sobre como rodar o aplicativo!
    Para rodar o aplicativo é necessário ter o flutter instalado no seu computador.
    Para instalar as dependências do projeto, caso já não estejam funcionando, coloque no terminal o comando: flutter pub get.
    
    Caso você tenha um emulador de android no seu pc:
        
        Abra o emulador de android -> vá pra pasta raiz do projeto flutter -> abra o terminal -> digite: flutter run

        obs: para checkar se seu emulador está realmente aberto e aceito como um device pelo flutter, vá no terminal e digite: flutter devices. Se o flutter estiver atualizado ele irá mostrar as opções: chrome, edge e, se tudo estiver correto com o android, o nome do seu android.

    Caso você queira rodar o aplicativo no celular:
        Conecte o celular na sua máquina => permita que o computador acesse o celular => cheque se o seu celular está disponível como device no flutter com o comando: flutter devices no terminal.

        Obs: caso seu celular não esteja disponível como device, siga o tutorial de um desses sites: 
        
        https://tecnoblog.net/277750/como-ativar-o-modo-desenvolvedor-no-android/ 

        https://canaltech.com.br/android/como-ativar-modo-desenvolvedor-android/

    Obs: Caso não queira seguir esses tutoriais, faça o seguinte : Com o fluter instalado na sua máquina, baixe o projeto e use o comando: flutter build apk, esse comando irá baixar o apk do projeto. Feito isso acesse o diretório:  [flutter-project]/build/app/outputs/apk/release/app-release.apk, pegue o apk-release.apk e mande pro celular, baixe o apk no seu celular e bom uso(fazendo isso, não rodando no emulador ou celular baseado no flutter run, o aplicativo fica mais otimizado!).
    
# Motivações de tecnologias
    
  As escolhas para as tecnologias foram com base no desafio proposto. Optei também pela implementação de bloc de forma manual, seguindo somente com alguns pacotes para ajudar no consumo de Stream na parte dos widgets. Utilizei também Clean Architecture com o pacote DartZ e Equatable(para os testes) pois acredito que encaixa bem com a proposta de Flutter Modular, onde pude testar separadamente cada camada e injetar outras de forma organizada e de melhor entendimento e manuntenção do código. Utilizei também o pacote mocktail como forma de mockar as classes que envolviam dados, optei por ele pela facilidade de mockar classes, diferente do mockito em sua última versão que precisavam de alguns passos a mais para a mockagem.
    
#Estrutura do projeto
   
    
    
     O projeto tem a seguinte estrutura:
    lib
     |-> app
          |-> data -> camada onde se pega os dados da api ou localmente.
          |      |-> datasource -> local que pega os dados brutos da api ou localmente.
          |      |-> models -> local onde se faz a serialização dos dados
          |      |-> repositories -> local onde se faz a implementação do contrato do layer de domain
          |   
          |-> domain -> local onde fica a camada que implementa os dados da camada data de forma independente.
          |       |-> entities -> local onde ficam as entidades responsáveis por receber os dados e serem manipuladas.
          |       |-> repositories -> local onde fica os contratos que serão injetados no usecase e implementados pela data layer.
          |       |-> usecase -> local que encapsulará o repositório injetado da data layer.
          |       
          |-> presentation -> camada que contém a parte da interface, nela temos a Ui, controllers com gerenciamento de estado e widgets no geral.
      
     
     Os demais arquivos são Widgets e estilos utilizados dentro do projeto e também o arquivo que contém a parte de injeção de dependências, onde injetamos em cada uma das camadas seus respectivos repositórios, casos de uso e provedor de dados.
