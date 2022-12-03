
import Cocoa

/**
 =============================================================================================
 COMO ARMAZENAR VERDADE(TRUTH) COM BOELANOS
 =============================================================================================
*/

let filename = "paris.jpg"
filename.hasSuffix(".jpg") //procura se filename termina com ".jpg", se achar retorna true senão false

let number = 120
number.isMultiple(of: 3) //retorna true se o conteúdo de number for multiplo de 3 senão false.

let isMultiple = 120.isMultiple(of: 3) // retorna true se 120 for multiplo de 3 senão false.

//Invertendo valores de um boleano com toogle().
let goodDogs = true

var gameOver = false
gameOver.toggle() // retorna true, pois toggle retona o inverso do conteudo da variável

//Invertendo valores de um boleano com !.
var isAuthenticated = false
isAuthenticated = !isAuthenticated //retorna true, pois faz o mesmo efeito de toggle de inverter o conteúdo da variável
isAuthenticated = !isAuthenticated //retorna false


/**
 =============================================================================================
 COMO JUNTAR STRINGS
 =============================================================================================
*/

//Juntando strings com operador +.
let firstPart = "Hello, "
let secondPart = "world!"
let greeting = firstPart + secondPart //retorna Hello, world!.

let people = "Haters"
let action = "hate"
let lyric = people + " gonna " + action //retorna Haters gonna hate.

/**
 Swift não pode fazer a junção de uma vez só ele pega o primeiro e o segundo e cria uma varável temporária e depois o resultado com a terceira string e assim por diante.
*/
let luggageCode = "1" + "2" + "3" + "4" + "5"

//Juntando strings com interpolação de strings.
let name = "Taylor"
let age = 26
let message = "Hello, my name is \(name) an I'm \(age) years old."

// não podemos juntas string e int com operador + da erro.
let number_ = 11
//let missionMessage = "Apollo " + number + " landed on the moon"

// Podemos trata o número com a função String() e depois fazer a junção com +.
let missionMessage = "Apollo " + String(number_) + " landed on the moon."

//Porém é mais rápido e fácil de ler usando a interpolação de string.
let newVar = "Apollo \(number_) landed on the moon."

//Podemos colocar calculos dentro de interpolação de strings.
print("5 x 5 is \(5 * 5)") //retorna 5 x 5 is 25

/**
 =============================================================================================
 CHECKPOINT 1
 =============================================================================================
*/

let tempeCelsius = 14.0
let tempFahrenheit = (tempeCelsius * 9 / 5) + 32 
print("Convertendo temperatura de Celsius para Fahrenheit: \(tempFahrenheit)°F")

 
