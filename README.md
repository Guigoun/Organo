# 🤖 Automação de Testes UI - Projeto Organo

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Robot Framework](https://img.shields.io/badge/Robot_Framework-000000?style=for-the-badge&logo=robot-framework&logoColor=white)
![Selenium](https://img.shields.io/badge/Selenium-43B02A?style=for-the-badge&logo=Selenium&logoColor=white)

## 🎯 Sobre o Projeto
Este repositório contém a automação de testes de interface (UI) do site Organo. O objetivo é garantir a qualidade do fluxo de cadastro de novos colaboradores e a renderização correta dos cards nos times.

## 🧪 Casos de Teste Automatizados
- [x] Cria card com sucesso preenchendo os campos válidos
- [x] Tenta criar card com campos obrigatórios em branco (Validação de erro)
- [x] Cria múltiplos cards e valida a quantidade renderizada no mesmo time

## 🛠️ Tecnologias Utilizadas
- **Python** (Linguagem base)
- **Robot Framework** (Framework de testes BDD)
- **SeleniumLibrary** (Interação com o navegador)
- **FakerLibrary** (Geração de massa de dados dinâmicos)

## 🚀 Como executar o projeto na sua máquina

### Pré-requisitos
Certifique-se de ter o [Python](https://www.python.org/) e o [Git](https://git-scm.com/) instalados.

### Instalação
1. Clone este repositório: git clone [https://github.com/Guigoun/Automacao_Organo.git]

2. Entre na pasta da organo: cd organo

3. Saia da pasta da organo: cd ..

4. Instale as dependências do React: npm install

5. Entre na pasta do projeto: cd Automacao_Organo

6. Crie um ambiente virtual: python -m venv .venv

7. Ative o ambiente virtual: .\venv\Scripts\activate

8. Instale as dependências: pip install -r requirements.txt

### Execução dos testes

1. Entre na pasta da organo: cd organo

2. Inicie o servidor local: npm start

3. Saia da pasta da organo cd ..

4. Na pasta Automacao_Organo execute os testes: robot -d relatorios tests/criar-card.robot


