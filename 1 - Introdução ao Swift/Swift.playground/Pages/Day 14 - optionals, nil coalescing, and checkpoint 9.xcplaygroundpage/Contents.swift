import Cocoa

/**
 =============================================================================================
 COMO LIDAR COM DADOS AUSENTES COM OPCIONAIS.
 =============================================================================================
 O desembrulhar com let como nos exemplos abaixo, se a verificação for verdadeira no caso tem conteúdo o que esta dentro das chaves será executado e podemos utilizar o contéudo que let desembrulhou.
*/

//1° Exemplo de optinals sem else.
let opposites = [
  "Mario": "Wario",
  "Luigi": "waluigi"
]

let peachOpposite = opposites["Peach"]

if let marioOpposite = opposites["Mario"] {
  print("O oposto de Mario's é \(marioOpposite)")
}


//2° Exemplo de optinals com else.
var username: String? = nil

if let unwrappedName = username {
  print("Temos um usuário: \(unwrappedName)")
} else {
  print("O Opcional está vazio.")
}


//3° Exemplo, ao desembrulhar optional é muito comum desembrulhá-los em uma constante com mesmo nome do optional.

func square(number: Int) -> Int {
  number * number
}

var number: Int? = nil

if let number = number {
  print(square(number: number))
} else {
  print("Number esta vázio.")
}


/**
 =============================================================================================
 COMO DESEMBRULHAR OPCIONAIS COM GUARD.
 =============================================================================================
 O desembrulhar com guard let como no exemplo abaixo, se a verificação for verdadeira o conteúdo é guardado em na constante de let  e o conteúdo dentro das chaves não será executado, ou seja, o conteúdo dentro das chaves com guard let só é executado se a verificaçao falhar, no caso conteúdo vazio.
*/


/**
 1° Exemplo - Aqui será executado o que está dentro das chaves devido myVar ter conteúdo, e o contéudo será utilizado dentro do escopo das chaves que está na constante myVar1. Se a verificação de if let myVar1 = myVar1 desse falha, ou seja, conteúdo vazio/nil o else seria executado.
*/

var myVar1: Int? = 3

if let myVar1 = myVar1 {
    print("Fui executado pois let funcionou e o conteúdo de myVar1 é: \(myVar1)")
} else {
  print("Fui executado pois deu falha em myVar1 devido estar vazia/nil.")
}

/**
 2° Exemplo - Aqui há conteúdo será executado o que está dentro das chaves utilizando o conteúdo de myVar que agora foi desembrulhado e está na constant unwrapped1
*/

enum myVarError: Error {
  case variableIsEmpty
}


do{
  var myVar2: Int? = 4

  guard let myVar2 = myVar2 else {
    throw myVarError.variableIsEmpty
  }
  
  print("Fui executado pois guar let funcionou e o conteúdo de myVar2 é: \(myVar2)")
  
} catch myVarError.variableIsEmpty {
  print("Fui executado pois deu falha em myVar2 devido estar vazia.")
}


/**
 3° Exemplo - Utilizando guard let dentro da função onde quando der falha o que está dentro das chaves será executado e o swift exigirá o return para sair.
*/

func printSquare(of number: Int?) {
  guard let number = number else {
    print("Fui executado pois deu falha em guar let e foi utilizado return para sair.")
    return
  }
  
  print("\(number) x \(number) é \(number * number)")
}

printSquare(of: nil)


/**
 =============================================================================================
 COMO DESEMBRULHAR OPCIONAIS COM NIL COALESCING.
 =============================================================================================
*/

//1° Exemplo - O mesmo que utilizarmos defaul -> let new = captains["Serenity", default:  "N/A"]

let captains = [
  "Enterprise": "Picard",
  "Voyager": "Janeway",
  "Defiant": "Sisko"
]

let new = captains["Serenity"] ?? "N/A"

//2° Exemplo - Como randomElement retorna um optional utilizamos nil coalescing
let tvShows = ["Archer", "Babylon 5", "Ted Lasso"]
let favorite = tvShows.randomElement() ?? "None"
print(favorite)


//3° Exemplo - Uma struc com propriedade optional.
struct Book {
  let title: String
  let author: String?
}

let book = Book(title: "Beowulf", author: nil)
let author = book.author ?? "Anonymous"
print(author)

//4° Exemplo
let input = ""
let number1 = Int(input) ?? 0
print(number1)



/**
 =============================================================================================
 COMO LIDAR COM VÁRIOS OPCIONAIS USANDO OPCIONAL CHAINING.
 =============================================================================================
*/

