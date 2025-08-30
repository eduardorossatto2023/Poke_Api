# Pokédex Flutter

Um aplicativo móvel em **Flutter** que consome a **PokéAPI** para listar pokémons com suas imagens e permite pesquisar por nome.  

O app apresenta uma interface amigável e responsiva, com **lista de pokémons**, imagens e número da Pokédex.  

---

## 📱 Funcionalidades

- Listagem dos **151 pokémons iniciais**.
- Exibe **nome, número e imagem** do pokémon.
- **Campo de busca** para filtrar pokémons dinamicamente.
- Mensagem de aviso quando nenhum pokémon é encontrado.

---

## 📂 Estrutura do projeto

pokedex_flutter/
├── android/
├── ios/
├── lib/
│ ├── main.dart
│ ├── models/
│ │ └── pokemon.dart
│ ├── services/
│ │ └── pokemon_service.dart
│ └── screens/
│ └── pokemon_list_screen.dart
├── pubspec.yaml
└── README.md
