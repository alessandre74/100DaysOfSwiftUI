import Cocoa

/**
 =============================================================================================
 COMO CRIAR E USAR PROTOCOLOS.
 =============================================================================================
*/

//PROTOCOL
//============================================================================================
protocol Vehicle {
  var name: String { get }
  var currentPassangers: Int { get set }
  func estimateTime(for distance: Int) -> Int
  func travel(distance: Int)
}

//STRUCTS
//============================================================================================
struct Car: Vehicle {
  let name = "Car"
  var currentPassangers = 1
  
  func estimateTime(for distance: Int) -> Int {
    distance / 50
  }
  
  func travel(distance: Int) {
    print("Estou dirigindo \(distance)km")
  }
  
  func openSunroof() {
    print("É um bom dia!")
  }
}

struct Bicycle: Vehicle {
  let name = "Bicycle"
  var currentPassangers = 1
  
  func estimateTime(for distance: Int) -> Int {
    distance / 10
  }
  
  func travel(distance: Int) {
    print("Estou pedalando \(distance)km")
  }
}

//FUNCTIONS
//============================================================================================

func commute(distance: Int, using vehicle: Vehicle) {
  if vehicle.estimateTime(for: distance) > 100 {
    print("Isso é muito lento! Vou tentar outro veículo.")
  } else {
    vehicle.travel(distance: distance)
  }
}

func getTravelEstimates(using vehicles: [Vehicle], distance: Int) {
  for vehicle in vehicles {
    let estimate = vehicle.estimateTime(for: distance)
    print("\(vehicle.name): \(estimate) horas para percorrer \(distance)km")
  }
}


//INSTANCE OF STRUCTURES
//============================================================================================
let car = Car()
commute(distance: 100, using: car)

let bike = Bicycle()
commute(distance: 50, using: bike)


//EXECUTE FUNCTIONS
//============================================================================================
getTravelEstimates(using: [car, bike], distance: 150)


/**
 =============================================================================================
 COMO USAR TIPOS DE RETORNO OPACO.
 =============================================================================================
*/

func getRandomNumer() -> some Equatable {
  Int.random(in: 1...6)
}

func getRandomBool() -> some Equatable {
  Bool.random()
}


/**
 Para fazer comparações utilizamos o protocolo Equatable para podermos perguntar se um retorno de funão é == a outro retono de função, mas temos que utilizar a palavra chave some antes de Equatable para que o swift saiba o tipo de retorno, senão vai dar erro.
 */

print(getRandomNumer() == getRandomNumer())



/**
 =============================================================================================
 COMO CRIAR E USAR EXTENSÕES.
 =============================================================================================
 Adicionando a String métodos e propriedades computadas, não podemos utilizar propriedades armazenadas.
*/

//1° Exemplo de extesion com métodos e propreidade computada.
extension String {
  func trimmed() -> String {
    self.trimmingCharacters(in: .whitespacesAndNewlines)
  }
  
  mutating func trim() {
   self = self.trimmed()
  }
  
  var lines: [String] {
    self.components(separatedBy: .newlines)
  }
}

var quote = "   The truth is rarely pure and never simple   "
quote.trim()
print(quote)


let lyrics = """
But I keep cruising
Can't stop, won't stop moving
It's like I got this music in my mind
Saying it's gonna be alright
"""

print(lyrics.lines.count)

//2° Exemplo de extesion, para não perdermos o init() padrão de uma struct, movemos para uma extension o init() personalizado.
struct Book {
  let title: String
  let pageCount: Int
  let readingHours: Int
}

extension Book {
  init(title: String, pageCount: Int){
    self.title = title
    self.pageCount = pageCount
    self.readingHours = pageCount / 50
  }
}

let lotr1 = Book(title: "Lord of the Rings", pageCount: 1178, readingHours: 24) // init automático
let lotr2 = Book(title: "Lord of the Rings", pageCount: 1178) // init personalizado


/*
 Se você estiver retornando um novo valor em vez de alterá-lo, use terminações de palavras como "ed" ou "ing", como reversed() ou
 sorted(). Por exemplo, se usar sorted() ele vai criar um novo array com os dados retornados. Se quiser alterar o próprio array
 utilizamos o sort(), não conseguimos utilizar o sort() para retonar os dados pois ele modifica o prório array, então não podemos
 atribuir  ele a nenhuma váriável e se usar o sort() o array deve ser um "var" pois como ele modifica o próprio array não pode
 ser um "let".
*/