//1° Exemplo - Com optional channing "?" verifica se randomElement tem conteúdo, caso tenha retorna o conteúdo em maiúsculo.
let names = ["Arya", "Bran", "Robb", "Sans"]

let chosen = names.randomElement()?.uppercased() ?? "No one"
print("Next in line: \(chosen)")


//2° Exemplo
struct Book1 {
  let title: String
  let author: String?
}


/**
 3° Exemplo - Retorna "A", pois verifica se tem algo em book com optional channing "?" como não há uma instância está definida está como nil
*/
var book1: Book1? = nil
let author1 = book1?.author?.first?.uppercased() ?? "A"
print(author1)


//4° Exemplo - Retorna a primeira letra em maiúsculo de author caso author exista
var book2 = Book1(title: "Senhor do Aneis", author: "mike")
let author2 = book2.author?.first?.uppercased() ?? "A"
print(author1)


/**
 =============================================================================================
 COMO LIDAR COM FALHA DE FUNÇÃO COM OPCIONAIS .
 =============================================================================================
 Quando chamamos uma função que pode gerar erros, nós a chamamos usando trye tratamos os erros apropriadamente, ou se tivermos certeza de que a função não falhará, usamos try!e aceitamos que, se estivermos errados, nosso código falhará. (Spoiler: você deve usar try!muito raramente.)

 No entanto, existe uma alternativa: se tudo o que nos importa é se a função foi bem-sucedida ou falhou, podemos usar um try opcional para que a função retorne um valor opcional. Se a função foi executada sem gerar nenhum erro, o opcional conterá o valor de retorno, mas se algum erro for gerado, a função retornará nil. Isso significa que não sabemos exatamente qual erro foi lançado, mas geralmente não há problema - podemos nos importar se a função funcionou ou não.

 Veja como fica:
 
*/

enum UseError: Error {
    case baseID, networkFailed
}

func getUser(id: Int) throws -> String {
    throw UseError.networkFailed
}

if let user1 = try? getUser(id: 23){
    print("User: \(user1)")
}

/**
 A getUser()função sempre lançará um networkFailederro, o que é bom para nossos propósitos de teste, mas na verdade não nos importamos com qual erro foi lançado – tudo o que nos importa é se a chamada enviou de volta um usuário ou não.

 É aqui que try?ajuda: faz getUser()retornar uma string opcional, que será nil se algum erro for lançado. Se você quiser saber exatamente qual erro aconteceu, essa abordagem não será útil, mas na maioria das vezes simplesmente não nos importamos.

 Se desejar, você pode combinar try?com nil coalescing, que significa “tentar obter o valor de retorno desta função, mas se falhar, use esse valor padrão”.

 Tenha cuidado, porém: você precisa adicionar alguns parênteses antes de nil coalescer para que o Swift entenda exatamente o que você quer dizer. Por exemplo, você escreveria isso:
*/


let user2 = (try? getUser(id: 23)) ?? "Anonymous"
print(user2)

/**
 Você descobrirá que try?é usado principalmente em três lugares:

 1 - Em combinação com guard letpara sair da função atual se a try?chamada retornar nil.
 
 2 - Em combinação com nil coalescendo para tentar algo ou fornecer um valor padrão em caso de falha.
 
 3 - Ao chamar qualquer função de lançamento sem um valor de retorno, quando você realmente não se
 importa se foi bem-sucedido ou não – talvez você esteja gravando em um arquivo de log ou enviando
 análises para um servidor, por exemplo.
*/


/**
 =============================================================================================
 CHECKPOINT 9.
 =============================================================================================
 Agora que você entende um pouco sobre opcionais, é hora de fazer uma pausa por alguns minutos
 e tentar um pequeno desafio de codificação para ver o quanto você se lembrou.

 Seu desafio é este: escreva uma função que aceite um array opcional de inteiros e retorne um
 aleatoriamente. Se a matriz estiver ausente ou vazia, retorne um número aleatório no intervalo
 de 1 a 100.

 Se isso parece fácil, é porque ainda não expliquei o problema: quero que você escreva sua função
 em uma única linha de código. Não, isso não significa que você deva apenas escrever muito código
 e depois remover todas as quebras de linha – você deve ser capaz de escrever tudo isso em uma
 linha de código.
*/

//Desafio com função
func arrayInt1(numbers: [Int]?) -> Int {
    return numbers?.randomElement() ?? Int.random(in: 1...100)
}
print(arrayInt1(numbers: [1, 4, 6, 8, 100, 101]))


//Desafio com closure
let arrayInt2 = { (numbers: [Int]?) -> Int in numbers?.randomElement() ?? Int.random(in: 1...100)}
print(arrayInt2([1, 4, 6, 8, 100, 101]))
