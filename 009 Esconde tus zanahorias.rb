# Esconde tus Zanahorias 
#
# Simpático juego de texto programado en Ruby que tiene como objetivo atrapar a los conejos escondidos, antes que ellos se coman tus zanahorias.
# Para jugarlo por la consola, idealmente a pantalla completa
#
# Objetivo del juego:
# Atrapar a los conejos (la cpu) antes que ellos atrapen tus zanahorias. 
# Cada uno tiene 2 vidas (2 conejos y 2 zanahorias).
# El jugador esconde sus zanahorias en el terreno y los conejos se esconden también allí.
# El jugador intenta atrapar a los conejos escribiendo una ubicación en el terreno y si hay un conjeno allí, es atrapado y descuenta un conejo. Siguiente, los conejos intentan buscar una zanahoria en el terreno de forma aleatoria. Si la encuentra, te descuenta una zanahora. Gana quien deje al oponente en cero.
#
# Logica del programa:
# La cpu elige 2 ubicaciones donde esconderse de forma aleatoria, de un array ya definido (terreno). Si detecta que ha sacado dos iguales, itera nuevamente. Estas ubicaciones las guarda en un array llamado (ubicaciones_cpu)
# El jugador ingresa manualmente los terrenos en un array llamado (ubicaciones_jugador).Si detecta que la ubicación no está incluida en el array definido (terreno), vuelve a iterar, de la misma forma, si son iguales.
# El ataque: el sistema compara la elección del jugador vs la ubicación del cpu usando (array.include?(elección)). Si detecta que está incluido, toma ese dato y lo borra de la ubicación, dejando el array de ubicación con un elemento menos. Cuando el array de ubicación queda en cero, gana el oponte. 
# De la misma forma, desde el punto de vista de la cpu, a diferencia que la ubicación la elige aleatoriamente. Para evitar que repita las mismas elecciones, cada elección se guarda en un array llamado (recuerdo_cpu). Si encuentra un valor incluido allí (repetido), volverá a elegir aleatoreamente.
#
# Programado y Creado por Carlos Toledo - 07 de agosto del 2022
#
puts "-----------------------------------------------------------------"
puts "|           Esconde tus Zanahorias by Carlos Toledo             |"
puts "-----------------------------------------------------------------"
print "\n"
puts "Los conejos quieren tus zanahorias y harán lo que sea por ellas."
puts "Elige 2 terrenos para esconder tus zanahorias, pero ten cuidado... 
hay conejos escondidos en todos lados (¡hasta en tus terrenos!)."
puts "Atrápalos antes que se coman tus zanahorias."
print "\n"
puts "* Te recomendamos jugar con lápiz y papel ya que los conejos son"
puts "  inteligentes y recuerdan donde atacaron anteriormente."

# terreno general, nunca se modifica
terreno = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]

# array ubicaciones y recuerdo cpu
ubicaciones_cpu = [] #memoria de la cpu
ubicaciones_jugador = [] #memoria del jugador
recuerdo_cpu = [] #recuedo de las jugadas anteriores de la cpu

# motor que elige las ubicaciones sin que se repitan. Itarará hasta que no sean iguales los terrenos
control_random = 0
while control_random != 1 #repetirá la secuencia hasta que se confirmme con el 1
    2.times do #rellena la memoria/array con 3 ubicaciones al azar
    num_rand = rand(0..8) #azar
    uuu = terreno[num_rand] #lee un terreno del array general
    ubicaciones_cpu.push (uuu) #lo escribe
  end
  #confirma que los terrenos no estén repetidos
  terreno1 = ubicaciones_cpu[0]
  terreno2 = ubicaciones_cpu[1]
    if terreno1 == terreno2
    ubicaciones_cpu = [] #si encuentra terrenos repetidos, limpia la memoria/array y vuleve a iterar
  else
    control_random = 1 #si no encuentra iguales, detiene el while dando un 1 a control
  end
end 

# display del terreno
print "\n"
puts "Estos son los terrenos para esconder tus zanahorias:"
print "\n"
puts " C1 C2 C3"
puts " B1 B2 B3"
puts " A1 A2 A3"
print "\n"

