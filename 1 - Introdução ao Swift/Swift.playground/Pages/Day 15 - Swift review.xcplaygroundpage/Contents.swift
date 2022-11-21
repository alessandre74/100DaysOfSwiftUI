import Cocoa

/*
 =============================================================================================
 Criando constantes e variáveis
 =============================================================================================
 Swift pode criar constantes e variáveis, mas as constantes são geralmente preferíveis.
 */

//Use isso para criar e depois alterar uma string variável:
var name = "Ted"
name = "Rebecca"


//Se você não quiser alterar um valor, use uma constante :
let user = "Daphne"


//A função print() é útil para aprender e depurar e mostra algumas informações sobre uma variável:
print(user)



/*
 =============================================================================================
 Strings
 =============================================================================================
 */

//As strings do Swift começam e terminam com aspas duplas:
let actor1 = "Tom Cruise"


//E elas funcionam muito bem com emoji também:
let actor2 = "Tom Cruise 🏃‍♂️"


//Se você quiser aspas duplas dentro de sua string, coloque uma barra invertida antes delas:
let quote = "He tapped a sign saying \"Believe\" and walked away."


//Se você quiser uma string que abranja várias linhas, comece e termine com três aspas duplas,assim:
let movie = """
A day in
the life of an
Apple engineer
"""


//O Swift fornece muitas propriedades e métodos úteis para strings, inclusive .count para ler quantas letras ele possui:
print(actor1.count)


//Há também hasPrefix()e hasSuffix(), que nos permite saber se uma string começa ou termina com letras específicas. Strings diferenciam maiúsculas de minúsculas no Swift, de modo que a segunda verificação retornará false.
print(quote.hasPrefix("He"))
print(quote.hasSuffix("Away."))



/*
 =============================================================================================
 Inteiros
 =============================================================================================
 O Swift armazena números inteiros usando o tipo Int, que suporta uma variedade de operadores
 matemáticos padrão:
 */

let score = 10
let higherScore = score + 10
let halvedScore = score / 2


//Ele também suporta operadores de atribuição compostos que modificam variáveis ​​no local:
var counter = 10
counter += 5


//Os inteiros vêm com sua própria funcionalidade útil, como o método isMultiple(of:):
let number = 120
print(number.isMultiple(of: 3))


//Você também pode criar números inteiros aleatórios em um intervalo específico, assim:
let id = Int.random(in: 1...1000)



/*
 =============================================================================================
 Decimais
 =============================================================================================
 Se você criar um número com um ponto decimal, o Swift o considerará um Double. O Swift
 considera Doubleum tipo de dados totalmente diferente do Int, e não permite que você os misture
 */
let score2 = 3.0



/*
 =============================================================================================
 Booleanos
 =============================================================================================
 */

//Swift usa o tipo Bool para armazenar true ou false:
let goodDogs = true
let gameOver = false


//Você pode inverter um Boolean de true para false chamando seu método toggle():
var isSaved = false
isSaved.toggle()



/*
 =============================================================================================
 Unindo strings
 =============================================================================================
 Você pode criar strings a partir de outros dados usando a interpolação de strings : escreva
 uma barra invertida dentro de sua string e coloque o nome de uma variável ou constante entre
 parênteses. Quando esse código for executado, ele imprimirá “Sou Taylor e tenho 26 anos”.
 */

let name1 = "Taylor"
let age = 26
let message = "I'm \(name1) and I'm \(age) years old."
print(message)




/*
 =============================================================================================
 Arrays
 =============================================================================================
 */

/** Você pode agrupar itens em um array como este: */
var colors = ["Red", "Green", "Blue"]
let numbers = [4, 8, 15, 16]
var readings = [0.1, 0.5, 0.8]


/**
 Cada um deles contém diferentes tipos de dados: um strings, um inteiros e um decimal.
 Quando lemos dados de arrays, obtemos o tipo apropriado de volta - a String, a Int ou
 a Double:
 
 Dica: certifique-se de que existe um item no índice que você está solicitando, caso
 contrário, seu código falhará – seu aplicativo simplesmente parará de funcionar.
 */
print(colors[0])
print(readings[2])


/** Se seu array for variável, você pode usar append() para adicionar novos itens.*/
colors.append("Tartan")


