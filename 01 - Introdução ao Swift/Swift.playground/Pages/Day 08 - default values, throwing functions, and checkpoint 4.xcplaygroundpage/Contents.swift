import Cocoa

/**
 =============================================================================================
 COMO FORNECER VALORES PADRÃO PARA PARÂMETROS.
 =============================================================================================
*/

//1° Exemplo de função com valores padrão para parâmetros.
func printTimesTable(for number: Int, end: Int = 12 ) {
  for i in 1...end {
    print("\(i) x \(number) é \(i * number)")
  }
}

printTimesTable(for: 5, end: 20)
printTimesTable(for: 8)


//2° Exemplo da função removeAll() de um array com valor de parâmetro padrão.
var characteres = ["Lana", "Pam", "Ray", "Sterling"]
characteres.removeAll()


/**
 Isso adiciona algumas strings a um array, imprime sua contagem, depois remove todas e imprime a contagem novamente.

 Como uma otimização de desempenho, o Swift fornece aos arrays apenas memória suficiente para armazenar seus itens, além de um pouco mais para que eles possam crescer um pouco ao longo do tempo. Se mais itens forem adicionados ao array, o Swift alocará mais e mais memória automaticamente, de modo que o mínimo possível seja desperdiçado.

 Quando chamamos removeAll(), o Swift remove automaticamente todos os itens do array e libera toda a memória que foi atribuída ao array. Isso geralmente é o que você deseja, porque afinal você está removendo os objetos por um motivo. Mas às vezes – apenas às vezes – você pode estar prestes a adicionar muitos novos itens de volta ao array e, portanto, há uma segunda forma dessa função que remove os itens enquanto mantém a capacidade anterior:

 */

//characters.removeAll(keepingCapacity: true)


/**
 Isso é feito usando um valor de parâmetro padrão: keepingCapacity é um booleano com o valor padrão de false para que faça a coisa sensata por padrão, enquanto também deixa aberta a opção de passarmos true por vezes que queremos manter a capacidade existente do array.

 Como você pode ver, os valores de parâmetros padrão nos permitem manter a flexibilidade em nossas funções sem torná-las irritantes para chamar na maioria das vezes - você só precisa enviar alguns parâmetros quando precisar de algo incomum.
 */


/**
 =============================================================================================
 COMO LIDAR COM ERROS EM FUNÇÕES.
 =============================================================================================
*/

//1° passo definindo os possíveis que podem acontecer com enum baseada no Error tipo exeistente no Swift.
enum PasswordError: Error {
  case short, obvious
}

//Isso diz que há dois possíveis erros com senha: shorte obvious. Não define o que significam , apenas que eles existem.


/**
 2° passo é escrever uma função que acionará um desses erros. Quando um erro é acionado – ou lançado no Swift – estamos dizendo que algo fatal deu errado com a função e, em vez de continuar normalmente, ela termina imediatamente sem enviar nenhum valor de volta.

 No nosso caso, vamos escrever uma função que verifica a força de uma senha: se for muito ruim - menos de 5 caracteres ou for extremamente conhecida - então lançaremos um erro imediatamente, mas para todas as outras strings, 'retornará classificações "OK", "Bom" ou "Excelente".
 */

func checkPassword(_ password: String) throws -> String {
  if password.count < 5 {
    throw PasswordError.short
  }
  
  if password == "12345" {
    throw PasswordError.obvious
  }
  
  if password.count < 8 {
    return "OK"
  } else if password.count < 10 {
    return "Good"
  } else {
    return "Excellent"
  }
}

/**
 Se uma função for capaz de lançar erros sem manipulá-los, você deve marcar a função como throwsantes do tipo de retorno.
 Não especificamos exatamente que tipo de erro é gerado pela função, apenas que ela pode gerar erros.
 Estar marcado com throwsnão significa que a função deve lançar erros, apenas que pode.
 Quando chega a hora de lançar um erro, escrevemos throwseguido por um de nossos PasswordErrorcasos. Isso sai imediatamente da função, o que significa que não retornará uma string.
 Se nenhum erro for lançado, a função deve se comportar normalmente – ela precisa retornar uma string.
 Isso completa a segunda etapa de lançar erros: definimos os erros que podem acontecer e escrevemos uma função usando esses erros.

 A etapa final é executar a função e lidar com quaisquer erros que possam ocorrer. Os Swift Playgrounds são bastante negligentes quanto ao tratamento de erros porque são destinados principalmente ao aprendizado, mas quando se trata de trabalhar com projetos reais do Swift, você descobrirá que existem três etapas:

 Iniciar um bloco de trabalho que pode gerar erros, usando do.
 Chamando uma ou mais funções de lançamento, usando try.
 Manipulando quaisquer erros lançados usando catch.
 
 
 Se quiséssemos escrever tente isso usando nossa checkPassword() função atual, poderíamos escrever isso:
 */