# motor que escribe la ubicaciones del jugador en el array. Si detecta que hay valores repetidos, limpia la memoria/array y vuelve a iterar
control_ubicaciones = 0
while control_ubicaciones != 1 #condición para salir de la iteración de ubicaciones
  puts "Esconde tus 2 zanahorias en diferentes terrenos."
  puts "Debes escribirlos con mayúscula (ejemplo C4):"

  while ubicaciones_jugador.length < 2 #exige que tenga 3 ubicaciones
    print ">"
    zahanorias = gets.chomp
    ubicaciones_jugador.push(zahanorias) #escribe en la memoria/array 
  end

  consulta = terreno & ubicaciones_jugador # comprar las ubicaciones con el terreno, para ver si se escribió bien
  largo_consulta = consulta.length #cuenta los resutados de la comparación
  
  if largo_consulta == 2 #si la comparación es igual a dos terrenos, acepta 
    control_ubicaciones = 1
      else #en caso que no, borra y vuelve a iterar
      print "\n"
      puts "*** Hay terrenos mal escritos o repetidos, Intenta de nuevo:"
      print "\n"
      ubicaciones_jugador = [] #borra la memoria/array
  end
end 

#mensaje de continuación
print "\n"
puts "¡Listo!"
puts "Tus zanahorias están escondidas en los siguientes terrenos: #{ubicaciones_jugador}"
puts "Anótalos para que no se te olviden..."
print "\n"

#para confirmar que no hay errores o trapas de la cpu, da la opción de ver la ubicaciones de los conejos
puts "¿Quieres ver donde están escondidos los conejos?"
puts "Escribe SOY TRAMPOSO o presiona ENTER para continuar..."
print ">"
trampa = gets.chomp
if trampa == "SOY TRAMPOSO"
  print "\n"
  puts " Ubicaciones de los conejos #{ubicaciones_cpu}" 
end

#historia
print "\n"
puts "                             Comienza el juego"
puts "                             -----------------"
print "\n"
puts "Una comadreja resentida te ha informado que 2 conejos se han escondido y atacarán esta noche, pero ellos no saben donde están tus zanahorias, así que intentarán probar suerte en cualquier terreno."
puts "¡Prepárate y mucha suerte!"
print "\n"
print "\n"

#pausa
puts "Presiona ENTER para continuar:"
continuar = gets.chomp
if continuar == true
end

#vidas iniciales
conejos_vidas = 2
zanahorias_vidas = 2