/**
 O tipo de dados que você adiciona deve corresponder ao que já estava lá. Os arrays têm
 funcionalidades úteis, como .count ler quantos itens estão em um array ou remove(at:)
 remover um item em um índice específico:
 */

colors.remove(at: 0)
print(colors.count)


/** Você pode verificar se um array contém um item específico usando contains(), assim: */
print(colors.contains("Octarine"))




/*
 =============================================================================================
 Dictionaries
 =============================================================================================
 */

/**
 Os dicionários armazenam vários valores de acordo com uma chave que especificamos. Por exemplo,
 poderíamos criar um dicionário para armazenar informações sobre uma pessoa:
 */
let employee = [
    "name": "Taylor",
    "job": "Singer"
]


/**
 Para ler os dados do dicionário, use as mesmas chaves que você usou ao criá-lo. O valor default
 será usado se a chave que solicitamos não existir.
 */
print(employee["name", default: "Unknown"])
print(employee["job", default: "Unknown"])



/*
 =============================================================================================
 Sets
 =============================================================================================
 Sets são semelhantes a arrays, exceto que você não pode adicionar itens duplicados e
 eles não armazenam itens em uma ordem específica. Lembre-se, o SET ignorará valores
 duplicados e não lembrará a ordem usada no array. Os Sets têm uma grande vantagem sobre
 os arrays: o uso contains() em um set é efetivamente instantâneo, não importa quantos
 itens o set contenha – mesmo um set com 10.000.000 de itens responderá instantaneamente.
 */

/** Isso faz um conjunto de números: */
var numbers1 = Set([1, 1, 3, 5, 7])
print(numbers1)


/** Adicionar itens a um SET é feito chamando seu método insert(), assim: */
numbers1.insert(10)



/*
 =============================================================================================
 Enums
 =============================================================================================
 Um enum é um conjunto de valores nomeados que podemos criar e usar para tornar nosso código
 mais eficiente e seguro.
 */


/**
 Por exemplo, poderíamos fazer uma enumeração de dias da semana conforme abaixo:
 Isso chama o novo enum Weekdaye fornece cinco casos para lidar com os cinco dias
 da semana.
 **/
enum Weekday {
    case monday, tuesday, wednesday, thursday, friday
}


/** Agora podemos criar instâncias desse enum e atribuir outros casos possíveis a ele: */
var day = Weekday.monday
day = .friday



/*
 =============================================================================================
 Type annotations
 =============================================================================================
 */

/**
 Você pode tentar forçar um tipo específico para uma nova variável ou constante usando anotação
 de tipo conforme abaixo:
 Sem a parte ": Double", Swift inferiria que é um Int, mas estamos substituindo isso e dizendo
 que é um Double.
 */
var score3: Double = 0


/** Aqui estão algumas "Type annotations com base nos tipos cobertos até agora: **/
let player: String = "Roy"
var luckyNumber: Int = 13
let pi: Double = 3.141
var isEnabled: Bool = true
var albums: Array<String> = ["Red", "Fearless"]
var user1: Dictionary<String, String> = ["id": "@twostraws"]
var books: Set<String> = Set(["The Bluest Eye", "Foundation"])


/**
 Arrays e dicionários são tão comuns que possuem uma sintaxe especial que é mais
 fácil de escrever:
 */
var albums1: [String] = ["Red", "Fearless"]
var user2: [String: String] = ["id": "@twostraws"]



/**
 Conhecer os tipos exatos de coisas é importante para criar coleções vazias. Por exemplo,
 ambos criam arrays de strings vazios:
 */
var teams: [String] = [String]()
var clues = [String]()


/**
 Os valores de um enum têm o mesmo tipo que o próprio enum, então podemos escrever isso:
 */

enum UIStyle {
    case light, dark, system
}

var style: UIStyle = .light



/*
 =============================================================================================
 Condições
 =============================================================================================
 */

/**
 Use as instruções if, else e else if para verificar uma condição e executar algum código
 conforme apropriado:
 */
let age1 = 16

if age1 < 12 {
    print("You can't vote")
} else if age1 < 18 {
    print("You can vote soon.")
} else {
    print("You can vote now.")
}


