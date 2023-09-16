import Cocoa

/**
 =============================================================================================
 COMO REUTILIZAR CÓDIGO COM FUNÇÕES.
 =============================================================================================
*/

//1° Exemplo de uma função.

func showWelcome(){
  print("Bem vindo ao meu aplicativo!")
  print("Por padrão, isso imprime uma conversão")
  print("gráfico de centímetros para polegadas, mas você")
  print("também pode definir um intervalo personalizado, se desejar.")
}

showWelcome()

//2° Exemplo de uma função, calculando tabuada com dois parâmetros.

func printTimesTables(number: Int, end: Int){
  for i in 1...end {
    print("\(i) x \(number) é \(i * number)")
  }
}

printTimesTables(number: 5, end: 20)


/**
 =============================================================================================
 COMO RETORNAR VALORES DE FUNÇÕES.
 =============================================================================================
*/

//1° Exemplo função da própria apple com retorno de dados.
let root = sqrt(169)
print(root)


//2° Exemplo criando uma função que retona dados.
func roolDice() -> Int {
  
  Int.random(in: 1...6) //retorno com uma linha não precisa de RETURN
}

let roolDiceResult = roolDice()


//3° Exemplo criando uma função que recebe parâmetros e retorna dados.
func areLetterIdentical(string1: String, string2: String) -> Bool {
  string1.sorted() == string2.sorted()  //retorno com uma linha não precisa de RETURN
}

let areLetterIdenticalResult = areLetterIdentical(string1: "node", string2: "deno")


//4° Exemplo função que recebe parâmetros, utiliza a função sqrt() e retorna dados.

func pythagoras(a: Double, b: Double) -> Double {
  sqrt(a * a + b * b)
}

let pythagorasResult = pythagoras(a: 3, b: 4)
                                
/**
 Há uma última coisa que quero mencionar antes de prosseguirmos: se sua função não retornar um valor, você ainda pode usar return por si só para forçar a saída da função mais cedo. Por exemplo, talvez você tenha uma verificação de que a entrada corresponde ao que você esperava e, se não, você deseja sair da função imediatamente antes de continuar.
 */

func format(number: Int) -> String {
  return "The number is \(number)"
}

let formarResult = format(number: 2)


/**
 =============================================================================================
 COMO RETORNAR VÁRIOS VALORES DE FUNÇÕES.
 =============================================================================================
*/

//1° Exemplo função que retorna vários dados com arrays.
func getUserArray() -> [String] {
  ["Taylor", "Swift"]
}

let userArray = getUserArray()
print("Name: \(userArray[0]) \(userArray[1])")


/**
 Isso é problemático, porque é difícil lembrar o que user[0] e user[1] são, e se alguma vez ajustarmos os dados nessa matriz, podemos ter user[0] e user[1] sendo outra coisa ou talvez não existindo.

 Poderíamos usar um dicionário em vez disso, mas isso tem seus próprios problemas:
 */


//2° Exemplo função que retorna vários dados com dicionários.
func getUserDictionary() -> [String: String] {
  [
    "firstName": "Taylor",
    "lastName": "Swift"
  ]
}

let userDictonary = getUserDictionary()
print("Name: \(userDictonary["firstName", default: "Anonymous"]) \(userDictonary["lastName", default: "Anonymous"])")



/**
 Sim, agora demos nomes significativos para as várias partes de nossos dados de usuário, mas veja essa chamada para print(), embora saibamos que ambos existirão, ainda precisamos fornecer valores padrão caso as coisas não sejam o que esperamos que firstName e lastName serão.

 Ambas as soluções são muito ruins, mas o Swift tem uma solução na forma de tuplas. Como arrays, dicionários e conjuntos, as tuplas nos permitem colocar vários dados em uma única variável, mas, diferentemente dessas outras opções, as tuplas têm um tamanho fixo e podem ter uma variedade de tipos de dados.

 Veja como nossa função fica quando retorna uma tupla:
 */


//3° Exemplo função que retorna vários dados com tuplas e o mais correto.
func getUserTuplas() -> (firstname: String, lastName: String){
  (firstname: "Taylor", lastName: "Swift")
}

let getUserTuplasResult = getUserTuplas()
print("Name: \(getUserTuplasResult.firstname) \(getUserTuplasResult.lastName)")


