import Cocoa

/**
 =============================================================================================
 COMO CRIAR VARIÁVEIS E CONSTANTES
 =============================================================================================
*/

var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"
name = "Keeley"

let character = "Daphne" // constante não pode ser alterada

var playname = "Roy"
playname = "Dani"
playname = "Sam"

// Convensão usada para nomenclatura dos dados é chamada de camecase.
let managerName = "Michael Scott"
let dogBreed = "Samoyed"
let meaningOfLife = "How many roads must a man walk down?"


/**
 =============================================================================================
 COMO CRIAR STRINGS
 =============================================================================================
*/

let actor = "Denzel Washington"
actor.count// retorna quantos caractres tem inclusive os espaços.


let filename = "paris.jpg"
filename.hasSuffix(".jpg")//Verifica se constante termina com ".jpg" e retorna true/false.


let result = "⭐️ You win! ⭐️"
result.uppercased()//retorna o conteúdo da constante em maiusculo.


let quote = "Then he tapped a sign saying \"Believe\" and walked away" // barra invertida para colocar aspas duplas em uma string

let movie = """
A day in
the life of an
Apple engineer
"""
print(movie) //Imprime com quebra de linha.
movie.hasPrefix("A day") //Verifica se constante inicia com "A day" e retorna true/false.


actor.count //Retorna o tamando de actor



/**
 =============================================================================================
 COMO ARMAZENAR INTEIROS
 =============================================================================================
*/

let score = 10

let reallyBig = 100_000_000 // Dividir as casas decimais
print(reallyBig)// vair retonar 100000000, pois os sumblinhados é só para vizualização no código.


let lowerScore = score - 2
let higherScore = score + 10
let doubledScore = score * 2
let squaredScore = score * score
let halvedScore = score / 2

var counter = 10
counter = counter + 5 //retorna 15
counter += 5 //retorna 20
counter *= 2 //retorna 40
counter -= 10 //retorna 30
counter /= 2 //retoena 15

let number = 120
number.isMultiple(of: 3)//retorna true pois 120 é multiplo de 3.
120.isMultiple(of: 3) //retorna true pois o número 120 é multiplo de 3.


/**
 =============================================================================================
 COMO ARMAZENAR NÚMEROS DECIMAIS
 =============================================================================================
*/

let numberDecimal = 0.1 + 0.2 //a soma retorna 0.30000000000000004

/**
 Ocasiona em erro pois não podemos adionar um inteiro em decimal, para fazer isso devemos dizer ao swift explicitamente. Depois que definirmos um conteúdo para variável não podemos mudar o seu tipo de comteúdo senão dara erro.
 */
 
let a = 1
let b = 2.0
//let c = a + b


let c = a + Int(b) // convertendo um double para int

let cc = Double(a) + b // convertendo um int para double

var rating = 5.0
rating *= 2 //retorna 10