/**
 Podemos usar && para combinar duas condições, e a condição inteira só será verdadeira se as
 duas partes dentro forem verdadeiras. Alternativamente, || fará com que uma condição seja
 verdadeira se qualquer uma das subcondições for verdadeira.
 */
let temp = 26

if temp > 20 && temp < 30 {
    print("It's a nice day.")
}




/*
 =============================================================================================
 Switch statements
 =============================================================================================
 */

/**
 O Swift nos permite verificar um valor em relação a várias condições usando a sintaxe
 switch/case, conforme abaixo:
 Declarações switch devem ser exaustivas: todos os valores possíveis devem ser tratados
 para que você não perca um por acidente.
 */
enum Weather {
    case sun, rain, wind
}

let forecast = Weather.sun

switch forecast {
    case .sun:
        print("A nice day.")
    case .rain:
        print("Pack an umbrella.")
    default:
        print("Should be okay.")
        
}



/*
 =============================================================================================
 O operador condicional ternário
 =============================================================================================
 */

/**
 O operador ternário nos permite verificar uma condição e retornar um de dois valores:
 algo se a condição for verdadeira e algo se for falsa:
 Quando esse código for executado, canVote será definido como “Sim” porque age2 está
 definido como 18.
 */

let age2 = 18
let canVote = age2 >= 18 ? "Yes" : "No"




/*
 =============================================================================================
 Loops
 =============================================================================================
 */

/**
 Os loops for do Swift executam algum código para cada item em uma coleção ou em um intervalo
 personalizado. Por exemplo:
 */

let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for os in platforms {
    print("Swift works on \(os).")
}

/**
 Você também pode fazer um loop em um intervalo de números.
 */

for i in 1...12 {
    print("5 x \(i) is \(5 * i)")
}

/**
 1...12 contém os valores de 1 a 12 inclusive. Se você quiser excluir o número final, use ..< .
 */

for i in 1..<13 {
    print("5 x \(i) is \(5 * i)")
}

/**
 Dica: Se você não precisar da variável de loop, use _:
 */

var lyric = "Haters gonna"

for _ in 1...5 {
    lyric += " hate"
}

print(lyric)


/**
 Existem também loops while, que executam seu corpo de loop até que uma condição seja
 falsa, assim:
 */

var count = 10

while count > 0 {
    print("\(count)…")
    count -= 1
}

print("Go!")

/**
 Você pode usar "continue para pular a iteração do loop atual e prosseguir para a seguinte:
 */
let files = ["me.jpg", "work.txt", "sophie.jpg"]

for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture: \(file)")
}

/**
 Como alternativa, use breakpara sair de um loop e pular todas as iterações restantes.
 */



/*
 =============================================================================================
 Funções
 =============================================================================================
 */

/**
 Para criar uma nova função, escreva func seguido do nome da sua função e adicione parâmetros
 entre parênteses. Precisamos escrever "number: 5" na chamada da função, pois o nome do
 parâmetro faz parte da chamada da função.
 */

