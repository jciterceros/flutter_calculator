# Análise das Classes e Relacionamentos

Este documento descreve a análise das classes e seus relacionamentos no diagrama UML do projeto de estudos em **Flutter Calculator**. 

A análise está dividida em dois níveis: uma visão técnica detalhada e uma explicação em **linguagem ubíqua** para facilitar o entendimento por todos os membros da equipe.

---

## **Análise Técnica das Classes e Relacionamentos**

### **Pacote "Calculator"**
1. **`Operation`**
   - Representa uma operação matemática.
   - **Atributos**:
     - `validOperations`: Lista de operações válidas.
     - `value`: Valor da operação.
   - **Métodos**:
     - Validação (`isValid`, `isArithmeticOperation`, `isEqualOperation`).
     - Sobrescrita de métodos (`toString`, `==`, `hashCode`).
   - **Relacionamentos**: Nenhum explícito no diagrama, mas é usado por `Memory`.

2. **`IMemory`**
   - Interface para a classe `Memory`.
   - **Métodos**:
     - `applyCommand`: Aplica um comando à memória.
     - `value`: Retorna o valor atual da memória.

3. **`Memory`**
   - Implementa a lógica de memória da calculadora.
   - **Atributos**:
     - `operations`: Lista de operações válidas.
     - `_calculatorEntity`: Estado interno da calculadora.
   - **Métodos**:
     - Manipulação de comandos (`applyCommand`, `_setOperation`, `_addDigit`).
     - Operações matemáticas (`_calculate`, `_add`, `_subtract`, etc.).
     - Reset e limpeza (`_allClear`).
   - **Relacionamentos**:
     - Implementa `IMemory`.
     - Usa `CalculatorEntity` e `Operation`.

4. **`CalculatorEntity`**
   - Representa o estado interno da calculadora.
   - **Atributos**:
     - `buffer`: Valores armazenados para cálculos.
     - `operation`: Operação atual.
     - `displayValue`: Valor exibido no visor.
   - **Métodos**:
     - Manipulação do estado (`copyWith`, `reset`, `updateBufferAndDisplay`).
     - Formatação de valores (`formatValue`).

5. **`MemoryDataSource`**
   - Classe intermediária que utiliza `Memory`.
   - **Relacionamentos**:
     - Usa `Memory` diretamente.
     - Usa `CalculatorEntity` indiretamente.

6. **`CalculatorRepository` (Interface)**
   - Define o método `calculate`.

7. **`CalculatorRepositoryImpl`**
   - Implementa `CalculatorRepository`.
   - **Relacionamentos**:
     - Usa `MemoryDataSource`.

8. **`Calculator`**
   - Widget principal da calculadora.
   - **Relacionamentos**:
     - Extende `StatelessWidget`.
     - Contém `Keyboard` e `Display`.

---

### **Pacote "Widgets UI"**
1. **`StatelessWidget`**
   - Classe base para widgets imutáveis.

2. **`Button`**
   - Representa um botão na interface.
   - **Relacionamentos**:
     - Extende `StatelessWidget`.

3. **`ButtonRow`**
   - Contém uma lista de botões.
   - **Relacionamentos**:
     - Extende `StatelessWidget`.
     - Contém `Button`.

4. **`Keyboard`**
   - Representa o teclado da calculadora.
   - **Relacionamentos**:
     - Extende `StatelessWidget`.
     - Contém `ButtonRow` e cria `Button`.

5. **`AutoSizeText`**
   - Representa texto ajustável.
   - **Relacionamentos**:
     - Contido em `Display`.

6. **`Display`**
   - Representa o visor da calculadora.
   - **Relacionamentos**:
     - Extende `StatelessWidget`.
     - Contém `AutoSizeText`.

---

### **Pacote "App"**
1. **`MaterialApp`**
   - Configura o aplicativo Flutter.
   - **Relacionamentos**:
     - Contém `Calculator`.
     - Usa `ThemeData`.

2. **`ThemeData`**
   - Configura o tema do aplicativo.

---

## **Análise em Linguagem Ubíqua**

