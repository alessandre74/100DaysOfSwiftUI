import Cocoa

/**
 =============================================================================================
 MARK - COMO USAR ANOTAÇÕES DE TIPO
 =============================================================================================
*/

let surname: String = "Lasso"
var score: Int = 0

//String - contém texto
let playerName : String = "Roy"

//Int - contém número inteiros
var luckyNumber: Int = 13

//Double - contém números decimais
let pi: Double = 3.141

//Bool - é verdadeiro ou falso
var isAuthenticated: Bool = true

//Array - contém muitos valores diferentes, todos na ordem em que você os adiciona. Isso deve ser especilizado, como [String].
var albuns: [String] = ["Red", "Fearless"]

//Dictionary - contém muitos valores diferentes, você decide como os dados devem ser acessados. Deve ser especializado, como [String: Int]
var user: [String: String] = ["id": "@twostraws"]

//Set - contém muitos valores diferentes, mas os armazena em uma ordem otimizada para verificar o que contém. Isso deve ser especializado como, Set<String>.
var books: Set<String> = Set(["The Bluest Eye", "Foundation", "Girl, Woman, Other"])

//Conhecer todos esses tipos é importante para momentos em que você não deseja fornecer valores iniciais. Por exemplo, isso cria uma matriz de strings. Porém a anotação de tipo não é necessária, porque o Swift pode ver que você está atribuindo uma matriz de strings
var soda: [String] = ["Coke", "Pepsi", "Irn-Bru"]

//No entanto, se você quiser criar uma matriz vazia de strings, precisará saber o tipo:
var teans: [String] = [String]()

/**
 Além de todos esses, existem enums . Os enums são um pouco diferentes dos outros porque nos permitem criar novos tipos próprios, como um enum contendo dias da semana, um enum contendo qual tema de UI o usuário deseja ou até mesmo um enum contendo qual tela está sendo exibida no momento nosso aplicativo.

 Os valores de um enum têm o mesmo tipo que o próprio enum, então poderíamos escrever algo assim:
 */

var cities: [String] = []

//Eu prefiro usar a inferência de tipos o máximo possível, então eu escreveria isso:
var clues = [String]()


/**
 Além de todos esses, existem enums . Os enums são um pouco diferentes dos outros porque nos permitem criar novos tipos próprios, como um enum contendo dias da semana, um enum contendo qual tema de UI o usuário deseja ou até mesmo um enum contendo qual tela está sendo exibida no momento nosso aplicativo.

 Os valores de um enum têm o mesmo tipo que o próprio enum, então poderíamos escrever algo assim:
 */

enum UIStyle {
  case light, dark, system
}

var style: UIStyle = UIStyle.light
style = .dark

/**
 Isso é o que permite que o Swift remova o nome do enum para atribuições futuras, para que possamos escrever style = .dark- ele sabe que qualquer novo valor para style deve ser algum tipo UIStyle.

 Agora, há uma boa chance de você perguntar quando você deve usar anotações de tipo, então pode ser útil para você saber que eu prefiro usar inferência de tipo tanto quanto possível, o que significa que eu atribuo um valor a uma constante ou variável e Swift escolhe o tipo correto automaticamente. Às vezes, isso significa usar algo como var score = 0.0 para que eu obtenha um arquivo Double.

 A exceção mais comum a isso é com constantes para as quais ainda não tenho um valor. Veja bem, o Swift é realmente inteligente: você pode criar uma constante que ainda não tem um valor, mais tarde fornecer esse valor, e o Swift garantirá que não a usemos acidentalmente até que um valor esteja presente. Também garantirá que você defina o valor apenas uma vez, para que permaneça constante.

 Por exemplo:
 */

let username: String
username = "@twostraws"
print(username)

/**
 Esse código é legal: estamos dizendo username que conterá uma string em algum momento e fornecemos um valor antes de usá-lo. Se a linha de atribuição – username = "@twostraws"– estivesse faltando, então Swift se recusaria a construir nosso código porque username não teria um valor, e da mesma forma se tentássemos definir um valor para username uma segunda vez, Swift também reclamaria.

Esse tipo de código requer uma anotação de tipo, pois sem um valor inicial atribuído, o Swift não sabe que tipo de dados username conterá.

Independentemente de você usar inferência de tipo ou anotação de tipo, há uma regra de ouro: o Swift deve sempre saber quais tipos de dados suas constantes e variáveis ​​contêm. Isso é o cerne de ser uma linguagem de tipo seguro e nos impede de fazer coisas sem sentido como 5 + true ou semelhantes.

Importante: Embora a anotação de tipo possa nos permitir substituir a inferência de tipo do Swift até certo ponto, nosso código finalizado ainda deve ser possível. Por exemplo, isso não é permitido:

let score: Int = "Zero" // o código da erro

Swift simplesmente não pode converter “Zero” para um inteiro para nós, mesmo com uma anotação de tipo solicitando, então o código simplesmente não será compilado.
 */


/**
 =============================================================================================
 CHECKPOINT 2
 =============================================================================================
*/

let people = ["Mike", "Mike", "Silvia", "Bruna", "Silvana", "Alesandre"]
print("Array original: \(people.sorted())")
print("Número de Itens: \(people.count)")
print("")

let people1 = Set(people)
print("Eliminando duplicatas do array original: \(people1.sorted())")
print("Número de itens únicos: \(people1.count)")