func printTimesTables(number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(number: 5)


/**
 Para retornar dados de uma função, diga ao Swift qual é o tipo e, em seguida, use a
 palavra-chave return para enviá-los de volta. Por exemplo, isso retorna uma rolagem
 de dados:
 */
func rollDice1() -> Int {
    return Int.random(in: 1...6)
}

let result = rollDice1()
print(result)



/**
 Se sua função contiver apenas uma única linha de código, você poderá remover a
 palavra-chave return:
 */

func rollDice2() -> Int {
    Int.random(in: 1...6)
}



/*
 =============================================================================================
 Retornando vários valores de funções
 =============================================================================================
 */

/**
 As tuplas armazenam um número fixo de valores de tipos específicos, o que é uma maneira
 conveniente de retornar vários valores de uma função:
 */
func getUser()-> (firstName: String, lastName: String) {
    (firstName: "Taylor", lastName: "Swift")
}

let user3 = getUser()
print("Name: \(user3.firstName) \(user3.lastName)")


/**
 Se você não precisar de todos os valores da tupla, você pode desestruturar a tupla
 para separá-la em valores individuais e, em seguida, _dizer ao Swift para ignorar alguns:
 */

let (firstName, _) = getUser()
print("Name: \(firstName)")



/*
 =============================================================================================
 Personalizando rótulos de parâmetros
 =============================================================================================
 */

/**
 Se você não quiser passar o nome de um parâmetro ao chamar uma função, coloque um sublinhado
 antes dele:
 */

func isUppercase(_ string: String) -> Bool {
    string == string.uppercased()
}

let string = "HELLO, WORLD"
let result1 = isUppercase(string)

print(result1)


/**
 Uma alternativa é escrever um segundo nome antes do primeiro: um para usar externamente e
 outro internamente. Nesse código for é usado externamente, e number é usado internamente.
 */

func printTimesTables(for number: Int) {
    for i in 1...12 {
        print("\(i) x \(number) is \(i * number)")
    }
}

printTimesTables(for: 5)



/*
 =============================================================================================
 Fornecendo valores padrão para parâmetros
 =============================================================================================
 */

/**
 Podemos fornecer valores de parâmetro padrão escrevendo um igual após o tipo e fornecendo um
 valor, como este:
 */
func greet(_ person: String, formal: Bool = false) {
    if formal {
        print("Welcome, \(person)!")
    } else {
        print("Hi, \(person)!")
    }
}

/**
 Agora podemos chamar greet()de duas maneiras:
 */
greet("Tim", formal: true)
greet("Taylor")



/*
 =============================================================================================
 Manipulando erros em funções
 =============================================================================================
 */

/**
 Para lidar com erros em funções, você precisa informar ao Swift quais erros podem ocorrer,
 escrever uma função que possa gerar erros, chamá-la e lidar com quaisquer problemas.
 
 Primeiro, defina os erros que podem ocorrer:
 */

enum PasswordError: Error {
    case short, obvious
}


/**
 Em seguida, escreva uma função que possa gerar erros. Isso é feito colocando throws no
 tipo da função e usando throw para acionar erros específicos:
 */
func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "OK"
    } else {
        return "Good"
    }
}



/**
 Agora chame a função de lançamento iniciando um bloco "do", chamando a função usando "try"
 e capturando os erros que ocorrem:
 */

let string1 = "12345"

do {
    let result = try checkPassword(string1)
    print("Rating: \(result)")
} catch PasswordError.obvious {
    print("I have the same combination on my luggage")
} catch {
    print("There was an error.")
}

/**
 Quando se trata de capturar erros, você deve sempre ter um bloco catch
 que possa lidar com todo tipo de erro.
 */



/*
 =============================================================================================
 Closures
 =============================================================================================
 */

/**
 Você pode atribuir funcionalidade diretamente a uma constante ou variável como abaixo:
 Nesse código, sayHello é uma closure – um pedaço de código que podemos passar e
 chamar sempre que quisermos.
 */

let sayHello1 = {
    print("Hi there!")
}

sayHello1()


/**
 Se você quiser que o closure aceite parâmetros, eles devem ser escritos dentro das chaves.
 O "in" é usado para marcar o fim dos parâmetros e o tipo de retorno – tudo depois disso é
 o próprio corpo do closure.
 */

let sayHello2 = { (name: String) -> String in
    "Hi \(name)!"
}

print(sayHello2("Mike"))


/**
 Closures são usados ​​extensivamente no Swift. Por exemplo, há um método array chamado filter()
 que executa todos os elementos do array por meio de um teste, e qualquer um que retorne true
 para o teste é retornado em um novo array.
 
 Podemos fornecer esse teste usando um encerramento, para que possamos filtrar um array para
 incluir apenas nomes que começam com T. Dentro da closure listamos o parâmetro filter() que
 nos passa, que é uma string do array. Também dizemos que nossa closure retorna um Boolean,
 então marcamos o início do código da closure usando "in" depois disso, todo o resto é
 código de função normal.
 */

let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]


let onlyT1 = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})
print(onlyT1)


/*
 =============================================================================================
 Closures à direita e sintaxe abreviada
 =============================================================================================
 */


/**
 Swift tem alguns truques na manga para tornar as closures mais fáceis de ler. Aqui está um
 código que filtra um array para incluir apenas nomes que começam com “T”:
 */

let team1 = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

let onlyT2 = team1.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})

