import Cocoa

/**
 =============================================================================================
 COMO LIMITAR O ACESSO A DADOS INTERNOS USANDO O CONTROLE DE ACESSO.
 =============================================================================================
*/

struct BankAccount {
 private(set) var funds = 0
  
  mutating func deposit(amount: Int){
    funds += amount
  }
  
  mutating func withdraw(amount: Int) -> Bool {
    if funds > amount {
      funds -= amount
      return true
    } else {
      return false
    }
  }
}

var account = BankAccount()
account.deposit(amount: 100)
let success = account.withdraw(amount: 200)

if success {
  print("Saque realizado com sucesso!")
} else {
  print("Falha ao fazer o saque!")
}

print(account.funds)

//account.funds -= 100 // sem a declaração de private na variável funds a mesma pode ser acessada externamente.

/**
 Niveis de acesso a propriedades de struct.
 
 private - acessado somente dentro da struct
 fileprivate - acessada somente dentro do aqrquivo atual.
 public - acesso geral de qualquer lugar.
 
 OBS: Opção extra private(set) - Deixa qualquer um ler a propriedade mas somente os métodos da struct podem alterar.
 
 Importante: se você usar o private controle de acesso para uma ou mais propriedades, é provável que precise criar seu próprio inicializador.
 */

/**
 =============================================================================================
 PROPRIEDADES E MÉTODOS ESTÁTICOS.
 =============================================================================================
*/

//Criando struct Schook e utilizando propriedades e métodos estáticos que são acessados direntamente sem criar instância da struct School.
struct School {
  static var studentCount = 0
  
  static func add(student: String) {
    print("\(student) ingresou na escola.")
    studentCount += 1
  }
}

School.add(student: "Taylor Swift")
print(School.studentCount)

//Utilizando dados estáticos para armazenar dados fixos que precisam ser acessados ​​em vários lugares.

struct AppData {
  static let version = "1.3 beta 2"
  static let saveFilename = "settings.json"
  static let homeURL = "https://www.hackingwithswift.com"
}

//Utilizando dados estáticos para criar dados de exemplos.

struct Employee {
  let username: String
  let password: String
  
  static let example = Employee(username: "cfederighi", password: "hairforceone")
}

print(Employee.example)

/**
 self - refere-se ao valor atual da struct.
 Self - refere-se ao tipo atual.
 
 Para acessar uma propriedade ou método estático dentro de uma strunc, usamos Self.propriedade ou Self.metodo ou o proprio nome da struc como por exemplo a struct Employee ficaria Employee.propriedade ou Employee.metodo
 
 */

/**
 =============================================================================================
 CHECKPOINT 6.
 =============================================================================================
*/

struct Car {
  private let model: String
  private let numberSeats: Int
  private var currentGear = 1
  
  init(model: String, numberSeats: Int){
    self.model = model
    self.numberSeats = numberSeats
  }
  
  mutating func gearChanging(gear: Int) {
    if gear <= 0 || gear > 10 {
      print("Marcha somente entre 1 a 10!")
      return
    }
    
    if gear == currentGear {
      print("Você não passou a marcha!")
      return
    }
    
    if gear > currentGear {
      if (gear - currentGear) >= 2 {
        print("Você está na marcha \(currentGear) não pode ir direto para marcha \(gear)")
        return
      }
    }
    
    if gear < currentGear {
      if (currentGear - gear) >= 2 {
        print("Você está na marcha \(currentGear) não pode ir direto para marcha \(gear)")
        return
      }
    }
    
   print("Marcha atual: \(gear)")
   currentGear = gear
  }
}

var car = Car(model: "Citroen", numberSeats: 5)
print(car)
car.gearChanging(gear: 2)
car.gearChanging(gear: 3)
car.gearChanging(gear: 4)

