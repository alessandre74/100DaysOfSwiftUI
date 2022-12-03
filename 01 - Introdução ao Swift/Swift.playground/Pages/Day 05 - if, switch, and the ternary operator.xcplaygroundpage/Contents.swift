import Cocoa

/**
 =============================================================================================
 COMO VERIFICAR SE UMA CONDIÇÃO É VERDADEIRA.
 =============================================================================================
*/

//1° Teste de condição.

let score = 86

if score > 80 {
  print("Bom trabalho!\n")
}


//2° Teste de condição -----------------------------------------------------------------------

let speed = 88
let percentage = 85
let age = 18

if speed >= 88{
  print("Para onde vamos não precisamos de estradas.\n")
}

if percentage < 85 {
  print("Descuple, você falhou no teste.\n")
}

if age >= 18 {
  print("Você está qualificado para votar.\n")
}


//3° Teste de condição -----------------------------------------------------------------------

let ourName = "Dave Lister"
let friendName = "Arnold Rimmer"

if ourName < friendName {
  print("Isso é \(ourName) vs \(friendName)")
}

if ourName > friendName{
  print("Isso é \(friendName) vs \(ourName)\n")
}

//4° Teste de condição -----------------------------------------------------------------------

var numbers = [1, 2, 3] // crie um array com 3 números.
numbers.append(4) //adicione o 4° número ao array.

if numbers.count > 3 {
  numbers.remove(at: 0) //remove o número mais antigo.
}


//5° Teste de condição -----------------------------------------------------------------------

//Operador de comparação ==, que significa "é igual a".
let country = "Canada"

if country == "Australia" {
  print("Bom dia!")
}

//Operador de comparação !=, que significa "não é igual a ou diferente de".

let name = "Taylor Swift"

if name != "Anonymous" {
  print("Welcome, \(name)")
}

//verificar se o nome de usuário inserido pelo usuário está vazio, se estiver username será igual a "Anonymous".

var username = "taylorswift13"

if username == "" {
  username = "Anonymous"
}

print("Welcome, \(username)!\n")


/**
 Existem outras maneiras de fazer a comparação de strings. Temos a primeira com "" string vazia e também temos com count, onde podemos fazer username.count == 0.Em muitas linguagens isso é muito rápido, mas não em Swift. Veja bem, o Swift suporta todos os tipos de strings complexas – literalmente, todas as linguagens humanas funcionam imediatamente, incluindo emoji, e isso não é verdade em tantas outras linguagens de programação. No entanto, esse suporte realmente ótimo tem um custo, e uma parte desse custo é que pedir uma string por ela countfaz com que o Swift passe e conte todas as letras uma a uma – ele não armazena apenas seu comprimento separadamente da string.
 
 Então, pense na situação em que você tem uma corda enorme que armazena as obras completas de Shakespeare. Nosso pequeno cheque para count == 0tem que passar e contar todas as letras da string, mesmo que assim que contarmos pelo menos um caractere saibamos a resposta para nossa pergunta.
 
 Como resultado, o Swift adiciona uma segunda funcionalidade a todas as suas strings, arrays, dicionários e conjuntos: isEmpty. Isso será enviado de volta truese o que você está verificando não tiver nada dentro, e podemos usá-lo para corrigir nossa condição assim:
 */

username = "" //redefinindo username para em branco para podermos utilizar username.isEmpty == true


if username.isEmpty == true {
  username = "Anonymous1"
}

/**
 Isso é melhor, mas podemos dar um passo adiante. Você vê, em última análise, o que importa é que sua condição deve se resumir a verdadeira ou falsa; Swift não permitirá mais nada. No nosso caso, username.isEmpty já é um booleano, ou seja, será verdadeiro ou falso, para que possamos simplificar ainda mais nosso código:
 */

username = "" //redefinindo username para em branco para podermos utilizar username.isEmpty

if username.isEmpty {
  username = "Anonymous2"
}


/**
 =============================================================================================
 COMO VERIFICAR VÁRIAS CONDIÇÕES.
 =============================================================================================
*/

//1° forma de condição somente com if
let age1 = 16

if age1 >= 18 {
  print("Você pode votar na próxima eleição.")
}

if age1 < 18 {
  print("Desculpe, você é muito jovem para votar")
}

//2° forma de condição com if else -----------------------------------------------------------

if age1 >= 18 {
  print("Você pode votar na próxima eleição")
} else {
  
  print("Desculpe, você é muito jovem para votar")
}


//3° forma de condição com else if -----------------------------------------------------------

let a = false
let b = false

if a {
  print("Código a ser executado se \"a\" for verdadeiro")
} else if b {
  print("Código a ser executado se \"a\" for falso, mas \"b\" for verdadeiro")
} else {
  print("Código a ser executado se ambas, \"a\" e \"b\" forem falsos")
}


//4° forma de condição com else if -----------------------------------------------------------

let temp = 25

if temp > 20 {
  if temp < 30 {
    print("É um bom dia")
  }
}