//Utilizando SORT() o array é um "var" e utilizamos o SORT() sem atribuilo a nenhuma variável.
var names1 = ["Silvana", "Bruna", "Silvia", "Mike", "Alessandre"]
names1.sort()
print(names1)

//Utilizando SORTED() o array pode ser um "let" ou "var", atribuimos a uma nova váriavel ou constante pois retorna um novo array.
let names2 = ["Silvana", "Bruna", "Silvia", "Mike", "Alessandre"]
let names3 = names2.sorted()
print(names3)


/**
 =============================================================================================
 COMO CRIAR E USAR EXTENSÕES DE PROTOCOLO.
 =============================================================================================
*/


/**
 Podemos fazer o mesmo adicionado ao protocolo Array uma propriedade computada. Aqui no Playground devemos colocar as extensions acima de onde vamos executar em projetos regulares, isso não é um problema. Poderiamos ter utilizado Array, Set e Dictionary, mas todas fazem parte de Colletion, então já fica disponível para todos.
 */
extension Collection {
  var isNotEmpty: Bool {
    isEmpty == false
  }
}

let guests = ["Mario", "Luigi", "Peach"]

//Acho a prática ruim, pois a leitura não fica clara.
if guests.isEmpty == false {
    print("Guest count: \(guests.count)")
}

//Algumas pessoas preferem usar o !operador booleano, assim:

if !guests.isEmpty {
  print("Guest count: \(guests.count)")
}


//Assim fica mais legível, utilizando extension para adicionar uma propriedade computado a Array
if guests.isNotEmpty {
  print("Guest count: \(guests.count)")
}


/**
 Nesse caso como o protocolo não implementa corpo em uma função ou valores em propriedades, podemos fazer essa implementação em um extension do protocolo, onde todas as structs ou classes que utilizassem esse protocolo, poderiam adicionar seu próprio método sayHello(), mas como está implementado em extension não precisam implementar utilizando o já existente.
*/

protocol Person {
  var name: String { get }
  func sayHello()
}

extension Person {
  func sayHello() {
    print("Hi, I'm \(name)")
  }
}

struct Employee: Person {
  var name: String
}

let taylor = Employee(name: "Taylor Swift")
taylor.sayHello()


/**
 =============================================================================================
 COMO APROVEITAR AO MÁXIMO AS EXTENSÕES DE PROTOCOLO.
 =============================================================================================
*/
//self minúsculo se refe ao valor e Self maiusculo se refere ao tipo
extension Int {
  func squared() -> Self {
    self * self
  }
}

let wholeNumber = 5
print(wholeNumber.squared())

struct User: Comparable {
  let name: String
  
  
 //Veja que aqui o nome da função é <
 static func <(lhs: User, rhs: User) -> Bool {
    lhs.name < rhs.name
  }
}


let user1 = User(name: "Link")
let user2 = User(name: "Zelda")
print(user1 == user2)
print(user1 != user2)

/**
 Depois de implementar o codigo do método da struct User com o protocolo Comparable que se baseia no protocolo Equatable,  podemos utilizar como abaixo:
*/
print(user1 == user2)
print(user1 != user2)
print(user1 < user2)
print(user1 <= user2)


/**
 =============================================================================================
 CHECKPOINT 8.
 =============================================================================================
*/


protocol Building {
  var rooms: Int { get }
  var cost: Int { get }
  var agentName: String { get }
  
  func salesSummary()
  
}

struct House: Building {
  var rooms: Int
  var cost: Int
  var agentName: String
  
  func salesSummary() {
    let houseCost = cost.formatted(.currency(code: "pt_BR"))
    print("Edifício \(House.self) com custo de \(houseCost) e unidades com \(rooms) quartos. Agente imobiliário \(agentName)")
  }
}

struct Office: Building {
  var rooms: Int
  var cost: Int
  var agentName: String
  
  func salesSummary() {
    let officeCost = cost.formatted(.currency(code: "pt_BR"))
    print("Edifício \(Office.self) com custo de \(officeCost) e unidades com \(rooms) quartos. Agente imobiliário \(agentName)")
  }
}

let house = House(rooms: 8, cost: 500_000_00, agentName: "Mike")
let office = House(rooms: 12, cost: 800_000_00, agentName: "Mike")
house.salesSummary()
office.salesSummary()
