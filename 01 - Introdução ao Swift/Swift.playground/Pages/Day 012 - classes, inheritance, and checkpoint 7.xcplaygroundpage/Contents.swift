import Cocoa

/**
 =============================================================================================
 COMO CRIAR SUAS PRÓPRIAS CLASSES.
 =============================================================================================

 O Swift usa structs para armazenar a maioria de seus tipos de dados, incluindo String, Int, Doublee Array, mas há outra maneira de criar tipos de dados personalizados chamados classes . Eles têm muitas coisas em comum com structs, mas são diferentes em locais importantes.

 Primeiro, as coisas que classes e structs têm em comum incluem:

 * Você começa a criar e nomeá-los.
 * Você pode adicionar propriedades e métodos, incluindo observadores de propriedade e controle de acesso.
 * Você pode criar inicializadores personalizados para configurar novas instâncias como quiser.

 No entanto, as classes diferem das estruturas em cinco lugares principais:

 1 - Você pode fazer com que uma classe se baseie na funcionalidade de outra classe, obtendo todas as suas propriedades e métodos como ponto de partida. Se você deseja substituir seletivamente alguns métodos, também pode fazer isso.

 2 - Por causa desse primeiro ponto, o Swift não gerará automaticamente um inicializador de membro para classes. Isso significa que você precisa escrever seu próprio inicializador ou atribuir valores padrão a todas as suas propriedades.

 3 - Quando você copia uma instância de uma classe, ambas as cópias compartilham os mesmos dados – se você alterar uma cópia, a outra também será alterada.

 4 - Quando a cópia final de uma instância de classe é destruída, o Swift pode opcionalmente executar uma função especial chamada deinitializer .

 5 - Mesmo se você tornar uma classe constante, ainda poderá alterar suas propriedades, desde que sejam variáveis.

 Na superfície, eles provavelmente parecem bastante aleatórios, e há uma boa chance de você estar se perguntando por que as classes são necessárias quando já temos estruturas.

 No entanto, SwiftUI usa classes extensivamente, principalmente para o ponto 3: todas as cópias de uma classe compartilham os mesmos dados. Isso significa que muitas partes do seu aplicativo podem compartilhar as mesmas informações, de modo que, se o usuário alterar o nome em uma tela, todas as outras telas serão atualizadas automaticamente para refletir essa alteração.

 Os outros pontos são importantes , mas são de uso variado:

 1 - Ser capaz de construir uma classe com base em outra é realmente importante na estrutura de interface do usuário mais antiga da Apple, UIKit, mas é muito menos comum em aplicativos SwiftUI. No UIKit era comum ter hierarquias de classes longas, onde a classe A era construída na classe B, que era construída na classe C, que era construída na classe D, etc.

 2 - A falta de um inicializador de membro é irritante, mas espero que você possa ver por que seria complicado implementar, uma vez que uma classe pode ser baseada em outra - se a classe C adicionasse uma propriedade extra, ela quebraria todos os inicializadores para C, B e A.

 3 - Ser capaz de alterar as variáveis ​​de uma classe constante vincula-se ao comportamento de múltiplas cópias de classes: uma classe constante significa que não podemos alterar para qual pote nossa cópia aponta, mas se as propriedades forem variáveis, ainda podemos alterar os dados dentro do pote. Isso é diferente de structs, onde cada cópia de um struct é única e contém seus próprios dados.

 4 - Como uma instância de uma classe pode ser referenciada em vários lugares, torna-se importante saber quando a cópia final foi destruída. É aí que entra o desinicializador: ele nos permite limpar quaisquer recursos especiais que alocamos quando a última cópia desaparece.

 Antes de terminarmos, vamos ver apenas uma pequena fatia de código que cria e usa uma classe:
 */

class Game {
    var score = 0 {
        didSet {
            print("A pontuação agora é \(score)")
        }
    }
}

var newGame = Game()
newGame.score += 10

