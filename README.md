# Pokédex Flutter

Um aplicativo Flutter simples que consome a [PokéAPI](https://pokeapi.co/) para listar Pokémons com suas imagens e permitir a busca por nome.

Este projeto foi desenvolvido sem o uso de `provider`, usando apenas `StatefulWidget` e `setState` para gerenciamento de estado, garantindo compatibilidade com **Web, Android e iOS**.

## 🗂 Estrutura do Projeto

```
lib/
  main.dart
  util/
    database.dart
  modules/
    dashboard/
      view/
        dashboard.dart
      di/
        controller.dart
      controller/
        pokemon_controller.dart
      core/
        domain/
          model/
            pokemon.dart
          usecase/
            get_pokemons_usecase.dart
            search_pokemon_usecase.dart
      data/
        repository/
          pokemon_repository.dart
          pokemon_repository_impl.dart
```

## 🚀 Funcionalidades

* Listagem de Pokémons obtidos da API oficial.
* Cada item exibe:

  * Nome do Pokémon (primeira letra maiúscula)
  * Imagem do Pokémon
  * Número do Pokémon na Pokédex
* Busca dinâmica por nome do Pokémon.
* Mensagem “Nenhum Pokémon encontrado” quando não há resultados.

## 📦 Dependências

* [Flutter](https://flutter.dev/)
* [http](https://pub.dev/packages/http) para consumo da API PokéAPI.

> Não é necessário usar `provider` ou qualquer outro gerenciador de estado externo.

## 🖥 Como rodar

1. Clone o projeto:

```bash
git clone <(https://github.com/eduardorossatto2023/Poke_Api.git)>
cd pokemon_api
```

2. Instale as dependências:

```bash
flutter pub get
```

3. Execute no navegador (Chrome recomendado) ou em um emulador:

```bash
flutter run -d chrome
```

> Para Android ou iOS, substitua `chrome` pelo dispositivo conectado.

## 🔧 Estrutura de módulos

* **dashboard**: Tela principal da Pokédex.
* **core/domain**: Contém os modelos (`Pokemon`) e casos de uso (usecases) para listagem e busca.
* **data/repository**: Implementação do repositório que consome a PokéAPI.
* **controller**: Controller que gerencia a lógica da tela.
* **di**: Ponto único para criar e injetar dependências do controller.

## 📝 Observações

* O projeto está pronto para ser expandido com funcionalidades como favoritos, detalhes de Pokémons e armazenamento local.
* É totalmente modular, mantendo separação clara entre **camadas de domínio, dados e apresentação**.
