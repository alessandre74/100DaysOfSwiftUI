
import Cocoa

/**
 =============================================================================================
 COMO CRIAR E USAR CLOSURES.
 =============================================================================================
 */

/**
 Quando copiamos uma função não se escreve o parêntheses depois dela, se colocar os parêntheses estamos chamando ela e o retono dela atribuindo a variável.
 */

func greetUser() {
    print("Olá")
}

greetUser()

var greetCopy = greetUser
greetCopy()

/**
 Mas e se você quiser pular a criação de uma função separada e apenas atribuir a funcionalidade diretamente a uma constante ou variável? Bem, acontece que você também pode fazer isso:
 */

// Closure sem parâmetro e sem retorno
let sayHello1 = {
    print("Closure => Olá")
}

sayHello1()

/**
 Swift dá a isso o grandioso nome closure expression , que é uma maneira elegante de dizer que acabamos de criar um closure – um pedaço de código que podemos passar e chamar sempre que quisermos. Este não tem um nome, mas por outro lado é efetivamente uma função que não recebe parâmetros e não retorna um valor.

 Se você quiser que o closure aceite parâmetros, eles precisam ser escritos de uma maneira especial. Veja bem, o encerramento começa e termina com as chaves, o que significa que não podemos colocar código fora dessas chaves para controlar parâmetros ou retornar valor. Então, o Swift tem uma solução legal, podemos colocar essa mesma informação dentro das chaves, assim:
 */

// Closure com parâmetro e retorno

let sayHello = { (name: String) -> String in
    "Olá \(name)"
}

sayHello("Mike")

/**
 Eu adicionei uma palavra-chave extra lá – você a localizou? É a palavra- inchave e vem diretamente após os parâmetros e o tipo de retorno do encerramento. Novamente, com uma função regular, os parâmetros e o tipo de retorno ficariam fora das chaves, mas não podemos fazer isso com closures. Então, iné usado para marcar o fim dos parâmetros e o tipo de retorno – tudo depois disso é o próprio corpo da closure. Há uma razão para isso, e você verá por si mesmo em breve.

 Enquanto isso, você pode ter uma pergunta mais fundamental: “por que eu precisaria dessas coisas?” Eu sei, fechamentos parecem terrivelmente obscuros. Pior, eles parecem obscuros e complicados – muitas, muitas pessoas realmente lutam com fechamentos quando os conhecem, porque são feras complexas e parecem que nunca serão úteis.

 No entanto, como você verá, isso é amplamente usado no Swift e em quase todos os lugares do SwiftUI. Sério, você os usará em todos os aplicativos SwiftUI que escrever, às vezes centenas de vezes – talvez não necessariamente na forma que você vê acima, mas você o usará muito .

 Para ter uma ideia de por que os closures são tão úteis, primeiro quero apresentar a você os tipos de função . Você viu como os inteiros têm o tipo Inte os decimais têm o tipo Doubleetc., e agora quero que você pense em como as funções também têm tipos.

 Vamos pegar a greetUser()função que escrevemos anteriormente: ela não aceita parâmetros, não retorna nenhum valor e não gera erros. Se fôssemos escrever isso como uma anotação de tipo para greetCopy, escreveríamos isso:
 */

var greetCopy1: () -> Void = greetUser

/**
 Vamos quebrar isso…

 Os parênteses vazios marcam uma função que não aceita parâmetros.
 A seta significa exatamente o que significa ao criar uma função: estamos prestes a declarar o tipo de retorno para a função.
 Void significa “nada” – esta função não retorna nada. Às vezes, você pode ver isso escrito como (), mas geralmente evitamos isso porque pode ser confundido com a lista de parâmetros vazia.
 O tipo de cada função depende dos dados que ela recebe e envia de volta. Isso pode parecer simples, mas esconde um detalhe importante: os nomes dos dados que recebe não fazem parte do tipo da função.

 Podemos demonstrar isso com mais algum código:
 */

// Closure que copia outra função onde os parâmetros não são inclusos na copia somente o retorno

