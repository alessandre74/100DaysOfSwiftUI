import Cocoa

/**
 =============================================================================================
 COMO USAR UM LOOP "FOR" PARA REPETIR O TRABALHO.
 =============================================================================================
*/

//1° Exemplo com array de strings com "for in".
let platforms = ["iOS", "macOS", "tvOS", "watchOS"]

for platform in platforms {
  print("Swift funciona muito bem em \(platform)")
}


//2° Exemplo em um intervalo fixo de número.
for i in 1...12 {
  print("5 X \(i) é \(5 * i)")
}


//3° Exemplo loops aninhados.
for i in 1...12 {
  print("A tabuada de \(i):")
  
  for j in 1...12 {
    print("  \(j) x \(i) é \(j * i)")
  }
  print("")
}

//4° Exemplo intervalo de número excluindo o número final.
for i in 1..<5 {
  print("Contando de 1 a 5 e excluindo o número final 5 com 1...<5 : \(i) ")
}

//5° Exemplo loop sem a variável de loop.
var lyric = "Haters gonna"

for _ in 1...5 {
  lyric += " hate"
}

print(lyric)

//Operadores de alcance ou range operators
let names = ["Piper", "Alex", "Suzanne", "Gloria"]

names[0] // Imprimindo pelo indice name[0] do array names
names[1...3] //Imprimindo pelo intervalo 1...3 do array names
names[0...] //Imprimindo pelo intervalo com inicio até o final 0... do array names


/**
 =============================================================================================
 COMO USAR UM LOOP "WHILE" PARA REPETIR O TRABALHO.
 =============================================================================================
*/

//1° Exemplo básico do loop while.
var countdown = 10

while countdown > 0 {
  print("\(countdown)...")
  countdown -= 1
}

print("Decolar!")

//2° Exemplo loop while com random(in:) de Int e Double.
var roll = 0

while roll != 20 {
  roll = Int.random(in: 1...20)
  print("Eu rolei um \(roll)")
}

print("Golpe crítico!")

/**
 =============================================================================================
 COMO PULAR ITENS DE LOOP COM BREAK E CONTINUE.
 =============================================================================================
*/

//1° Exemplo loop for com continue.
let filenames = ["me.jpg", "work.txt", "sophie.jpg", "logo.psd"]

for filename in filenames {
  if filename.hasSuffix(".jpg") == false {
    continue
  }
  
  print("Imagem encontrada: \(filename)")
}


//2° Exemplo loop for com break.
let number1 = 4
let number2 = 14
var multiples = [Int]()

for i in 1...100_000 {
  if i.isMultiple(of: number1) && i.isMultiple(of: number2){
    multiples.append(i)
    
    if multiples.count == 10 {
      break
    }
    
  }
}

print(multiples)

//Portanto, use continuequando quiser pular o restante da iteração de loop atual e use breakquando quiser pular todas as iterações de loop restantes.
 
/**
 Agora que você pode usar condições e loops, gostaria que tentasse um problema clássico de ciência da computação. Não é difícil de entender, mas pode demorar um pouco para você resolver dependendo da sua experiência anterior!

 O problema é chamado fizz buzz e tem sido usado em entrevistas de emprego, testes de admissão em universidades e muito mais desde que me lembro. Seu objetivo é fazer um loop de 1 a 100 e, para cada número:

 Se for múltiplo de 3, imprima “Fizz”
 Se for múltiplo de 5, imprima “Buzz”
 Se for um múltiplo de 3 e 5, imprima “FizzBuzz”
 Caso contrário, basta imprimir o número.
 */

/**
 =============================================================================================
 CHECKPOINT 3.
 =============================================================================================
*/

for number in 1...100 {
  
  if number.isMultiple(of: 3) && number.isMultiple(of: 5){
    print("Número \(number) => FizzBuzz")
  }else if number.isMultiple(of: 3){
    print("Número \(number) => Fizz")
  }else if number.isMultiple(of: 5){
    print("Número \(number) => Buz")
  } else {
    print("Número \(number) => \(number)")
  }
}