/**
 Sim, a única diferença entre isso e um struct é que ele foi criado usando classem vez de struct– todo o resto é idêntico. Isso pode fazer as classes parecerem redundantes, mas confie em mim: todas as cinco diferenças são importantes.

 Entrarei em mais detalhes sobre as cinco diferenças entre classes e structs nos capítulos seguintes, mas agora a coisa mais importante a saber é o seguinte: structs são importantes, assim como as classes – você precisará de ambas ao usar o SwiftUI.
 */

/**
 =============================================================================================
 COMO FAZER UMA CLASSE HERDAR DE OUTRA.
 =============================================================================================
 */

// Classe Employee nesse caso chamada de pai ou super.
class Emplyee {
    let hours: Int

    init(hours: Int) {
        self.hours = hours
    }

    func printSummary() {
        print("Eu trabalho \(hours) horas por dia.")
    }
}

/**
 Criando duas subclasses de Employee. Veja que criamos a classe como final que siginifica que Developer e Manager podem herdar de outras classes mas nenhuma classe pode herdar delas.
 */

final class Developer: Emplyee {
    func work() {
        print("Estou escrevendo código por \(hours) horas.")
    }
}

final class Manager: Emplyee {
    func work() {
        print("Vou ás reuniões por \(hours) horas. ")
    }

    override func printSummary() {
        print("Sou um desenvolvedor que às vezes trabalha \(hours) horas por dia, mas outras vezes passa horas discutindo se o código deve ser recuado usando tabs ou espaços.")
    }
}

let robert = Developer(hours: 8)
let joseph = Manager(hours: 20)
robert.work()
joseph.work()

// Criamos um método printSummary() na classe pai Employee, então a subclasse developer já pode herdar esse método e utilizar.
let novall = Developer(hours: 8)
novall.printSummary()

/**
 Swift é inteligente sobre como as substituições de métodos funcionam: se sua classe pai tem um work()método que não retorna nada, mas a classe filha tem um work()método que aceita uma string para designar onde o trabalho está sendo feito, isso não requer overrideporque você não está substituindo o método pai.

 Dica: Se você tiver certeza de que sua classe não deve suportar herança, poderá marcá-la como final. Isso significa que a própria classe pode herdar de outras coisas, mas não pode ser usada para herdar – nenhuma classe filha pode usar uma classe final como pai.
 */

/**
 =============================================================================================
 COMO ADICIONAR INICIALIZADORES PARA CLASSES.
 =============================================================================================
 */

// Criando classe Vehicle pai com inicializador
class Vehicle {
    let isElectric: Bool

    init(isElectric: Bool) {
        self.isElectric = isElectric
    }
}

// Criando a subclasse Car de Vehicle. Veja que devemos implementar o init da classe pai senão vai dar erro. Se a subclasse não precisar de um init não precisamos implementar o init da classe pai pois o swift implementa automaticamente.
class Car1: Vehicle {
    let isConvertible: Bool

    init(isElectric: Bool, isConvertible: Bool) {
        self.isConvertible = isConvertible
        super.init(isElectric: isElectric)
    }
}

/**
 superé outro daqueles valores que o Swift fornece automaticamente para nós, semelhante a self: ele nos permite chamar métodos que pertencem à nossa classe pai, como seu inicializador. Você pode usá-lo com outros métodos se quiser; não está limitado a inicializadores.

 Agora que temos um inicializador válido em ambas as nossas classes, podemos criar uma instância Car assim:
 */

let teslaX1 = Car1(isElectric: true, isConvertible: false)

// Se uma subclasse não tiver seus próprios inicializadores, ela herdará automaticamente os inicializadores de sua classe pai.

class Car2: Vehicle {
    let isConvertible = false
}

let teslaX2 = Car2(isElectric: true)

/**
 =============================================================================================
 COMO COPIAR CLASSES.
 =============================================================================================

 Classes são reference types, ou seja se fizermos uma copia de classe tudo que alteramos em uma reflte na outra. Se quiser fazer uma copia segura de uma classe sem refletir podemos criar na classe que será copiada um método que copia ela mesma, na verdade é uma nova instância dela e não uma copia.
 */

class User {
    var username = "Anonymous"

    func copy() -> User {
        let user = User()
        user.username = username
        return user
    }
}

