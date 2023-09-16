import Cocoa

/**
 =============================================================================================
 COMO ARMAZENAR DADOS ORDENADOS EM ARRAYS
 =============================================================================================
 */

/**
 não podemos inserir dados numérico em um array do tipo string e também não podemos misturalos pois são tipo diferentes.
 */

// Criando array beatles e inserindo dados
var beatles = ["John", "Paul", "George", "Ringo"]
beatles.append("Allen")
beatles.append("Adrina")
beatles.append("Noval")
beatles.append("Vivian")

// Criando array numbers e selecionando a posição 1
let numbers = [4, 8, 15, 16, 23, 42]
numbers[1] // retorna 8

// Criando o array temperatures e selecionando a posição 1
var temperatures = [25.3, 28.2, 26, 4]
temperatures[1] // retorna 28.3

// 1° forma de criar um array vazio, inserir dados e selecionar a posição 1.
var scores = Array<Int>()
scores.append(100)
scores.append(80)
scores.append(85)
scores[1] // retorna 80

// 2° forma de criar um array vazio e inserir inserir dados.
var albuns = [String]()
albuns.append("Folklore")
albuns.append("Fearless")
albuns.append("Red")

// Iniciando um array com dados o swift sabe por si só o tipo do array.
var people = ["Mike"]
people.append("Silvia")
people.append("Bruna")
people.append("Silvana")
people.append("Alessandre")

// Retornando a quantidade de itens de um array.
beatles.count // retorna 8
temperatures.count // retorna 4
scores.count // retorna 3
albuns.count // retorna 3
people.count // retorna 5

// Removendo itens de um array com remove(at:) para remover um item ou removeAll() para remover todos os itens.
var characteres = ["Lana", "Pam", "Ray", "Sterling"]
characteres.remove(at: 2) // retorna Ray
characteres.removeAll() // retorna [] array vazio pois remove tudo

// Verificando se o array tem um item especifico com cotains retorna true caso tenha ou false caso nào tenha.
let bondMovies = ["Casino Royale", "Spectre", "No Time To Die"]
bondMovies.contains("Frozen") // retona false pois não achou "Fronzen"

/**
 Classificando um array, retorna um novo array ordenado, alfabeticamente para string e numericamente para números. A matriz original fica inalterada.
 */
let cities = ["London", "Tokyo", "Rome", "Budapest"]
cities.sorted() // retorna o array em ordem alfabética

/**
 Revertendo um array com reversed(). Quando você inverte um array, o Swift é muito inteligente – ele não faz o trabalho de reorganizar todos os itens, mas apenas lembra para si mesmo que você quer que os itens sejam revertidos. Então, quando você atribuir o resultado de presidents.reversed() a uma variável precisa utilizar um for para ver o array revertido. Exemplo:
 for president in presidents {
   print(president)
 }

 ou assim

 for (index, value) in reversedPresidents.enumerated(){
   print(index, value)
 }
 */
let presidents = ["Bush", "Obama", "Trump", "Biden"]
presidents.reversed() // retorna Biden, Trump, Obama, Busch, mas precisa de um for para ver o resultado.

/**
 =============================================================================================
 COMO ARMAZENAR E ENCONTRAR DADOS EM DICIONÁRIOS
 =============================================================================================
 */

// Criando um dicionário e definindo seu conteúdo com chaves e valores.
let employee = [
    "name": "Taylor Swift",
    "job": "Singer",
    "location": "Nashville",
]

// Acessando os dados do dicionário pela chave, o parâmetro default é para caso não tenha conteúdo e não de erro.
employee["name", default: "Unknown"]
employee["job", default: "Unknown"]
employee["location", default: "Unknown"]

/*
 Podemos usar outros tipos de dados para qualquer um deles. Por exemplo, podemos rastrear quais alunos se formaram
 na escola usando strings para nomes e booleanos para seu status de graduação:
 */

let hasGraduated = [
    "Eric": false,
    "Maeve": true,
    "Otis": false,
]

/**
 Também podemos rastrear anos em que as Olimpíadas ocorreram junto com seus locais:
 */

let olympics = [
    2012: "London",
    2016: "Rio de Janeiro",
    2021: "Tokyo",
]
olympics[2012, default: "Unknown"] // Acessando a chave 2012 retorna "London"

/**
 Criando um dicionário vazio com tipos explícitos e depois definindo o valor das chaves uma a uma.
 */