print(onlyT2)


/**
 Imediatamente você pode ver que o corpo da closure tem apenas uma única linha de código,
 então podemos remover return:
 */

let onlyT3 = team.filter({ (name: String) -> Bool in
    name.hasPrefix("T")
})


/**
 filter() deve receber uma função que aceite um item de seu array e retorne true se deveria
 estar no array retornado.
 
 Como a função que passamos deve se comportar assim, não precisamos especificar os tipos em
 nossa closure. Então, podemos reescrever o código para isso:
 */

let onlyT4 = team.filter({ name in
    name.hasPrefix("T")
})


/**
 Podemos ir além usando uma sintaxe especial chamada sintaxe de closure à direita, que
 se parece com isso:
 */

let onlyT5 = team.filter { name in
    name.hasPrefix("T")
}


/**
 Por fim, o Swift pode fornecer nomes de parâmetros curtos para nós, para que nem escrevamos
 "name in" mais e, em vez disso, confiemos em um valor especialmente nomeado fornecido para
 nós: $0:
 */

let onlyT = team.filter {
    $0.hasPrefix("T")
}



/*
 =============================================================================================
 Structs
 =============================================================================================
 */

/**
 Structs nos permite criar nossos próprios tipos de dados personalizados, completos com suas
 próprias propriedades e métodos. Quando criamos instâncias de structs, fazemos isso usando um
 inicializador – o Swift nos permite tratar nossa struct como uma função, passando parâmetros
 para cada uma de suas propriedades. Ele gera silenciosamente esse inicializador de membro com
 base nas propriedades do struct. Se você quiser que o método de um struct altere uma de suas
 propriedades, marque-o como mutating.
 */

struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
    
    mutating func removeFromSale() {
        isReleased = false
    }
}

let red = Album(title: "Red", artist: "Taylor Swift")
print(red.title)
red.printSummary()



/*
 =============================================================================================
 Propriedades computadas
 =============================================================================================
 */

/**
 Uma propriedade computada calcula seu valor toda vez que é acessada. Por exemplo, podemos
 escrever uma struct Employee que rastreie quantos dias de férias restaram para esse funcionário.
 Para poder ler/escrever vacationRemaining, precisamos fornecer um getter e um setter e newValue
 é fornecido pelo Swift e armazena o valor que o usuário estava atribuindo à propriedade.
 */

struct Employee {
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



/*
 =============================================================================================
 Observadores de propriedade
 =============================================================================================
*/

/**
 Os observadores de propriedade são pedaços de código que são executados quando as propriedades
 são alteradas: são executados "didSet" quando a propriedade acabou de ser alterada e executados
 "willSet" antes da alteração da propriedade.

 Poderíamos demonstrar "didSet" fazendo uma struct Game imprimir uma mensagem quando a pontuação muda
 e "willSet" antes da mudança:
*/

struct Game {
    var score = 0 {
        willSet {
            print("Score : \(score)")
        }
        
        didSet {
            print("Score is now \(score)")
        }
    }
    
}

var game = Game()
game.score += 10
game.score -= 3



/*
 =============================================================================================
 Inicializadores personalizados
 =============================================================================================
*/

/**
 Inicializadores são funções especiais que preparam uma nova instância de struct a ser usada,
 garantindo que todas as propriedades tenham um valor inicial.

 O Swift gera um baseado nas propriedades do struct, mas você pode criar o seu próprio.
 
 Importante: os inicializadores não têm "func" antes deles e não retornam explicitamente um valor.
*/

struct Player {
    let name: String
    let number: Int

    init(name: String) {
        self.name = name
        number = Int.random(in: 1...99)
    }
}



/*
 =============================================================================================
 Controle de acesso
 =============================================================================================
*/

/**
 O Swift tem várias opções para controle de acesso dentro de structs, mas quatro são as mais comuns:

 - Use private para "não deixe nada fora do struct usar isso."
 - Use private(set) para “qualquer coisa fora do struct pode ler isso, mas não deixe que eles alterem”.
 - Use fileprivate para "não deixe nada fora do arquivo atual usar isso".
 - Use public para “deixe qualquer um, em qualquer lugar usar isso”.
 Por exemplo a struct BankAccount abaixo:
 
 Como usamos private(set), ler funds de fora da estrutura é bom, mas escrever não é possível.
*/

struct BankAccount {
    private(set) var funds = 0