func getUserData(for id: Int) -> String {
    if id == 1989 {
        return "Taylor Swift"
    } else {
        return "Anonymous"
    }
}

let data: (Int) -> String = getUserData
let user = data(1989)

print(user)

print(sayHello("Taylor Swift")) // Mesmo print da linha 55

/*
 Isso não usa nome de parâmetro, assim como quando copiamos funções. Então, novamente: nomes de parâmetros externos só importam quando estamos
 chamando uma função diretamente, não quando criamos uma closure ou quando fazemos uma cópia da função primeiro.

 Você provavelmente ainda está se perguntando por que tudo isso importa, e tudo está prestes a ficar claro. Você se lembra que eu disse que podemos
 usar sorted()um array para que ele classifique seus elementos?

 Isso significa que podemos escrever código assim:
 */

// Criando um array, classificando e depois imprimindo"
let team = ["Gloria", "Suzanne", "Piper", "Tiffany", "Tasha"]
let sortedTeam1 = team.sorted()
print(sortedTeam1)

/**
 Isso é muito legal, mas e se quiséssemos controlar esse tipo – e se sempre quiséssemos que uma pessoa viesse primeiro porque ela era o capitão da equipe, com o resto sendo classificado em ordem alfabética?

 Bem, sorted()na verdade nos permite passar uma função de classificação personalizada para controlar exatamente isso. Esta função deve aceitar duas strings e retornar true se a primeira string deve ser classificada antes da segunda, ou false se a primeira string deve ser classificada após a segunda.

 Se Suzanne fosse a capitã, a função ficaria assim:
 */

func captainFirstSorted(name1: String, name2: String) -> Bool {
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

/**
 Portanto, se o primeiro nome for Suzanne, retorne true para que name1 seja classificado antes de name2. Por outro lado, se name2 for Suzanne, retorne false para que name1 seja classificado após name2. Se nenhum dos nomes for Suzanne, basta usar < para fazer uma classificação alfabética normal.

 Como eu disse, sorted()pode ser passada uma função para criar uma ordem de classificação personalizada, e desde que essa função a) aceite duas strings, e b) retorne um booleano, sorted() pode usá-lo.

 É exatamente isso que nossa nova captainFirstSorted()função faz, então podemos usá-la imediatamente:
 */

// Utilizando uma FUNÇÃO como argumento de sorted() para criar uma classificação personalizada
let captainFirsTeam0 = team.sorted(by: captainFirstSorted)
print(captainFirsTeam0)

/**
 Quando isso for executado, ele imprimirá ["Suzanne", "Gloria", "Piper", "Tasha", "Tiffany"]exatamente como queríamos.

 Agora cobrimos duas coisas aparentemente muito diferentes. Primeiro, podemos criar closures como funções anônimas, armazenando-as dentro de constantes e variáveis.

 E também podemos passar funções para outras funções, assim como passamos captainFirstSorted() para sorted().

 O poder dos closures é que podemos colocar esses dois juntos: sorted() quer uma função que aceite duas strings e retorne um booleano, e não se importa se essa função foi criada formalmente usando func ou se é fornecida usando um closure.

 Então, poderíamos chamar sorted() novamente, mas em vez de passar a captainFirstTeam() função, em vez disso, inicie uma nova closure. Escreva uma chave aberta, liste seus parâmetros e retorne o tipo, escreva in e coloque nosso código de função padrão.

 Isso vai machucar seu cérebro em primeiro lugar. Não é porque você não é inteligente o suficiente para entender os closures ou não está preparado para a programação Swift, apenas porque os closures são realmente difíceis. Não se preocupe - vamos procurar maneiras de tornar isso mais fácil!

 Ok, vamos escrever um novo código que chama sorted() usando uma closure:
 */

// Utilizando uma CLOSURE como argumento de sorted() para criar uma classificação personalizada

let captainFirstTeam1 = team.sorted { (name1: String, name2: String) -> Bool in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }
    return name1 < name2
}