// Criando uma instância de User()
var user1 = User()

// Fazendo uma cópia de user, assim teremos a referência.
var user2 = user1

/**
 Criando uma nova instância de User(), assim não teremos o problema ter a referência pois estamos criando uma nova instância e não fazendo uma copia.
 */
var user3 = User()

// Criando uma nova instância a partir de um método copy da classe que queremos copia mas não queremos ter a referência.
var user4 = user1.copy()

user2.username = "Taylor"
user3.username = "Taylor Swift"
user4.username = "Taylor Swift Blonde"

print(user1.username)
print(user2.username)
print(user3.username)
print(user4.username)

/**
 =============================================================================================
 COMO CRIAR UM DESINICIALIZADOR PARA UMA CLASSE.
 =============================================================================================
 O deinit vai ser chamdo somente depois de todas as instâncias sereme destruídas. No caso abaixo ela só será chamada depois que a instância de peoples for destruída com peoples.removeAll() e logo em seguida todas as mensagens das instâncias serão exibidas.
 */

class People {
    let id: Int

    init(id: Int) {
        self.id = id
        print("Pessoa \(id): Eu estou ativo!")
    }

    deinit {
        print("Pessoa \(id): Eu estou desativo!")
    }
}

var peoples = [People]()

for i in 1 ... 3 {
    let people = People(id: i)
    print("Pessoa \(people.id): Eu estou no controle!")
    peoples.append(people)
}

print("O Loop foi finalizado!")
peoples.removeAll()
print("O Array está limpo!")

/*
 =============================================================================================
 COMO TRABALHAR COM VARIÁVEIS DENTRO DE CLASSES.
 =============================================================================================
 Uma constante normalmente não pode ser alterada, porém se definirmos na classe uma propriedade
 como "var" e depois na instância da mesma declaramos como uma "let" podemos modificala, o que
 acontece é que estamos mudando o seu valor mas não para onde esta apontando o endereço de memória,
 veja que nesse caso se a classe tiver outras cópias elas serão modificadas pois apontam para o
 mesmo endereço de memória. Se definirmos na classe como "let", ai sim ela vai se comportar como
 uma constante mesmo que na instância declararmos como "var" e o xcode vai acusar erro.
 */

class Player {
    var name = "Paul"
}

let player = Player()
player.name = "Taylor"
print(player.name)

/**
 Isso cria uma Userinstância constante, mas depois a altera – altera o valor constante. Isso é ruim, certo?

 Exceto que não altera o valor constante. Sim, os dados dentro da classe foram alterados, mas a instância da classe em si – o objeto que criamos – não mudou e, de fato , não pode ser alterada porque a tornamos constante.

 Pense assim: criamos um ponto de sinalização constante apontando para um Player, mas apagamos o crachá desse Player e escrevemos um nome diferente. O Player em questão não mudou – a pessoa ainda existe – mas uma parte de seus dados internos mudou .

 Agora, se tivéssemos tornado a ropriedade name uma constante usando let, então ela não poderia ser alterada – temos uma placa de sinalização constante apontando para um Player, mas escrevemos seu nome em tinta permanente para que não possa ser apagado.

 Em contraste, o que acontece se fizermos a instância "player" e a propriedade name de "var"? Agora poderíamos mudar a propriedade, mas também poderíamos mudar para uma instância de "Player" totalmente nova se quiséssemos. Para continuar a analogia do letreiro, seria como virar o letreiro para apontar para uma pessoa totalmente diferente.

 Experimente com este código:
 */

class Dog {
    var name = "Mike"
}

var dog = Dog()
dog.name = "Maikou"
dog = Dog()
print(dog.name)

