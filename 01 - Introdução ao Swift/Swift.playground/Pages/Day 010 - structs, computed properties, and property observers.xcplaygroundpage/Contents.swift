import Cocoa

/**
 =============================================================================================
 COMO CRIAR SUA PRÓPRIAS STRUCTS.
 =============================================================================================
*/

//1° Exemplo - Criando uma struct
struct Album {
  let title: String
  let artist: String
  let year: Int
  
  func printSummary() {
    print("\(title) (\(year)) by \(artist)")
  }
}

let red = Album(title: "Red", artist: "Taylor Swift", year: 2012)
let wings = Album(title: "Wings", artist: "BTS", year: 2016)

print(red.title) // retorna o conteúdo da propriedade title da instância de red
print(wings.artist) // retorna o conteúdo da propriedade artist da instância de wings

red.printSummary() // executa o método printSummary da instância de red
wings.printSummary() // executa o método printSummary da instância de wings


 //2° Exemplo - Criando uma struct
struct Employee1 {
  let name: String
  var vactionRemaining = 10
  
  mutating func takeVacation(days: Int) {
    if vactionRemaining > days {
      vactionRemaining -= days
      print("Eu estou saindo de férias!")
      print("Dias restantes: \(vactionRemaining)")
    } else {
      print("Ops! Não há dias suficientes restantes.")
    }
  }
}


/**
 Instânciando uma struct a uma constante ou variável, caso os valores forem alterados no futuro opte por uma variável, nesse caso como colocamos um calor padrão para a propriedade vactionRemaining devemos optar por uma var em vez de let.
 */

var archer1 = Employee1(name: "Sterling Archer", vactionRemaining: 14)

print("Conteúdo de archer1 => \(archer1)")
archer1.takeVacation(days: 5)
print("Print da propriedade vactionRemaining de archer1 => \(archer1.vactionRemaining)")

print("")

var archer2 = Employee1(name: "Mike")
print("Conteúdo de archer2 => \(archer2)")
archer2.takeVacation(days: 5)
print("Print da propriedade vactionRemaining de archer2 => \(archer2.vactionRemaining)")


/**
 =============================================================================================
 COMO CALCULAR VALORES DE PROPRIEDADE DINAMICAMENTE.
 =============================================================================================
*/

//struct Employee2 - Utilizando get e set
struct Employee2 {
  let name: String
  var vacationAllocated = 14
  var vacationTaken = 0
  
  var vacationRemaining: Int {
    get {
      vacationAllocated - vacationTaken
    }

    set {
      vacationAllocated = vacationTaken + newValue
    }
  }
}

var archer3 = Employee2(name: "Sterling Archer", vacationAllocated: 14)
archer3.vacationTaken += 4
archer3.vacationRemaining = 5
archer3.vacationAllocated // retonar o valor de vacationAllocated depois da alteração de vacationTaken e vacationRemaining.
archer3.vacationRemaining // retorna o valor de vacationRemaining atualizado.



/**
 =============================================================================================
 COMO AGIR QUANDO UMA PROPRIEDADE É ALTERADA.
 =============================================================================================
*/

//struct Game - Utilizando didSet para informar quando a propriedade é alterada.
struct Game {
  var score = 0 {
    didSet {
      print("A pontuação agora é \(score)")
    }
    
  }
  
}

var game = Game()
game.score += 10
game.score -= 3
game.score += 1


//struct App - Utilizando didSet e willSet para informar quando a propriedade é alterada.

struct App {
  var contacts = [String]() {
    willSet {
      print("Valor atual é: \(contacts)")
      print("O novo valor será: \(newValue)")
    }
    
    didSet {
      print("Há agora \(contacts.count) \(contacts.count > 1 ? "contatos": "contato")")
      print("Valor antigo era: \(oldValue)")
    }
  }
}

var app = App()
app.contacts.append("Adrian E")
app.contacts.append("Allen W")
app.contacts.append("Ish S")


/**
 =============================================================================================
 COMO CRIAR INICIALIZADORES PERSONALIZADOS.
 =============================================================================================
*/

//struct Player1 - Inicializador padrão.
struct Player1 {
  let name: String
  let number: Int
}

let player1 = Player1(name: "Mike", number: 15)


//struct Player2 - Inicializador personalizado 1
struct Player2 {
  let name: String
  let number: Int
  
  init(name: String, number: Int){
    self.name = name
    self.number = number
  }
}

let player2 = Player2(name: "Silvana", number: 15)


//struct Player3 - Inicializador personalizado 2
struct Player3 {
  let name: String
  let number: Int
  
  init (name: String){
    self.name = name
    number = Int.random(in: 1...99)
  }
}

let player3 = Player3(name: "Bruna")


//struct Employee3 - Mantendo inicializador padrão junto com persolinalizado
struct Employee3 {
  var name: String
  var yearsActive = 0
}

extension Employee3 {
  init() {
    self.name = "Anonymous"
    print("Criando um funcionário anônimo…")
  }
}

let roslin = Employee3(name: "Laura Roslin")

let anon = Employee3()