print(captainFirstTeam1)

/**
 Essa é uma grande parte da sintaxe de uma só vez, e novamente quero dizer que ficará mais fácil – no próximo capítulo, veremos maneiras de reduzir a quantidade de código para que seja mais fácil ver o que está acontecendo.

 Mas primeiro quero detalhar o que está acontecendo lá:

 Estamos chamando a sorted() função como antes.
 Em vez de passar uma função, estamos passando uma closure - tudo, desde a chave de abertura depois by:até a chave de fechamento na última linha, faz parte do fechamento.

 Diretamente dentro da closure listamos os dois parâmetros sorted() que nos passarão, que são duas strings. Também dizemos que nossa closure retornará um booleano e, em seguida, marcará o início do código da closure usando in. Todo o resto é apenas código de função normal.

 Novamente, há muita sintaxe lá e eu não o culparia se você sentisse uma dor de cabeça chegando, mas espero que você possa ver o benefício das closures pelo menos um pouco: funções como sorted() deixe-nos passar código personalizado para ajustar como eles funcionam e fazem isso diretamente – não precisamos escrever uma nova função apenas para esse uso.

 Agora que você entende o que são closure, vamos ver se podemos torná-los mais fáceis de ler…
 */

/**
 =============================================================================================
 COMO USAR CLOSURES À DIREITA E SINTAXE ABREVIADA.
 =============================================================================================
 */

/**
 Não precisamos especificar os tipos de nossos dois parâmetros porque eles devem ser strings, e não precisamos especificar um tipo de retorno porque deve ser um booleano.

 Em vez de passar a closure como um parâmetro, apenas vamos em frente e iniciamos a closure diretamente - e, ao fazê-lo, removemos (by:desde o início e um parêntese de fechamento no final. Espero que agora você possa ver o porquê da lista de parâmetros e "in" entrar na closure, porque se eles estivessem do lado de fora ficaria ainda mais estranho!
 */

// 1° Exemplo de Closure abreviada

let captainFirstTeam2 = team.sorted { name1, name2 in
    if name1 == "Suzanne" {
        return true
    } else if name2 == "Suzanne" {
        return false
    }

    return name1 < name2
}

print(captainFirstTeam2)

/**
 Há uma última maneira de o Swift tornar os closures menos confusos: o Swift pode fornecer nomes de parâmetros automaticamente para nós, usando a sintaxe abreviada . Com esta sintaxe nós nem escrevemos name1, name2 inmais, e ao invés disso confiamos em valores especialmente nomeados que o Swift fornece para nós: $0e $1, para a primeira e segunda strings respectivamente.

 Usando esta sintaxe nosso código fica ainda mais curto:
 */

// 2° Exemplo de Closure abreviada

let captainFirstTeam3 = team.sorted {
    if $0 == "Suzanne" {
        return true
    } else if $1 == "Suzanne" {
        return false
    }
    return $0 < $1
}

print(captainFirstTeam3)

// 3° Fazendo classificação reversa com closure mais simples e sem return
let reverseTeam = team.sorted { $0 > $1 }
print(reverseTeam)

// 4° Fazendo classificação normal com closure mais simples e sem return
let sortedTeam2 = team.sorted { $0 < $1 }
print(sortedTeam2)

/**
 Não há regras fixas sobre quando usar a sintaxe abreviada e quando não usar, mas caso seja útil, uso a sintaxe abreviada, a menos que qualquer uma das seguintes opções seja verdadeira:

  1. O código do fechamento é longo.
  2. $0e amigos são usados ​​mais de uma vez cada.
  3. Você obtém três ou mais parâmetros (por exemplo $2, $3, etc).

 Se você ainda não está convencido sobre o poder dos closures, vamos dar uma olhada em mais dois exemplos.

 Primeiro, a filter() função nos permite executar algum código em cada item da matriz e enviará de volta um novo array contendo cada item que retornar true para a função. Assim, poderíamos encontrar todos os jogadores da equipe cujo nome começa com T assim:
 */