//5° forma de condição com operador && (e) ---------------------------------------------------

//A condição inteira só será verdadeira se as duas partes forem verdadeiras.
if temp > 20 && temp < 30{
  print("É um bom dia")
}

//6° forma de condição com operador ||(ou)----------------------------------------------------

let userAge = 14
let hasParentalConsent = true

//A condição interira será verdadeira se qualquer uma das partes for verdadeira.
if userAge >= 18 || hasParentalConsent == true {
  print("Você pode comprar o jogo")
}

//ou

if userAge >= 18 || hasParentalConsent {
  print("Com hasParentalConsent")
  print("Você pode comprar o jogo")
}


//7° forma de condição e mais complexa com if, else if, else e || ----------------------------

enum TransportOption {
  case airplane, helicopter, bicycle, car, scooter
}

let transport = TransportOption.airplane

if transport == .airplane || transport == .helicopter {
  print("Vamos voar")
} else if transport == .bicycle {
  print("Espero que haja uma ciclovia..")
} else if transport == .car {
  print("Hora de ficar preso no trânsito.")
} else {
  print("Vou alugar uma scooter agora!")
}

/**
 =============================================================================================
 COMO USAR INSTRUÇÕES SWITCH PARA VERIFICAR VÁRIAS CONDIÇÕES.
 =============================================================================================
*/

//Utilizando switch em vez de if, else if.

enum Weather {
  case sun, rain, wind, snow, unknown
}

let forecast  = Weather.sun


//com if, else if.

if forecast == .sun {
    print("Deve ser um bom dia.")
} else if forecast == .rain {
    print("Embale um guarda-chuva.")
} else if forecast == .wind {
    print("Vista algo quente")
} else if forecast == .rain {
    print("A escola é cancelada.")
} else {
    print("Nosso gerador de previsão está quebrado!")
}


//com switch.

switch forecast {
case .sun:
  print("Deve ser um bom dia.")
case .rain:
  print("Embale um guarda-chuva.")
case .wind:
  print("Vista algo quente")
case .snow:
  print("A escola é cancelada.")
case .unknown:
  print("Nosso gerador de previsão está quebrado!")
}


//Incluindo default no switch
let place = "Metropolis"

switch place {
case "Gothan":
  print("Você é o Batman!")
case "Mega-City One":
  print("Você é o juiz Dredd!")
case "Wakanda":
  print("Você é o Pantera Negra!")
default:
  print("Quem é você")
}


/**
 Isso default:no final é o caso padrão, que será executado se todos os casos não corresponderem.

 Lembre-se: o Swift verifica seus casos em ordem e executa o primeiro que corresponder. Se você colocar defaults de qualquer outro caso, esse caso é inútil porque nunca será correspondido e o Swift se recusará a construir seu código.

 Segundo, se você deseja explicitamente que o Swift continue executando os casos subsequentes, use fallthrough. Isso não é comumente usado, mas às vezes – apenas às vezes – pode ajudá-lo a evitar a repetição do trabalho.

 Por exemplo, há uma famosa música de Natal chamada The Twelve Days of Christmas, e à medida que a música continua, mais e mais presentes são empilhados em uma pessoa infeliz que, por volta do sexto dia, tem a casa bastante cheia.

 Poderíamos fazer uma aproximação simples dessa música usando fallthrough.
 
 Primeiro, veja como o código ficaria sem fallthrough :
 */



//Switch sem fallthrough

let day = 5
print("Meu verdadeiro amor me deu...")

switch day {
case 5:
  print("5 anéis dourados")
case 4:
  print("4 pássaros chamando")
case 3:
  print("3 galinhas francesas")
case 2:
  print("2 rolas")
default:
  print("Uma perdiz em uma árvore de pera")
}

//Switch com fallthrough

switch day {
case 5:
  print("5 anéis dourados")
  fallthrough
case 4:
  print("4 pássaros chamando")
  fallthrough
case 3:
  print("3 galinhas francesas")
  fallthrough
case 2:
  print("2 rolas")
  fallthrough
default:
  print("Uma perdiz em uma árvore de pera")
}

/**
 =============================================================================================
 COMO USAR O OPERADOR CONDICIONAL TERNÁRIO PARA TESTES RÁPIDOS.
 =============================================================================================
*/

//1° Exemplo
let age2 = 18
let canVote = age2 >= 18 ? "Sim": "Não"
print(canVote) //retorna Sim

//2° Exemplo
let hour = 23
let result = hour < 12 ? "É antes do meio dia": "É depois do meio dia"
print(result) //retorna "É depois do meio dia"

//3° Exemplo
let names1 = ["Jayne", "Kaylee", "Mal"]
let crewCount = names1.isEmpty ? "Ninguém": "\(names1.count) pessoas"
print(crewCount) // retorna 3 pessoas

//4° Exemplo
enum Theme {
  case light, dark
}

let theme = Theme.dark
let background = theme == .dark ? "Preto" : "Branco"
print(background) //retorna "Preto"