/**
 Isso acabaria imprimindo “Mike”, porque mesmo mudando namepara “Maikou”, substituímos todo o objeto "Dog" por um novo, redefinindo-o de volta para “Mike”.

 A variação final é ter uma instância variável e propriedades constantes, o que significa que podemos criar uma nova "Dog" se quisermos, mas uma vez feito isso, não podemos alterar suas propriedades.

 Assim, terminamos com quatro opções:

 1 - Instância constante, propriedade constante – uma placa de sinalização que sempre aponta para o mesmo usuário, que sempre tem o mesmo nome.

 2 - Instância constante, propriedade variável – uma placa de sinalização que sempre aponta para o mesmo usuário, mas seu nome pode mudar.

 3 - Instância variável, propriedade constante – uma placa de sinalização que pode apontar para diferentes usuários, mas seus nomes nunca mudam.

 4 - Instância variável, propriedade variável – uma placa de sinalização que pode apontar para diferentes usuários, e esses usuários também podem alterar seus nomes.

 Isso pode parecer terrivelmente confuso e talvez até pedante. No entanto, serve a um propósito importante devido à maneira como as instâncias de classe são compartilhadas.

 Digamos que você tenha recebido uma instância "Dog". Sua instância é constante, mas a propriedade dentro dela foi declarada como uma variável. Isso informa não apenas que você pode alterar essa propriedade se desejar, mas, mais importante, informa que há a possibilidade de a propriedade ser alterada em outro lugar - essa classe que você possui pode ser uma cópia de outro lugar e, como a propriedade é variável, significa que alguma outra parte do código pode alterá-lo de surpresa.

 Quando você vê propriedades constantes, significa que você pode ter certeza de que nem seu código atual nem qualquer outra parte do seu programa pode alterá-lo, mas assim que você estiver lidando com propriedades de variáveis ​​- independentemente de a instância da classe em si ser constante ou não - abre a possibilidade de que os dados possam mudar sob seus pés.

 Isso é diferente de structs, porque structs constantes não podem ter suas propriedades alteradas, mesmo que as propriedades tenham se tornado variáveis. Espero que agora você possa ver por que isso acontece: structs não têm toda a coisa de sinalização acontecendo, eles mantêm seus dados diretamente. Isso significa que, se você tentar alterar um valor dentro do struct, também estará alterando implicitamente o próprio struct, o que não é possível porque é constante.

 Uma vantagem de tudo isso é que as classes não precisam usar a mutatingpalavra-chave com métodos que alteram seus dados. Essa palavra-chave é realmente importante para structs porque structs constantes não podem ter suas propriedades alteradas, não importa como foram criadas, então quando Swift nos vê chamando um mutatingmétodo em uma instância de struct constante, ele sabe que isso não deveria ser permitido.

 Com classes, como a própria instância foi criada não importa mais – a única coisa que determina se uma propriedade pode ser modificada ou não é se a própria propriedade foi criada como uma constante. Swift pode ver isso por si só olhando como você fez a propriedade, então não há mais necessidade de marcar o método especialmente.
 */

/**
 =============================================================================================
 CHECKPOINT 7.
 =============================================================================================
 */

class Animal {
    var legs = 4
}

class Dogg: Animal {
    func speack() {
        print("Latido de cachorro!")
    }
}

class Cat: Animal {
    let isTame: Bool

    init(isTame: Bool) {
        self.isTame = isTame
    }

    func speak() {
        print("Gato mia!")
    }
}

class Corgi: Dogg {
    override func speack() {
        print("Latido de Corgi!")
    }
}

class Poodle: Dogg {
    override func speack() {
        print("Latido de Poodle")
    }
}

class Persian: Cat {
    override func speak() {
        print("Persian mia!")
    }
}

class Lion: Cat {
    override func speak() {
        print("O leão rugi!")
    }
}

class Mac {
    var ano: Int
    var modelo: String

    init(modelo: String, ano: Int) {
        self.ano = ano
        self.modelo = modelo
    }
}

// Teste referência classe

var myMac = Mac(modelo: "MacBook Pro", ano: 2022)
var sisterMac = Mac(modelo: "MacBook Air", ano: 2022)

print("==============================")

print(myMac.ano)
print(sisterMac.ano)

myMac.ano = 2020

print("==============================")

print(myMac.ano)
print(sisterMac.ano)

myMac = sisterMac

print("==============================")

print(myMac.ano)
print(sisterMac.ano)

sisterMac.ano = 2018

print("==============================")

print(myMac.ano)
print(sisterMac.ano)