let string = "1234"

do {
  let result = try checkPassword(string)
  print("Classificação da senha: \(result)")
} catch PasswordError.short {
  print("Por favor, use uma senha mais longa.")
} catch PasswordError.obvious {
  print("Eu tenho a mesma combinação na minha bagagem!")
} catch {
  print("Havia um erro: \(error.localizedDescription)")
}


/**
 Se a checkPassword() função funcionar corretamente, ela retornará um valor em result, que será impresso. Mas se algum erro for lançado (o que neste caso haverá), a mensagem de classificação da senha nunca será impressa – a execução pulará imediatamente para o catchbloco.

 Existem algumas partes diferentes desse código que merecem discussão, mas quero focar na mais importante: try. Isso deve ser escrito antes de chamar todas as funções que possam gerar erros e é um sinal visual para os desenvolvedores de que a execução regular do código será interrompida se ocorrer um erro.

 Ao usar try, você precisa estar dentro de um dobloco e certificar-se de ter um ou mais catchblocos capazes de lidar com quaisquer erros. Em algumas circunstâncias, você pode usar uma alternativa escrita como try!que não requer doe catch, mas travará seu código se um erro for lançado - você deve usar isso raramente e somente se tiver certeza absoluta de que um erro não pode ser lançado.

 Quando se trata de capturar erros, você deve sempre ter um catchbloco que seja capaz de lidar com todo tipo de erro. No entanto, você também pode detectar erros específicos, se desejar:
 
 À medida que você progride, verá como as funções de lançamento são incorporadas a muitas das estruturas da própria Apple, portanto, mesmo que você não as crie muito, pelo menos precisará saber como usá -las com segurança.

 Dica: A maioria dos erros gerados pela Apple fornece uma mensagem significativa que você pode apresentar ao usuário, se necessário. O Swift disponibiliza isso usando um errorvalor que é fornecido automaticamente dentro do seu catchbloco, e é comum ler error.localizedDescriptionpara ver exatamente o que aconteceu.
 */




/**
 Com funções em seu currículo, é hora de experimentar um pequeno desafio de codificação. Não se preocupe, não é tão difícil, mas pode demorar um pouco para você pensar e pensar em algo. Como sempre, estarei dando algumas dicas se você precisar delas.

 O desafio é este: escreva uma função que aceite um inteiro de 1 a 10.000 e retorne a raiz quadrada inteira desse número. Parece fácil, mas existem alguns problemas:

 Você não pode usar a função interna do Swift sqrt()ou similar – você precisa encontrar a raiz quadrada você mesmo.
 Se o número for menor que 1 ou maior que 10.000, você deve lançar um erro "fora dos limites".
 Você deve considerar apenas raízes quadradas inteiras – não se preocupe com a raiz quadrada de 3 sendo 1,732, por exemplo.
 Se você não conseguir encontrar a raiz quadrada, lance um erro “sem raiz”.
 Como lembrete, se você tem o número X, a raiz quadrada de X será outro número que, quando multiplicado por ele mesmo, dá X. Então, a raiz quadrada de 9 é 3, porque 3x3 é 9, e a raiz quadrada de 25 é 5, porque 5x5 é 25.

 Darei algumas dicas em breve, mas, como sempre, encorajo você a experimentar primeiro – lutar para lembrar como as coisas funcionam e, muitas vezes, ter que pesquisá-las novamente, é uma maneira poderosa de progredir.
 */


/**
 =============================================================================================
 CHECKPOINT 4.
 =============================================================================================
*/
enum sqrtIntError: Error {
  case small, larger, root
}

func sqrtInt(_ number: Int) throws -> Int {
  if number < 1 {
    throw sqrtIntError.small
  }
  
  if number > 10_000 {
    throw sqrtIntError.larger
  }

  var result = 0
  
  for i in 1...10_000 {
    if i * i == number {
       result = i
    }
  }
 
  if result == 0 {
    throw sqrtIntError.root
  }
  
  return result
}

let number = 10_000

do {
  let resultFunc = try sqrtInt(number)
  
  print("Resultado com função do desafio => \(resultFunc)")

} catch sqrtIntError.small {
  print("Número menor que 1")
} catch sqrtIntError.larger {
  print("Número maior que 10.000")
} catch sqrtIntError.root {
  print("Sem raiz")
} catch {
  print("Erro inesperado. \(error.localizedDescription)")
}

let resultSwift = sqrt(Double(number))
print("Resultado com função do Swift   => \(resultSwift)")