    mutating func deposit(amount: Int) {
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


/*
 =============================================================================================
 Propriedades e métodos estáticos
 =============================================================================================
*/

/**
 O Swift suporta propriedades e métodos estáticos, permitindo que você adicione uma propriedade
 ou método diretamente ao próprio struct ao invés de uma instância do struct:
 
 Usando essa abordagem, em todos os lugares que precisamos verificar ou exibir algo como o número
 da versão do aplicativo, podemos ler AppData.version.
 */

struct AppData {
    static let version = "1.3 beta 2"
    static let settings = "settings.json"
}



/*
 =============================================================================================
 Classes
 =============================================================================================
*/

/**
 As classes nos permitem criar tipos de dados personalizados e são diferentes das structs
 de cinco maneiras.

 A primeira diferença é que podemos criar classes herdando funcionalidades de outras classes.
*/

class Employee1 {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("I work \(hours) hours a day.")
    }
}

/**
 Se uma classe filha quiser alterar um método de uma classe pai, ela deve usar override:
*/

class Developer: Employee1 {
    //Utilizando override para alterar a classe printSummary herdada de Employee1
    override func printSummary() {
        print("I spend \(hours) hours a day searching Stack Overflow.")
    }
    
    func work() {
        print("I'm coding for \(hours) hours.")
    }
}

let novall = Developer(hours: 8)
novall.work()
novall.printSummary()


/**
 A segunda diferença é que os inicializadores são mais complicados com classes.
 Há muita complexidade aqui, mas há três pontos principais:

 1 - Swift não irá gerar um inicializador de membro para classes.
 
 2 - Se uma classe filha tiver inicializadores personalizados, ela sempre deve
 chamar o inicializador do pai depois de terminar de configurar suas próprias
 propriedades.
 
 3 - Se uma subclasse não tiver inicializadores, ela herdará automaticamente os
 inicializadores de sua classe pai. Por exemplo:
*/

class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

class Car: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

/**
 "super" nos permite chamar métodos que pertencem à nossa classe pai, como seu inicializador.

 A terceira diferença é que todas as cópias de uma instância de classe compartilham seus dados,
 o que significa que as alterações feitas em uma delas alterarão automaticamente as outras cópias.

 Por exemplo:
*/

class Singer {
    var name = "Adele"
}

var singer1 = Singer()
var singer2 = singer1
singer2.name = "Justin"
print(singer1.name)
print(singer2.name)


/**
 Isso imprimirá “Justin” para ambos – embora tenhamos alterado apenas um deles, o outro também
 mudou. Em comparação, as cópias de struct não compartilham seus dados.

 A quarta diferença é que as classes podem ter um desinicializador que é chamado quando a última
 referência a um objeto é destruída.

 Assim, poderíamos criar uma classe que imprima uma mensagem quando for criada e destruída:
*/

class User1 {
    let id: Int

    init(id: Int) {
        self.id = id
        print("User \(id): I'm alive!")
    }