// 5° Closure com filter()
let tOnly = team.filter { $0.hasPrefix("T") }
print(tOnly)

/**
 E segundo, a map()função nos permite transformar cada item no array usando algum código de nossa escolha e envia de volta um novo array de todos os itens transformados:
 */

// 6° Closure com map()
let uppercaseTeam = team.map { $0.uppercased() }
print(uppercaseTeam)

/**
 Dica: Ao trabalhar com map(), o tipo que você retorna não precisa ser o mesmo que você começou – você pode converter um array de inteiros em um array de strings, por exemplo.

 Como eu disse, você usará muito closures com o SwiftUI:

 Ao criar uma lista de dados na tela, o SwiftUI solicitará que você forneça uma função que aceite um item da lista e o converta em algo que possa ser exibido na tela.
 Ao criar um botão, o SwiftUI solicitará que você forneça uma função para executar quando o botão for pressionado e outra para gerar o conteúdo do botão – uma imagem ou algum texto e assim por diante.
 Até mesmo colocar pedaços de texto empilhados verticalmente é feito usando uma closure.
 Sim, você pode criar funções individuais toda vez que o SwiftUI fizer isso, mas confie em mim: você não vai. Closures tornam esse tipo de código completamente natural, e acho que você ficará surpreso com a forma como o SwiftUI os usa para produzir um código incrivelmente simples e limpo.
 */

/**
 =============================================================================================
 COMO ACEITAR FUNÇÕES COMO PARÂMETRO.
 =============================================================================================
 */

// Gerando um array de número inteiros com função que tem uma função como parâmetro
func makeArray(size: Int, using generator: () -> Int) -> [Int] {
    var numbers = [Int]()

    for _ in 0 ..< size {
        let newNumber = generator()
        numbers.append(newNumber)
    }

    return numbers
}

/**
 Vamos quebrar isso…

 A função é chamada makeArray(). Leva dois parâmetros, um dos quais é o número de inteiros que queremos, e também retorna um array de inteiros.
 O segundo parâmetro é uma função. Isso não aceita parâmetros em si, mas retornará um inteiro toda vez que for chamado.
 Dentro makeArray()nós criamos um novo array vazio de inteiros, então fazemos o loop quantas vezes forem solicitadas.
 Cada vez que o loop dá a volta, chamamos a generatorfunção que foi passada como parâmetro. Isso retornará um novo inteiro, então o colocamos no numbersarray.
 Finalmente, a matriz finalizada é retornada.
 O corpo do makeArray()é basicamente simples: chame repetidamente uma função para gerar um número inteiro, adicionando cada valor a uma matriz e depois envie tudo de volta.

 A parte complexa é a primeira linha:

 func makeArray(size: Int, using generator: () -> Int) -> [Int] {

 Lá temos dois conjuntos de parênteses e dois conjuntos de tipos de retorno, então pode ser um pouco confuso no começo. Se você dividi-lo, poderá lê-lo linearmente:

 1. Estamos criando uma nova função.
 2. A função é chamada makeArray().
 3. O primeiro parâmetro é um inteiro chamado size.
 4. O segundo parâmetro é uma função chamada generator, que não aceita parâmetros e retorna um inteiro.
 5. A coisa toda – makeArray()– retorna uma matriz de inteiros.
 O resultado é que agora podemos fazer arrays inteiros de tamanho arbitrário, passando uma função que deve ser usada para gerar cada número:
 */
let rolls = makeArray(size: 50) {
    Int.random(in: 1 ... 20)
}

let uniqueElements = Set(rolls).sorted()

print(rolls) // array orinal
print(uniqueElements) // array com elementos únicos devido ao Set e classificados com sorted()

/**
 E lembre-se, essa mesma funcionalidade também funciona com funções dedicadas, então poderíamos escrever algo assim:
 */

// Gerando um array de número inteiros enviando uma função dedicada para closure/
func generateNumber() -> Int {
    Int.random(in: 1 ... 20)
}