var heights = [String: Int]()
heights["Yao Ming"] = 229
heights["Shaquille O'Neal"] = 216
heights["Lebron James"] = 206

heights["Yao Ming", default: 0] // acessando conteúdo da chave "Yao Ming".
heights["Shaquille O'Neal", default: 0] // acessando conteúdo da chave "Shaquille O'Neal".
heights["Lebron James", default: 0] // acessando conteúdo da chave "Lebron James".

// Criando um diconário e alterando o conteudo.
var archEnemies = [String: String]()
archEnemies["Batman"] = "The Joker"
archEnemies["Superman"] = "Lex Luthor"
archEnemies["Batman"] = "Peguin"

/*
 Por fim, assim como os arrays e os outros tipos de dados que vimos até agora, os dicionários vêm com algumas
 funcionalidades úteis que você desejará usar no futuro – count e removeAll()a mbos existem para dicionários e funcionam
 exatamente como para arrays.
 */

/**
 =============================================================================================
 COMO USAR CONJUNTOS PARA PESQUISA RÁPIDA DE DADOS
 =============================================================================================
 */

// Criando um conjunto de dados com Set.
let people1 = Set(["Denzel Washington", "Tom Cruise", "Nicolas Cage", "Samuel L Jackson"])

// Criando conjunto de dados vazio fazendo a tipagem explicita.
var people2 = Set<String>()

// Inserindo dados com insert.
people2.insert("Denzel Washington")
people2.insert("Tom Cruise")
people2.insert("Nicolas Cage")
people2.insert("Samuel L Jackson")

/**
 Obs: Podemos utilizar count(), sorted() e contains() com conjuntos. Inclusive contains() em conjuntos é muito mais rápido do que em matrizes.
 */

people2.sorted()
people2.count
people2.contains("Tom Cruise")

// Exemplo video do youtube de Sean Allen - Stop Using Arrays in Swift!

var swiftUIDevs: Set = ["Sean", "James"]
var swiftDevs: Set = ["Sean", "James", "Olivia", "Maya", "Leo"]
var kotlinDevs: Set = ["Olivia", "Elijah", "Leo", "Maya", "Dan"]
var experiencedDevs: Set = ["Sean", "Ava", "Olivia", "Leo", "Maya"]

// Intersect - pull ou overlap/verifica qual o item estão em ambas as listas
let experiencedSwiftUIDevs = swiftUIDevs.intersection(experiencedDevs)

// Subtract - pull out difference/subtrai o item de swiftDevs que não está em experiencedDevs.
let jrSwiftDev = swiftDevs.subtracting(experiencedDevs)

// Disjoint - ckeck for overlap/verifique se alguns dos itens de swiftUIDevs existem em kotlinDevs e retorna true caso não tem e false caso tanha.
swiftUIDevs.isDisjoint(with: kotlinDevs)

// Union - combine/Junta os dois conjuntos sem repetir itens iguais.
swiftDevs.union(kotlinDevs)

// Exclusive - only in 1 set/retorna os itens únicos de cada conjunto, ou seja, os itens que contém no conjunto swiftDevs e não em kotlinDevs e contém em kotlinDevs e não em swiftDevs.
let specialists = swiftDevs.symmetricDifference(kotlinDevs)

// Subset - retorna true se todos os itens de swiftUiDevs estão contidos em swiftDevs, caso contrário retorna false.
swiftUIDevs.isSubset(of: swiftDevs)

// Superset - retorna true se todos os itens de swiftUiDevs estão contidos em swiftDevs, caso contrário retorna false.
swiftDevs.isSuperset(of: swiftUIDevs)

// Insert, Delete, Find
swiftDevs.insert("Joe")
swiftDevs.remove("Sean")
swiftDevs.contains("Maya")
swiftDevs

/**
 =============================================================================================
 MARK: - COMO CRIAR E USAR ENUMS
 =============================================================================================
 */

// Criando um enum.
enum Weekday {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
}

// Atribuindo enum a uma variável.
var day = Weekday.monday
day = Weekday.tuesday
day = Weekday.friday

// Podemos criar enums com um case e separar cada caso por vírgula.

enum weekday1 {
    case monday, tuesday, wednesday, thursday, friday
}

/**
 Depois que atribuimos o tipo de dados a uma variável o tipo fica fixo e no caso do enum podemos utilizar somente o ponto para escolher qual opção, não precisando digitar o nome do enum, isso depois de atribuir o enum a variável.
 */

var day1 = weekday1.monday
day1 = .tuesday
day1 = .friday