    deinit {
        print("User \(id): I'm dead!")
    }
    
    
}

for i in 1...3 {
    let user = User1(id: i)
    print("User \(user.id): I'm in control!")
}


/**
 A diferença final é que as classes nos permitem alterar as propriedades das variáveis
 mesmo quando a própria classe é constante:
 
 Como resultado disso, as classes não precisam da palavra-chave  "mutating" com métodos
 que alteram seus dados.
*/

class User2 {
    var name = "Paul"
}

let user4 = User2()
user4.name = "Taylor"
print(user4.name)



/*
 =============================================================================================
 Protocols
 =============================================================================================
*/

/**
 Os protocolos definem a funcionalidade que esperamos que um tipo de dados suporte, e o Swift
 garante que nosso código siga essas regras.

 Por exemplo, poderíamos definir um protocolo Vehicle.
 
 Isso lista os métodos necessários para que esse protocolo funcione, mas não contém nenhum código
 – estamos especificando apenas nomes de métodos, parâmetros e tipos de retorno.

 Depois de ter um protocolo, você pode ajustar os tipos de dados a ele implementando a funcionalidade
 necessária. Por exemplo, podemos fazer uma struct Car que esteja em conformidade com Vehicle.
 
 Todos os métodos listados em Vehicle devem existir exatamente em Car, com o mesmo nome, parâmetros
 e tipos de retorno.

 Agora você pode escrever uma função que aceita qualquer tipo de tipo que esteja em conformidade
 com Vehicle, porque o Swift sabe que implementa tanto estimateTime() e travel():
 
 Os protocolos também podem exigir propriedades, então podemos exigir propriedades para quantos
 assentos os veículos têm e quantos passageiros eles têm atualmente:
 
 Isso adiciona duas propriedades: uma marcada com "get" isso pode ser uma propriedade constante ou
 computada, e outra marcada com "get set" isso pode ser uma variável ou uma propriedade computada
 com um getter e setter.

 Agora todos os tipos em conformidade devem adicionar implementações dessas duas propriedades,
 como esta para Car.
 
 Dica: Você pode se adequar a quantos protocolos precisar, apenas listando-os separados por vírgula.
 
*/

protocol Vehicle1 {
    var name: String { get }
    var currentPassengers: Int { get set }
    func estimateTime(for distance: Int) -> Int
    func travel(distance: Int)
}

struct Car1: Vehicle1 {
    let name = "Car"
    var currentPassengers = 1
    
    func estimateTime(for distance: Int) -> Int {
        distance / 50
    }

    func travel(distance: Int) {
        print("I'm driving \(distance)km.")
    }
}

func commute(distance: Int, using vehicle: Vehicle1) {
    if vehicle.estimateTime(for: distance) > 100 {
        print("Too slow!")
    } else {
        vehicle.travel(distance: distance)
    }
}

let car = Car1()
commute(distance: 100, using: car)



/*
 =============================================================================================
 Extensões
 =============================================================================================
*/

/**
 1 - Extensões nos permitem adicionar funcionalidade a qualquer tipo. Por exemplo, as strings do
 Swift têm um método para cortar espaços em branco e novas linhas, mas é bem longo para que
 possamos transformá-lo em uma extensão.
 
 2 - Se você quiser alterar um valor diretamente em vez de retornar um novo valor, marque seu método
 "mutating".
 
 3 - As extensões também podem adicionar propriedades computadas aos tipos.
 
 4 - O método components(separatedBy:) divide uma string em um array de strings usando um limite de
 nossa escolha, que neste caso são novas linhas.
 
 Agora podemos usar essa propriedade com todas as strings:
 
*/

//1 Criando novos método em String.
extension String {
    //3 Adicionando propriedades computadas
    var lines: [String] {
           //4 Utilizando o método components(separatedBy:) para dividir a string.
           self.components(separatedBy: .newlines)
       }
    