/**
 Vamos quebrar isso…

 Nosso tipo de retorno agora é (firstName: String, lastName: String), que é uma tupla contendo duas strings.
 Cada string em nossa tupla tem um nome. Eles não estão entre aspas: são nomes específicos para cada item em nossa tupla, em oposição aos tipos de chaves arbitrárias que tínhamos nos dicionários.
 Dentro da função, enviamos de volta uma tupla contendo todos os elementos que prometemos, anexados aos nomes: firstName está sendo definido como “Taylor”, etc.
 Quando chamamos getUser(), podemos ler os valores da tupla usando os nomes das chaves: firstName, lastName, etc.
 Eu sei que as tuplas parecem muito semelhantes aos dicionários, mas são diferentes:

 Quando você acessa valores em um dicionário, o Swift não pode saber antecipadamente se eles estão presentes ou não. Sim, sabíamos que user["firstName"] estaria lá, mas Swift não pode ter certeza e, portanto, precisamos fornecer um valor padrão.
 
 Quando você acessa valores em uma tupla, o Swift sabe com antecedência que está disponível porque a tupla diz que estará disponível.
 Acessamos valores usando user.firstName: não é uma string, então também não há chance de erros de digitação.
 
 Nosso dicionário pode conter centenas de outros valores ao lado "firstName", mas nossa tupla não pode – devemos listar todos os valores que ele conterá e, como resultado, é garantido que ele contenha todos e nada mais.
 Portanto, as tuplas têm uma vantagem importante sobre os dicionários: especificamos exatamente quais valores existirão e quais tipos eles têm, enquanto os dicionários podem ou não conter os valores que estamos solicitando.

 Há três outras coisas que é importante saber ao usar tuplas.

 Primeiro, se você está retornando uma tupla de uma função, o Swift já sabe os nomes que você está dando a cada item na tupla, então você não precisa repeti-los ao usar return. Então, este código faz a mesma coisa que nossa tupla anterior:
 */


func getUser0() -> (firstName: String, lastName: String) {
    ("Taylor", "Swift")
}

let getUser0Result = getUser0()
print("Name: \(getUser0Result.firstName) \(getUser0Result.lastName)")

/**
 Em segundo lugar, às vezes você descobrirá que você recebe tuplas onde os elementos não têm nomes. Quando isso acontece, você pode acessar os elementos da tupla usando índices numéricos a partir de 0, assim:
 */


func getUser1() -> (String, String) {
    ("Taylor", "Swift")
}

let getUser1Result = getUser1()
print("Name: \(getUser1Result.0) \(getUser1Result.1)")

/**
 Esses índices numéricos também estão disponíveis com tuplas que têm elementos nomeados, mas sempre achei preferível usar nomes.

 Finalmente, se uma função retorna uma tupla, você pode separar a tupla em valores individuais, se quiser.

 Para entender o que quero dizer com isso, primeiro dê uma olhada neste código:
 */

let userTuplas2 = getUserTuplas()
let firstName1 = userTuplas2.firstname
let lastName1 = userTuplas2.lastName

print("Name: \(firstName1) \(lastName1)")

/**
 Isso volta para a versão nomeada de getUser(), e quando a tupla sai, estamos copiando os elementos de lá para conteúdos individuais antes de usá-los. Não há nada de novo aqui; estamos apenas movendo os dados um pouco.

 No entanto, em vez de atribuir a tupla a user, e copiar valores individuais de lá, podemos pular a primeira etapa – podemos separar o valor de retorno getUser()em duas constantes separadas, assim:
 */


//Se no lugar se lastName colocar um _ o swift ignora esse item.
let (firstName, lastName) = getUserTuplas()
print("Name: \(firstName) \(lastName)")


/**
 Essa sintaxe pode machucar sua cabeça no começo, mas na verdade é apenas um atalho para o que tínhamos antes: converter a tupla de dois elementos que recebemos de volta getUser()em duas constantes separadas.

 Na verdade, se você não precisar de todos os valores da tupla, você pode dar um passo adiante usando _para dizer ao Swift para ignorar essa parte da tupla:
 */

/**
 =============================================================================================
 COMO PERSONALIZAR RÓTULOS DE PARÂMETROS.
 =============================================================================================
*/

//1° Exemplo removendo rótulo da função com anderline _.
func isUppercase(_ string: String) -> Bool {
  string == string.uppercased()
}

let string = "OLÁ MUNDO!"
let result01 = isUppercase(string)
print(result01)


//2° Exemplo função com dois nomes de argumento um para uso externo e outro interno.
func printTimesTable(for number: Int){
  for i in 1...12 {
    print("\(i) x \(number) é \(i * number)")
  }
}

printTimesTable(for: 5)