### **Contexto**
O sistema é uma calculadora digital que permite ao usuário realizar operações matemáticas básicas. Ele é composto por três contextos principais:
1. **Lógica de Negócio (Calculator)**: Gerencia as operações matemáticas e o estado interno da calculadora.
2. **Interface do Usuário (Widgets UI)**: Define os componentes visuais, como botões, teclado e visor.
3. **Configuração do Aplicativo (App)**: Configura o tema e a estrutura principal do aplicativo.

### **Principais Entidades**
1. **Operação (`Operation`)**
   - Representa uma operação matemática, como soma ou subtração.
   - É validada antes de ser aplicada.

2. **Memória (`Memory`)**
   - Armazena o estado atual da calculadora, incluindo valores e operações.
   - Atua como o "cérebro" da calculadora, processando comandos e realizando cálculos.

3. **Entidade da Calculadora (`CalculatorEntity`)**
   - Representa o estado interno detalhado, como os valores no buffer e a operação atual.

4. **Teclado (`Keyboard`)**
   - Permite ao usuário interagir com a calculadora, enviando comandos.

5. **Visor (`Display`)**
   - Exibe o valor atual ou o resultado de uma operação.

### **Fluxo de Trabalho**
1. O usuário interage com o **Teclado** pressionando botões.
2. Os comandos são enviados para a **Memória**, que processa a lógica de negócio.
3. O estado atualizado é refletido no **Visor**, exibindo o resultado ou o valor atual.

### **Linguagem Ubíqua**
- **Comando**: Entrada do usuário, como pressionar um botão.
- **Operação**: Ação matemática, como soma ou divisão.
- **Estado**: Representação atual da calculadora, incluindo valores e operação.
- **Visor**: Interface que exibe o estado para o usuário.

---

Este README fornece uma visão clara e detalhada do sistema, tanto para desenvolvedores quanto para membros não técnicos da equipe. A análise em linguagem ubíqua garante que todos compartilhem o mesmo entendimento sobre os conceitos principais do projeto.


---
## **Configuração e Execução do Projeto**

### **Clonar o Repositório**
Para começar, é necessário clonar o repositório do projeto. Siga os passos abaixo:

1. Certifique-se de que o Git está instalado em sua máquina.
2. Execute o seguinte comando no terminal para clonar o repositório:

   ```bash
   git clone https://github.com/seu-usuario/flutter_calculator.git
   ```
3. Navegue até o diretório do projeto:

   ```bash
   cd flutter_calculator
   ```
---

### **Instalar Dependências**
Antes de executar o projeto, é necessário instalar as dependências do Flutter:

1. Certifique-se de que o Flutter está instalado e configurado corretamente. Para mais informações, consulte a [documentação oficial do Flutter](https://docs.flutter.dev/get-started/install).
2. No diretório do projeto, execute o seguinte comando para instalar as dependências:

   ```bash
   flutter pub get
   ```
---

### **Executar os Testes**
Para garantir que o projeto está funcionando corretamente, execute os testes automatizados:

1. No terminal, execute o seguinte comando:
   ```bash
   flutter test
   ```
2. Verifique os resultados no terminal para garantir que todos os testes passaram.

---

### **Iniciar o Aplicativo no Emulador do Android Studio**
Para executar o aplicativo no emulador do Android Studio, siga os passos abaixo:

1. Certifique-se de que o Android Studio está instalado e configurado corretamente.
2. Abra o Android Studio e inicie um emulador Android.
3. No terminal, execute o seguinte comando para iniciar o aplicativo no emulador:

   ```bash
   flutter run
   ```
4. O aplicativo será compilado e iniciado no emulador.

---

### **Dicas Adicionais**
- Para verificar se o Flutter está configurado corretamente, execute:

  ```bash
  flutter doctor
  ```

Certifique-se de que todas as verificações estão marcadas como "OK".
- Caso queira executar o aplicativo em um dispositivo físico, conecte o dispositivo ao computador, habilite a depuração USB e execute o comando `flutter run`.
---

Com essas instruções, você estará pronto para configurar e executar o projeto **Flutter Calculator**.