    func trimmed() -> String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    //2 marcando método como mutating para alterar valor.
    mutating func trim() {
           self = self.trimmed()
    }
}

var quote1 = "   The truth is rarely pure and never simple   "
let trimmed = quote1.trimmed()
quote1.trim()

let lyrics = """
But I keep cruising
Can't stop, won't stop moving
"""

print(lyrics.lines.count)



/*
 =============================================================================================
 Entensões de protocolo
 =============================================================================================
*/

/**
 As extensões de protocolo estendem um protocolo inteiro para adicionar propriedades computadas
 e implementações de métodos, de modo que quaisquer tipos em conformidade com esse protocolo as
 obtêm.

 Por exemplo, Array, Dictionary, e Set todos estão em conformidade com o Collection protocolo,
 então podemos adicionar uma propriedade computada a todos os três assim:
*/

extension Collection {
    var isNotEmpty: Bool {
        isEmpty == false
    }
}

/**
 Agora podemos colocá-lo em uso:
*/

let guests = ["Mario", "Luigi", "Peach"]

if guests.isNotEmpty {
    print("Guest count: \(guests.count)")
}

/**
 Essa abordagem significa que podemos listar os métodos necessários em um protocolo e adicionar
 implementações padrão daqueles dentro de uma extensão de protocolo. Todos os tipos em conformidade
 podem usar essas implementações padrão ou fornecer suas próprias conforme necessário.
*/



/*
 =============================================================================================
 Opcionais
 =============================================================================================
*/

/**
 Opcionais representam a ausência de dados – por exemplo, eles distinguem entre um inteiro com
 o valor 0 e nenhum valor.

 Para ver opcionais em ação, pense neste código:
*/

let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposite = opposites["Peach"]

/**
 Que tenta ler o valor anexado à chave “Peach”, que não existe, então não pode ser uma string
 normal. A solução do Swift é chamada de optionals , o que significa dados que podem estar
 presentes ou não.

 Uma string opcional pode ter uma string esperando por nós, ou pode não haver nada – um valor
 especial chamado nil, que significa “sem valor”. Qualquer tipo de dado pode ser opcional,
 incluindo Int, Double e Bool, bem como instâncias de enums, structs e classes.

 O Swift não nos permite usar dados opcionais diretamente, porque eles podem estar vazios. Isso
 significa que precisamos desembrulhar o opcional para usá-lo – precisamos olhar para dentro
 para ver se há um valor e, se houver, retirá-lo e usá-lo.

 Swift nos dá várias maneiras de desembrulhar opcionais, mas o que você verá mais se parece
 com isso:
*/

if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}

/**
 Isso lê o valor opcional do dicionário e, se tiver uma string dentro, é desempacotado – a
 string dentro é colocada na constante marioOpposite e não é mais opcional. Como conseguimos
 desempacotar o opcional, a condição é um sucesso, então o código print() é executado.
*/



/*
 =============================================================================================
 Desembrulhando opcionais com proteção
 =============================================================================================
*/

/*
 Swift tem uma segunda maneira de desempacotar opcionais, chamada guard let, que é muito
 semelhante if let, exceto que inverte as coisas: if let executa o código dentro de suas
 chaves se o opcional tiver um valor e guard let executa o código se o opcional não tiver
 um valor.

 Se parece com isso:
*/

func printSquare(of number: Int?) {
    guard let number = number else {
        print("Missing input")
        return
    }

    print("\(number) x \(number) is \(number * number)")
}


/**
 Se você usar guard para verificar se as entradas de uma função são válidas, o Swift exigirá
 que você use return se a verificação falhar. No entanto, se o opcional que você está
 desempacotando tiver um valor dentro, você poderá usá-lo após a conclusão do código guard.

 Dica: Você pode usar guard com qualquer condição, incluindo aquelas que não abrem opcionais.
*/



/*
 =============================================================================================
 Nil coalescing
 =============================================================================================
*/

/**
 O Swift tem uma terceira maneira de desempacotar opcionais, chamada de operador nil coalescing
 – ele desempacota um opcional e fornece um valor padrão se o opcional estiver vazio:
*/

let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"


/**
 O operador nil coalescing é útil em muitos lugares em que opcionais são criados. Por exemplo,
 criar um inteiro a partir de uma string retorna um opcional Int? porque a conversão pode ter
 falhado. Aqui podemos usar nil coalescing para fornecer um valor padrão:
*/

let input = ""
let number1 = Int(input) ?? 0
print(number1)


/*
 =============================================================================================
 Optional chaining
 =============================================================================================
*/

/**
 Optional chaining lê opcionais dentro de opcionais, assim:
*/

let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")

/**
 O optional chaining existe na linha 1397: um ponto de interrogação seguido por mais código.
 Ele nos permite dizer “se o opcional tiver um valor dentro, desembrulhe-o então…” e adicione
 mais código. No nosso caso, estamos dizendo “se obtivermos um elemento aleatório do array,
 coloque-o em maiúscula”.
*/



/*
 =============================================================================================
 Optional try?
 =============================================================================================
*/

/**
 Ao chamar uma função que pode gerar erros, podemos usar try? para converter seu resultado em um
 opcional contendo um valor em caso de sucesso ou não nil.

 Veja como fica:
*/

enum UserError: Error {
    case badID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UserError.networkFailed
}

if let user = try? getUser(id: 23) {
    print("User: \(user)")
}

/**
 A função getUser() sempre lançará networkFailed, mas não nos importamos com o que foi lançado - tudo o que nos importa é se a chamada enviou de volta um usuário ou não.
*/