let newRolls = makeArray(size: 50, using: generateNumber)
print(newRolls)

/**
 Isso chamará generateNumber()50 vezes para preencher a matriz.

 Enquanto você está aprendendo Swift e SwiftUI, haverá apenas um punhado de vezes em que você precisará saber como aceitar funções como parâmetros, mas pelo menos agora você tem uma ideia de como funciona e por que é importante.

 Há uma última coisa antes de seguirmos em frente: você pode fazer sua função aceitar vários parâmetros de função, se quiser, nesse caso você pode especificar vários encerramentos à direita. A sintaxe aqui é muito comum no SwiftUI, então é importante pelo menos mostrar um gostinho dela aqui.

 Para demonstrar isso, aqui está uma função que aceita três parâmetros de função, cada um dos quais não aceita parâmetros e não retorna nada:
 */

// Função que aceita vários parâmetros de função
func doImportantWork(first: () -> Void, second: () -> Void, third: () -> Void) {
    print("A ponto de iniciar o primeiro trabalho")
    first()
    print("")
    print("A ponto de iniciar o segundo trabalho")
    second()
    print("")
    print("A ponto de iniciar o terceiro trabalho")
    third()
    print("")
    print("Concluído!")
}

/**
 Eu adicionei print() chamadas extras lá para simular um trabalho específico sendo feito entre first, second e third sendo chamado.

 Quando se trata de chamar isso, o primeiro encerramento à direita é idêntico ao que já usamos, mas o segundo e o terceiro são formatados de maneira diferente: você termina a chave do encerramento anterior, escreve o nome do parâmetro externo e dois pontos, então iniciar outra chave.

 Veja como isso se parece:
 */

doImportantWork {
    print("Este é o primeiro trabalho")
} second: {
    print("Este é o segundo trabalho")
} third: {
    print("Este é o terceiro trabalho")
}

/**
 Ter três closures à direita não é tão incomum quanto você poderia esperar. Por exemplo, criar uma seção de conteúdo no SwiftUI é feito com três closures à direita: um para o conteúdo em si, um para um cabeçalho a ser colocado acima e um para um rodapé a ser colocado abaixo.
 */

/**
 =============================================================================================
 COMO VOCÊ RETORNA UM VALOR DE UMA CLOSURE QUE NÃO RECEBE PARÂMETROS.
 =============================================================================================
 */

/**
 Closures no Swift têm uma sintaxe distinta que realmente os separa de funções simples, e um lugar que pode causar confusão é como aceitamos e retornamos parâmetros.

 Primeiro, aqui está uma closure que aceita um parâmetro e não retorna nada:
 */

let payment1 = { (user: String) in
    print("Pagando \(user)…")
}

payment1("Mike")

/*
 Agora aqui está uma closure que aceita um parâmetro e retorna um booleano:
 */

let payment2 = { (user: String) -> Bool in
    print("Pagando \(user)…")
    return true
}

payment2("Silvana")

/**
 Se você deseja retornar um valor sem aceitar nenhum parâmetro, não pode simplesmente escrever -> Bool in – o Swift não entenderá o que você quer dizer. Em vez disso, você deve usar parênteses vazios para sua lista de parâmetros, assim:
 */
let payment3 = { () -> Bool in
    print("Pagar uma pessoa anônima…")
    return true
}

payment3()

/**
 =============================================================================================
 CHECKPOINT 5.
 =============================================================================================
 */
let luckNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

luckNumbers.filter { $0 % 2 != 0 }.sorted { $0 < $1 }.map {
    print("\($0) é um número da sorte.")
}

// ou

print("")
luckNumbers.filter { !$0.isMultiple(of: 2) }.sorted { $0 < $1 }.map {
    print("\($0) é um número da sorte.")
}

// ou

print("")
luckNumbers.filter { number in !number.isMultiple(of: 2) }.sorted { number1, number2 in number1 < number2 }.map { number in
    print("\(number) é um número da sorte.")
}