#motor de juego (While General)
while conejos_vidas != 0 && zanahorias_vidas != 0 #Se mantendrá jugando hasta que de cualqueria de los dos se cero (entregará un falso al while)

  print "\n"
  print "\n"
  puts "Así vamos:"
  puts "-----------"
  
  #muestra las vidas contando los elementos (conejos o zanahorias) de las ubicaciones
  print "Conejos escondidos:"
  conejos_vidas = ubicaciones_cpu.length
  puts conejos_vidas
  print "Zanahoras escondidas:"
  zanahorias_vidas = ubicaciones_jugador.length
  puts zanahorias_vidas

  #muestra nuevamente el terreno geneal y las ubicaciones actuales
  print "\n"
  print "\n"
  puts "Te recordamos el terreno:"
  print "\n"
  puts " C1 C2 C3"
  puts " B1 B2 B3"
  puts " A1 A2 A3"
  print "\n"
  print "Aquí estan escondidadas tus zanahoras: "
  print ubicaciones_jugador
  print "\n"
  print "\n"

  #intento del jugador
  puts ">>>> Intenta atrapar a los conejos. Recuerda que también pueden esconderse en los mismos terrenos que elegiste."
  puts "Recuerda escribirlos con mayúsculas (ejemplo D3):"
  print ">"
  intento_jugador = gets.chomp #intento del jugador

  #revisa que el intento esté inclido en la memoria/array de la cpu (ubicaciones_cpu)
  if ubicaciones_cpu.include?(intento_jugador) #el intento está incluida en la ubicación de la cpu?
    print "\n"
    puts ">>>>> ¡¡Has atrapado un conejo y lo has enviado a su casa!!"
    ubicaciones_cpu.delete(intento_jugador) #si detecta que está inclido, borra el elemnto de la memoria/array, así disminuye el conteo de los elementos
    
    # codicionador de vidas, para salirse (break) del while pincipal
    conejos_vidas = ubicaciones_cpu.length
    if conejos_vidas == 0
      break
    end

  else #en caso que no esté el intento en la ubicación, continua
    print "\n"
    puts ">>>>> Casi, pero el conejo no estaba en #{intento_jugador}."

    #pausa
    puts "Presiona ENTER para continuar:"
    continuar = gets.chomp
    if continuar == true
    end
  end

  #intento de la cpu
  print "\n"
  puts ">>>>> Ahora vienen los conejos a atacar. Presiona ENTER cuando estés listo:"

  #pausa
  continuar = gets.chomp
  if continuar == true
  end

  #Inteligencia. La cpu va generar un terreno aleatorio. Si detecta que está en su memoria (recuerdo_cpu), lo volverá a generar. Solo cuando detecte que no está en su memoria, saldrá de la iteración con el valor elegido (intento_cpu)
  while true
    aleatorio = rand(0..8)
    intento_cpu = terreno[aleatorio]
    if recuerdo_cpu.include?(intento_cpu)
      else #si no está en su memoria (nuevo terreno, saldrá de la iteración)
      break      
    end
  end
  recuerdo_cpu.push (intento_cpu) #luego, guarda el intento en la memoria para no repetirlo a futuro.

  #Confirmado que es un intento nuevo. Comparará con las ubicaciones del jugador. Si está incluida,la borrá, o sea, le quitará una zanahoria/vida
  if ubicaciones_jugador.include?(intento_cpu) #intento vs ubicación
    ubicaciones_jugador.delete(intento_cpu) #si está, lo borra
    puts ">>>>> ¡¡Un conejo se ha robado una zanahoria de tu terreno #{intento_cpu}, te has quedado con una menos!!"
    
    # condicionador de vidas para salirse (break) del while principal, del juego
    zanahorias_vidas = ubicaciones_jugador.length
    if zanahorias_vidas == 0
      break
    end

  else #si no no encuentra una ubicación, le avisa donde intentó atacar. Ese dato la cpu ya lo guardó (recuerdo_cpu)
      puts ">>>>> Uff! entraron al terreno #{intento_cpu}, pero no tenías zanahorias allí. ¡Buena suerte!"
  end

  #pausa
  puts "Presiona ENTER para continuar:"
  continuar = gets.chomp
  if continuar == true
  end

  #muestra las vida haciendo un conteo, que son los elementos que quedan en cada memoria/array.
  print "\n"
  puts "Así estan los puntajes:"
  puts "-----------------------"
  print "\n"
  print "Conejos escondidos:"
  conejos_vidas = ubicaciones_cpu.length
  puts conejos_vidas
  print "Zanahorias escondidas:"
  zanahorias_vidas = ubicaciones_jugador.length
  puts zanahorias_vidas
  print "\n"

  # Despues de cada ataque de la cpu, da la oportunidad de seguir o continuar. Si escribe cualquier cosa que no sea SALIR, continua el programa
  puts "¿Deseas seguir atrapando a los conejos que andan sueltos?"
  puts "Escriba SALIR o presione ENTER para continuar:"
  print ">"
  seguir = gets.chomp
  if seguir == "SALIR"
    print "\n"
    puts "¡Gracias por jugar. Nos vemos!"
    print "\n"
    puts "**** Juego creado y programado por Carlos Toledo en Leguaje Ruby con el objetivo practicar la programación / 07-08-2022 ****"
    print "\n"
    print "\n"
    exit
  end

  #limpieza de los datos ingresado en cada intento antes de seguir
  intento_cpu = 0
  intento_jugador = 0
end #fin del While Principal, termina el juego

#mensajes finales en dependencia de las vidas de cada uno
if conejos_vidas == 0 #pedió la cpu
  print "\n"
  print "\n"
  puts "¡¡¡Felicitaciones!!!"
  puts "Los conejos no te superaron, eres el mejor del mundo mundial" 
  puts "¡Gracias por jugar!"
  print "\n"
  puts "**** Juego creado y programado por Carlos Toledo en Leguaje Ruby con el objetivo practicar la programación / 07-08-2022 ****"
  print "\n"
  print "\n"
  exit
elsif zanahorias_vidas == 0 #perdió el jugador
  print "\n"
  print "\n"
  puts "¡¡¡Los conejos te dejaron sin zanahorias!!!"
  puts "No te rindas y vuelve a jugar"
  print "\n"
  puts "**** Juego creado y programado por Carlos Toledo en Leguaje Ruby con el objetivo practicar la programación / 07-08-2022 ****"
  print "\n"
  print "\n"
  exit
end