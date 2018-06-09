#################################################################################################
#################################################################################################
######## PRÁCTICA DE PROGRAMACIÓN EN ENSAMBLADOR MIPS R2000 CON EL SIMULADOR PCSPIM 1.0 #########
########################################## BUSCAMINAS ###########################################
#################################################################################################

#################################################################################################
###################################### SEGMENTO DE DATOS ########################################
#################################################################################################

.data

	tablero_minas:
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0

	tablero_jugadas:
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0
		.byte 0 0 0 0 0 0 0 0

	casillas_a_destapar:	.byte 0
	fin_juego: 				.byte 0

	mens_menu:			.asciiz "\n\n OPCIONES DE JUEGO\n"
	mens_op1: 			.asciiz "1. Nuevo juego\n"
	mens_op2: 			.asciiz "2. Destapar casilla\n"
	mens_op3: 			.asciiz "3. Ver solución\n"
	mens_op4:			.asciiz "4. Insertar bandera\n"
	mens_op5:			.asciiz "5. Antiminas\n"
	mens_op6:			.asciiz "6. Ver Ranking\n"
	mens_op7:			.asciiz "7. Juego por niveles (Minas por defecto)\n"
	mens_op8: 			.asciiz "8. Salir\n\n"
	mens_op: 			.asciiz "Elija opcion: "

	mens_minas: 		.asciiz "Introduzca número de minas a generar (1-64):\n"
	mens_semilla: 		.asciiz "\nIntroduzca un número para utilizar como semilla en la generación aleatoria de minas:\n"
	mens_gen: 			.asciiz "\nGenerando minas . . .\n"
	mens_fila: 			.asciiz "\nIntroduzca fila entre 1-8: "
	mens_col: 			.asciiz "\nIntroduzca columna entre 1-8: "

	mens_sigue: 		.asciiz "\n\n¡¡Casilla destapada con éxito, siga jugando!!\n"
	mens_destapada: 	.asciiz "\n\n¡¡Casilla ya destapada, pruebe con otra!!\n"
	mens_gana: 			.asciiz "\n\n¡¡ENHORABUENA!! HA GANADO LA PARTIDA\n"
	mens_pierde: 		.asciiz "\n\n¡¡MALA SUERTE, HA PERDIDO!! Intente otra partida\n"
	mens_nueva:			.asciiz "\n\n¡¡RECUERDE!! Debe iniciar un nuevo juego.\n¿Desea iniciarlo? (S/N): "

	mens_casrestantes:	.asciiz "\nEl nº de casillas restantes por destapar es de:     "
	mens_jugefectivas:	.asciiz "\nEl nº de jugadas efectivas hasta el momento es de:  "
	mens_jugrealizadas:	.asciiz "\nEl nº de jugadas realizadas hasta el momento es de: "
	mens_usoantiminas:	.asciiz "\nEl nº de veces que ha utilizado el antiminas es de: "

	mens_bandera:		.asciiz "\n¡¡AVISO!! Casilla con bandera. ¿Desea destaparla? (S/N): "
	mens_accion: 		.asciiz "\n¡¡CASILLA CON BANDERA DESTAPADA POR ORDEN DEL JUGADOR!!\n"
	mens_negacion:		.asciiz "\n¡¡NEGACION POR PARTE DEL JUGADOR!!\n"
	mens_insertar:		.asciiz "\n¡¡IMPOSIBLE INSERTAR BANDERA O DESTRUIR CASILLA!!\n Casilla descubierta, con bandera o ya destruida\n"
	mens_destruida:		.asciiz "\n¡¡CASILLA DESTRUIDA POR ORDEN DEL JUGADOR!!\n"
	mens_imposible:		.asciiz "\n¡¡ACCION NO DISPONIBLE AUN!! Realice un primer destape"
	mens_antiminas:		.asciiz "\nLa funcion antiminas esta limitada a 5 usos. ¡¡RECUERDELO!!"
	mens_agotado:		.asciiz "\n¡¡ANTIMINAS BLOQUEADO!! Límite de su uso sobrepasado"

	mens_datos:			.asciiz "\n\n¡¡ENHORABUENA!! Tiene la mejor puntuación registrada\nIntroduzca su nombre: "
	mens_puntuacion:	.asciiz "\nPuntuación conseguida en la partida: " 
	mens_posicion:		.asciiz "\nRecord conseguido por el jugador: "
	mens_norecord:		.asciiz "\n¡¡RECORD NO CONSEGUIDO POR EL JUGADOR!!"

	mens_principiante:	.asciiz "\n1.Nivel de dificultad Principiante  => (15 minas)\n"
	mens_intermedio:	.asciiz "2.Nivel de dificultad Intermedio    => (30 minas)\n"
	mens_dificil:		.asciiz "3.Nivel de dificultad Experto       => (45 minas)\n\n"

	cr: 				.asciiz "\n"
	esp:				.asciiz " "
	datos_usuario:		.space 11		# Espacio para imprimir los nombres de los jugadores	
	respuesta:			.space 2 		# Espacio para guardar la respuesta de jugador
	caracter:			.space 2		# Espacio para guardar los caracteres para imprime_tablero

	cod_mina: 			.byte -1
	cod_cubierta: 		.byte -2
	cod_bandera:		.byte -3
	cod_antiminas:		.byte -4

	car_mina: 			.byte 42 		# Carácter ASCII de '*'
	car_cubierta: 		.byte 45 		# Carácter ASCII de '-'
	car_bandera:		.byte 63 		# Carácter ASCII de '?'
	car_antiminas:		.byte 32 		# Carácter ASCII de ' '

	car_numeros: 		.byte 48 49 50 51 52 53 54 55 56 	# Caracteres ASCII de los nº 
															# 0, 1, 2, 3, 4, 5, 6, 7 y 8

#################################################################################################
####################################### RUTINA DE MEJORA ########################################
#################################################################################################
# Esta rutina de mejora ha sido creada para asegurar que el usuario no pueda introducir valores #																										
# erroneos que pueden desencadenar en conflictos en el programa o errores en su ejecucion		#
#################################################################################################

	mens_error:			.asciiz "\n¡¡ERROR!! Parametro introducido incorrecto.\nPor favor, introduzca un nº correcto.\n"

#################################################################################################
###################################### SEGMENTO DE CODIGO #######################################
#################################################################################################

.text	
						
main:  
	la 	$a0, mens_minas      			# Pedimos el nº de minas
	li 	$v0, 4				
	syscall

	jal	lee_numero						# Obtenemos el nº mediante polling
										# Guardamos las minas solicitadas
	move 	$s0, $v0					# $v0 = $s0 = nº de minas

	li 	$t0, 64 						# Cargamos en $t0 el valor 64
	bgt	$s0, $t0, error_numero			# Salta si es mayor que 64
	blez 	$s0, error_numero			# Para eliminar posibles errores internos, ponemos limites (1-64) 
	j 	imprime_semilla					# Si nº de minas esta entre los valores pide la semilla
	
error_numero:
	la 	$a0, mens_error      			# Imprimimos mensaje de error en nº de minas
	li 	$v0, 4				
	syscall	
	j 	main							# Volvemos a pedir las minas en este caso
	
imprime_semilla:
	la 	$a0, mens_semilla    			# Pedimos la semilla de generacion aleatoria
	li 	$v0, 4				
	syscall	

	jal	lee_numero						# Obtenemos el nº mediante polling
	move 	$s1, $v0					# $v0 = $s1 = semilla

	la 	$a0, mens_gen					# Escribimos generando minas....
	li 	$v0, 4				
	syscall	
	
	move 	$a0, $s0					# Pasamos a argumentos el nº de minas y la semilla
	move 	$a1, $s1
	jal 	genera_tablero_minas		# Generamos el tablero con las minas segun la semilla
	
	la 	$a0, tablero_jugadas			# Indica al inicializa_tablero la direccion a iniciar 
	lb 	$a1, cod_cubierta				# Imprimimos el tablero con las casillas cubiertas
	jal 	inicializa_tablero		

	la 	$a0, tablero_jugadas			
	jal	imprime_tablero
	
############################### VARIABLES PARA CONTEOS DEL PROGRAMA ###############################

	li 	$s2, 0							# Este valor sera utilizado para contar las jugadas efectivas
	li 	$s3, 0							# Este valor sera utilizado para contar las jugadas realizadas
	li	$s5, 0							# Este valor sera utilizado para redireccionar la semilla y
										# como contador para los usos del antiminas

pedir_opcion:							# Imprimimos el menu de juego	
	la	$a0, mens_menu					# Imprimimos las diferentes opciones de las que
	li	$v0, 4							# dispone el jugador para jugar la partida
	syscall
	
	la	$a0, mens_op1					# Imprimimos en pantalla el menu Nuevo Juego
	li	$v0, 4
	syscall

	la	$a0, mens_op2					# Imprimimos en pantalla el menu Destapar casilla	
	li	$v0, 4
	syscall

	la	$a0, mens_op3					# Imprimimos en pantalla el menu Ver solución
	li	$v0, 4
	syscall	

	la	$a0, mens_op4					# Imprimimos en pantalla el menu Insertar bandera
	li	$v0, 4
	syscall

	la	$a0, mens_op5					# Imprimimos en pantalla el menu Antiminas
	li	$v0, 4
	syscall
	
	la	$a0, mens_op6					# Imprimimos en pantalla el menu Ver Ranking
	li	$v0, 4
	syscall

	la	$a0, mens_op7					# Imprimimos en pantalla el menu Juego por niveles
	li	$v0, 4
	syscall
	
	la	$a0, mens_op8					# Imprimimos en pantalla el menu Salir
	li	$v0, 4
	syscall

opcion_elegida:							# Leemos la opcion de juego que el usuario desea
	la	$a0, mens_op					# y actuamos en consecuencia
	li	$v0, 4
	syscall

	jal	lee_numero						# Obtenemos el nº mediante polling

	move 	$s0, $v0					# $v0 = $s0 = opcion de usuario
	
	li	$t0, 1
	beq 	$s0, $t0, nueva_partida		# Si ha elegido la opcion 1 salta a nueva_partida

	li 	$t0, 2
	beq 	$s0, $t0, destapar_casilla	# Si ha elegido la opcion 2 salta a destapar_casilla

	li 	$t0, 3
	beq 	$s0, $t0, ver_solucion		# Si ha elegido la opcion 3 salta a ver_solucion

	li 	$t0, 4
	beq 	$s0, $t0, insertar_bandera	# Si ha elegido la opcion 4 salta a insertar_bandera

	li 	$t0, 5
	beq 	$s0, $t0, antiminas			# Si ha elegido la opcion 5 salta a antiminas

	li 	$t0, 6
	beq 	$s0, $t0, ver_ranking		# Si ha elegido la opcion 6 salta a ver_ranking

	li	$t0, 7
	beq 	$s0, $t0, juego_niveles		# Si ha elegido la opcion 7 salta a juego_niveles

	li 	$t0, 8
	beq 	$s0, $t0, fin_programa		# Si ha elegido la opcion 8 salta a fin_programa
	
	la	$a0, mens_error					# Si no ha introducido un valor correcto (1-8) 
	li	$v0, 4							# informamos al usuario y volvemos a leer la opcion
	syscall
	j	opcion_elegida					# Saltamos a la rutina indicada
			
#################################################################################################
######################################## NUEVA PARTIDA ##########################################
#################################################################################################

nueva_partida:
	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall
	j	main							# Volvemos a la rutina principal

#################################################################################################
####################################### DESTAPAR CASILLA ########################################
#################################################################################################

destapar_casilla:						# Pedimos las coordenadas de la casilla a destapar
	la	$a0, mens_fila					# Pide nº de fila en el tablero que desea destapar
	li	$v0, 4
	syscall

	jal	lee_numero						# Obtenemos el nº mediante polling
	move	$t0, $v0					# $s0 = $t0 = nº de fila
		
	la	$a0, mens_col					# Pide nº de columna en el tablero que desea destapar
	li	$v0, 4
	syscall

	jal	lee_numero						# Obtenemos el nº mediante polling		
	move	$t1, $v0					# $v0 = $t1 = nº de columna

	li	$t2, 8							# Cargamos en $t2 el valor 8
	blez	$t0, error_dest				# Comprobamos que las coordenadas introducidas
	bgt	$t0, $t2, error_dest			# son correctas, es decir estan entre (1-8)
	blez	$t1, error_dest				# Si los valores son erroneos se informa al usuario y
	bgt	$t1, $t2, error_dest			# se vuelven a pedir las coordenadas
	j	continua_destape				# Saltamos a la rutina indicada
		
error_dest:								# Rutina que se encarga de informar al usuario de					
	la	$a0, mens_error					# que los valores son erroneos
	li	$v0, 4
	syscall
	j	destapar_casilla				# Vuelve a pedir las coordenadas de la casilla

continua_destape:
	move 	$a0, $t0					# $a0 = $t0 = nº de fila
	move 	$a1, $t1					# $a1 = $t1 = nº de columna
										# Destapamos la casilla seleccionada
	jal 	destapa_casilla				# Segun el valor que devuelva destapa_casilla
										# saltaremos a las diferentes opciones
opciones_de_casilla:
	blt 	$v0, $0, ha_perdido			# Si se devuelve un nº <0 (-1) el usuario ha destapado mina
										# Saltamos a la rutina ha_perdido	
	li 	$t0, 0							# Si se devuelve un 0 el usuario ha solicitado destapadar
	beq 	$v0, $t0, cas_ya_destap		# una casilla ya destapada, saltamos a casilla_ya_destapada
	
	li 	$t0, 1							# Si se devuelve un 1 el usuario ha terminado de destapar
	beq 	$v0, $t0, ha_ganado			# saltamos a la rutina ha_ganado ya que no quedan mas casillas

	li 	$t0, 2							# Si se devuelve un 2 el usuario ha destapado la casilla con exito,
	beq 	$v0, $t0, cas_dest_exito	# Saltamos a casilla_destapada_exito
						
	li	$t0, 3							# Si se devuelve un 3 significa que el usuario que habia seleccionado
	beq 	$v0, $t0, cas_bandera		# una casilla con bandera no desea destapar la casilla
										# Saltamos a casilla_bandera
	li	$t0, 4							# Si se devuelve un 4 significa que el usuario ha destruido
	beq	$v0, $t0, cas_destruida			# la casilla seleccionada. Saltamos a casilla_destruida
		
#################################################################################################
################ FUNCIONES DE JUEGO SEGUN EL VALOR DEVUELTO POR DESTAPA CASILLA #################
#################################################################################################

# Ha_perdido, destapa_casilla = -1 #					
ha_perdido:		
	la 	$t1, fin_juego	
	li 	$t0, -1							# Guardamos un -1 en la variable fin_juego para informar
	sb	$t0, 0($t1) 					# de que hemos perdido el juego
	j 	hasta_que						# Saltamos a la rutina indicada

# Casilla ya destapada, destapa_casilla = 0 #	
cas_ya_destap:					
	la	$a0, tablero_jugadas		
	jal	imprime_tablero

	la	$a0, mens_destapada				# Imprimimos mensaje de casilla destapada
	li	$v0, 4
	syscall

	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	jugadas_efectivas			# Mostramos las estadisticas de juego
	j	pedir_opcion					# Saltamos a la rutina indicada
	
# Ha_ganado, destapa_casilla = 1 #
ha_ganado:
	beq	$s2, 0, valor_cero				# Si no ha habido jugadas efectivas, es que en el primer	
										# destape hemos sido ganadores ( para poner $s5 a 0 )
sigue_ganado:							
	la 	$t1, fin_juego
	li 	$t0, 1							# Guardamos un 1 en la variable fin_juego para informar
	sb	$t0, 0($t1) 					# de que hemos ganado el juego
	j	hasta_que						# Saltamos a la rutina indicada

# Casilla destapada con exito, destapa_casilla = 2 #
cas_dest_exito:				
	la	$a0, tablero_jugadas
	jal	imprime_tablero
	la	$a0, mens_sigue					# Imprimimos mensaje de casilla destapada con exito
	li	$v0, 4
	syscall
	beq	$s2, 0, regeneracion			# Ponemos a 0 el registro $s5 que sirve de semilla

sigue_exito:
	addi 	$s2, $s2, 1					# Incrementamos el contador de jugadas efectivas en 1
	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal	casillas_restantes				# Mostramos las estadisticas de juego
	j	pedir_opcion					# Saltamos a la rutina indicada
				
# Casilla con bandera, destapa_casilla = 3 #
cas_bandera:					
	la	$a0, mens_negacion				# Comunicamos al jugador que se niega a realizar el destape
	li	$v0, 4
	syscall

	la	$a0, tablero_jugadas
	jal	imprime_tablero					# Saltamos a la rutina indicada

	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall

	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	jugadas_efectivas			# Mostramos las estadisticas de juego
	j	pedir_opcion	

# Casilla destruida, destapa_casilla = 4 #
cas_destruida:					
	la	$a0, mens_destruida				# Comunicamos al jugador que ya se ha destruido la casilla
	li	$v0, 4
	syscall

	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	jugadas_efectivas			# Mostramos las estadisticas de juego
	j	pedir_opcion					# Saltamos a la rutina indicada

hasta_que:
	la 	$t0, fin_juego					# Segun la variable fin_juego hemos ganado o perdido
	lb 	$t1, 0($t0)						# $t1 = valor fin_juego = -1 => Hemos perdido
	li 	$t0, -1							# $t1 = valor fin_juego = 1 => Hemos ganado
	bne $t1, $t0, sino					# Salta si no es igual $t1 a $t0	
	la	$a0, tablero_minas
	jal	imprime_tablero					# Imprimimos el tablero con las minas
	la	$a0, mens_pierde				# Informamos al usuario que ha perdido
	li	$v0, 4
	syscall

	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	jugadas_efectivas			# Mostramos las estadisticas de juego
	j 	nuevo_juego

sino:
	li 	$t0, 1							# Cargamos el valor 1 en $t0
	bne	$t1, $t0, fin_programa			# Si el valor es distinto a 1 finaliza el programa
	la	$a0, tablero_minas				# porque debe ser 1, para corregir posibles errores
	jal	imprime_tablero					# Imprimimos el tablero con las minas
	la	$a0, mens_gana					# Informamos al usuario que ha ganado
	li	$v0, 4
	syscall

	addi 	$s2, $s2, 1					# Incrementamos el contador de jugadas efectivas en 1
	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	casillas_restantes			# Mostramos las estadisticas de juego
	jal 	ranking						# Guardamos informacion del usuario y puntuacion

#################################################################################################
##################################### RUTINA DE SEPTIEMBRE ######################################
#################################################################################################
#################################################################################################
#################################### ESTADISTICAS DE JUEGO ######################################
#################################################################################################

casillas_restantes:
	la	$a0, mens_casrestantes			# Mostramos al usuario las casillas que quedan
	li	$v0, 4							# por destapar para finalizar el juego
	syscall		
	
	la	$s1, casillas_a_destapar		# Leemos las casillas que quedan por destapar
	lb	$s1, 0($s1)						# en el contador de casillas_a_destapar
	move	$a0, $s1					# Movemos valores de registros

	li	$v0, 1							# Nº de casillas por destapar
	syscall

jugadas_efectivas:
	la	$a0, mens_jugefectivas			# Contabilizamos las jugadas en las que ha
	li	$v0, 4							# habido destape de casillas sin mina
	syscall								# y mostramos las jugadas que han sido efectivas

	move 	$a0, $s2
	li	$v0, 1							# Nº de jugadas efectivas
	syscall

jugadas_realizadas:
	la	$a0, mens_jugrealizadas			# Contabilizamos todas las jugadas realizadas
	li	$v0, 4					
	syscall						

	move 	$a0, $s3					# Movemos valores de registros
	li	$v0, 1							# Nº de jugadas realizadas
	syscall

jugadas_antiminas:
	la	$a0, mens_usoantiminas			# Contabilizamos todos los usos del antiminas
	li	$v0, 4					
	syscall						

	move 	$a0, $s5					# Movemos valores de registros
	li	$v0, 1							# Nº de usos del antiminas
	syscall

	jr	$ra								# Acabamos la rutina y volvemos

#################################################################################################
####################################### RUTINA DE MEJORA ########################################
#################################################################################################
# Esta rutina de mejora ha sido creada para indicar al usuario que debe iniciar un nuevo juego  #																										
# para proseguir jugando a este juego. Ademas, elimina la posibilidad de que una vez se haya	#
# ganado o perdido se puedan ejecutar otras opciones como destapar casilla, insertar bandera...	#
#################################################################################################
			
nuevo_juego:							# Explicamos al usuario que debe iniciar un nuevo juego
	la 	$a0, mens_nueva     			# para que no existan errores de juego ni puedan ejecutarse
	li 	$v0, 4							# otras opciones de juego
	syscall

respuesta_nueva:						# Comprobamos lo que desea hacer el usuario
	la	$a0, respuesta					# Reservamos espacio para almacenar la respuesta del jugador
	li	$a1, 2							# Espacio para caracter + byte nulo
	li 	$v0, 8							# Leemos la respuesta del jugador
	syscall

	lb	$t0, respuesta($0)				# Comparamos la respuesta del jugador
	li	$t1, 0x4E						# Si es una "N" finalizamos el juego
	beq	$t0, $t1, fin_programa 			# Salta si es igual $t0 a $t1
	li	$t1, 0x6E						# Si es una "n" finalizamos el juego
	beq	$t0, $t1, fin_programa			# Salta si es igual $t0 a $t1
	li	$t1, 0x53						# Si es una "S" iniciamos un nuevo juego
	beq	$t0, $t1, inicio_juego			# Salta si es igual $t0 a $t1
	li	$t1, 0x73						# Si es una "s" iniciamos un nuevo juego
	beq	$t0, $t1, inicio_juego			# Salta si es igual $t0 a $t1

novalido:								# Si es cualquier otro caracter comunicamos
	la 	$a0,mens_error					# al jugador que es un caracter no valido
	li 	$v0, 4
	syscall
	j 	respuesta_nueva					# Saltamosa a la rutina indicada

inicio_juego:							# Iniciamos un nuevo juego
	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall
	j 	nueva_partida					# Saltamosa a la rutina indicada

#################################################################################################
####################################### RUTINA DE MEJORA ########################################
#################################################################################################
# Esta rutina de mejora ha sido creada para indicar al usuario que debe realizar un primer   	#																										
# destape para proseguir jugando a este juego. Ademas, elimina la posibilidad de errores		#
# derivados de ejecuciones de antiminas, ya que si el primer destape es mina o varia el			#
# nº de casillas_a_destapar, al redireccionar el tablero encontramos errores en el juego.		#
#################################################################################################

destape_inicial:						# Si no hay un destape inicial, no se pueden
	la 	$a0, mens_imposible     		# utilizar otras opciones que estan bloqueadas
	li 	$v0, 4				
	syscall
	jal 	pedir_opcion				# Saltamosa a la rutina indicada

regeneracion:							# Utilizamos $s5 para el contador del uso
	li	$t0, 0							# del antiminas, para reutilizar los registros
	move	$s5, $t0					# Movemos valores de registros
	j	sigue_exito						# Saltamosa a la rutina indicada
	
valor_cero:								# Utilizamos $s5 para el contador del uso
	li	$t0, 0							# del antiminas, para reutilizar los registros
	move	$s5, $t0					# Movemos valores entre registros
	j	sigue_ganado					# Saltamosa a la rutina indicada

#################################################################################################
######################################### VER SOLUCION ##########################################
#################################################################################################

ver_solucion:							# Imprimimos el tablero con las minas
	la 	$a0, tablero_minas
	jal 	imprime_tablero				# Saltamosa a la rutina indicada
	j	pedir_opcion					# Terminamos la rutina y saltamos a a la rutina indicada

#################################################################################################
####################################### RUTINA DE MEJORA ########################################
#################################################################################################
# Esta rutina de mejora sirve para colocar en una casilla el caracter de una bandera, 		#																										
# no podra ser destapada hasta que el usuario decida su destape y nos servira para señalar	#
# casillas dudosas o en las que sepamos a ciencia cierta que se encuentra una mina			#
#################################################################################################	
#################################################################################################
####################################### INSERTAR BANDERA ########################################
#################################################################################################

insertar_bandera:			
	beq	$s2, 0, destape_inicial			# Si no ha habido ningun destape inicial no se accede
	la	$a0, mens_fila					# Pide nº de fila en el que 
	li	$v0, 4							# desea poner una bandera
	syscall

	li	$v0, 5
	syscall
	move	$t0, $v0					# $s0 = $t0 = nº de fila
		
	la	$a0, mens_col					# Pide nº de columna en el que
	li	$v0, 4							# desea poner una bandera
	syscall

	li	$v0, 5
	syscall					
	move	$t1, $v0					# $v0 = $t1 = nº de columna

	li	$t2, 8							# Cargamos en $t2 el valor 8
	blez	$t0, error_band				# Comprobamos que las coordenadas introducidas
	bgt	$t0, $t2, error_band			# son correctas, es decir estan entre (1-8)
	blez	$t1, error_band				# Si los valores son erroneos informa al usuario y
	bgt	$t1, $t2, error_band			# vuelve a pedir las coordenadas
	j	continua_bandera				# Terminamos la rutina y saltamos a a la rutina indicada
		
error_band:								# Rutina que se encarga de informar al usuario de					
	la	$a0, mens_error					# que los valores son erroneos
	li	$v0, 4
	syscall
	j	insertar_bandera				# Vuelve a pedir las coordenadas de la casilla

continua_bandera:
	move 	$a0, $t0					# $a0 = $t0 = nº de fila
	move 	$a1, $t1					# $a1 = $t1 = nº de columna
	jal	inserta_bandera					# Ponemos una bandera en la casilla seleccionada
	
	la	$a0, tablero_jugadas			
	jal	imprime_tablero					# Saltamosa a la rutina indicada

	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall

	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	jugadas_efectivas			# Mostramos las estadisticas de juego	
	j 	pedir_opcion					# Terminamos la rutina y saltamos a a la rutina indicada

#################################################################################################
##################################### RUTINA DE SEPTIEMBRE ######################################
#################################################################################################
#################################################################################################
########################################### ANTIMINAS ###########################################
#################################################################################################
#################################################################################################
# Descripción: Rutina que pide unas coordenadas y si en esa posicion se encuentra una			#
# 			mina la destruye, decrementando en una unidad las adyacentes, se queda 				#
#			destapada y con el carácter en blanco. En caso de no haber mina actua				#	
# 			como destapa_casilla.																#
#################################################################################################

antiminas:								# Su utilidad es destruir la casilla seleccionada
	beq	$s2, 0, destape_inicial			# Si no ha habido ningun destape inicial no se accede
	bge	$s5, 5, agotado					# Salta si es mayor o igual
	la 	$a0, mens_antiminas      		# Informamos al usuario de que el uso del antiminas
	li 	$v0, 4							# esta limitado a 5 veces
	syscall

	la	$a0, mens_usoantiminas			# Mostramos todos los usos del antiminas
	li	$v0, 4					
	syscall						

	move 	$a0, $s5
	li	$v0, 1							# Nº de usos del antiminas
	syscall

	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall
	
	la	$a0, mens_fila					# Pide nº de fila en el que 
	li	$v0, 4							# desea destruir la casilla
	syscall

	move	$t0, $v0					# $s0 = $t0 = nº de fila
		
	la	$a0, mens_col					# Pide nº de columna en el que
	li	$v0, 4							# desea destruir la casilla
	syscall

	jal	lee_numero						# Obtenemos el nº mediante polling				
			
	move	$t1, $v0					# $v0 = $t1 = nº de columna

	li	$t2,8							# Cargamos el valor 8 en $t2 
	blez	$t0, error_anti				# Comprobamos que las coordenadas introducidas
	bgt	$t0, $t2, error_anti			# son correctas, es decir estan entre (1-8)
	blez	$t1, error_anti				# Si los valores son erroneos informa al usuario y
	bgt	$t1, $t2, error_anti			# vuelve a pedir las coordenadas
	j	continua_antiminas				# Terminamos la rutina y saltamos a a la rutina indicada
		
error_anti:								# Rutina que se encarga de informar al usuario de					
	la	$a0, mens_error					# que los valores son erroneos
	li	$v0, 4
	syscall
	j 	antiminas						# Vuelve a pedir las coordenadas de la casilla
						
continua_antiminas:	
	move 	$a0, $t0					# $a0 = $t0 = nº de fila
	move 	$a1, $t1					# $a1 = $t1 = nº de columna
	jal	destruir_casilla				# Destruimos la casilla seleccionada

	la	$a0, tablero_jugadas			# Imprimimos el tablero_jugadas con la casilla destruida
	jal	imprime_tablero					# Saltamos a a la rutina indicada

	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall

	addi 	$s3, $s3, 1					# Incrementamos el contador de jugadas realizadas en 1
	jal 	casillas_restantes			# Mostramos las estadisticas de juego
	j 	pedir_opcion					# Terminamos la rutina y saltamos a a la rutina indicada

agotado:
	la	$a0, mens_agotado				# Informamos al usuario que se ha sobrepasado el uso
	li	$v0, 4							# del antiminas y ya no se puede utilizar mas
	syscall
	j	pedir_opcion					# Terminamos la rutina y saltamos a a la rutina indicada

#################################################################################################
####################################### RUTINA DE MEJORA ########################################
#################################################################################################
# Esta rutina de mejora sirve para guardar el nombre y la puntuacion del jugador que haya 		#																										
# logrado la mejor partida mostrandola cada vez que se desee y comparando con otras				#
# puntuaciones posteriores para guardar siempre la mejor puntuacion.							#
#################################################################################################
# Forma de puntuar en el ranking segun las estadisticas del juego:								#
#	$s2 = nº jugadas efectivas * 20 															#
# 	$s3 = nº jugadas realizadas * (-5)															#
# 	$s5 = nº de usos del antiminas * (-5)														#
#	$s4 = $s2 - ($s3 + $s5) y si $s4 < ó = a 0 no es una puntuacion valida.						#	
#################################################################################################
######################################### VER RANKING ###########################################
#################################################################################################
	
ver_ranking:							# Guardamos el jugador que ha logrado la mejor puntuacion
	beq	$s4, 0, no_recordgraba			# por eso si es = a 0 no ha logrado ninguna todavia
	la	$a0, mens_posicion
	li	$v0, 4							# Imprimimos el nombre del jugador que ha logrado el record
	syscall

	la	$a0, datos_usuario				# Nombre del jugador que ha logrado el record
	li	$v0, 4
	syscall

	la	$a0, mens_puntuacion			# Imprimimos la puntuacion lograda
	li	$v0, 4
	syscall
	move	$a0, $s4

	li	$v0, 1							# Nº de puntos logrados
	syscall
	j pedir_opcion						# Terminamos la rutina y saltamos a a la rutina indicada
	
ranking:								# Guardamos los datos del usuario que ha ganado
	beq 	$s4, 0, guardar_datos			# Si es la primera puntuacion guardamos los datos
	move	$s0, $s4					# Calculamos su puntuacion con la formula vista
	mul	$t0, $s2, 20					# Multiplicamos los registros por los valores establecidos
	mul	$t1, $s3, 5						# Multiplicamos los registros por los valores establecidos
	mul	$t2, $s5, 5						# Multiplicamos los registros por los valores establecidos
	add	$t1, $t1, $t2					# Sumamos los registros
	sub	$t2, $t0, $t1					# Restamos los registros
	move	$s1, $t2
	bge 	$s0, $s1, no_record			# Si la puntuacion no es mayor, no hay record
	move	$s4, $s1
	jal	guardar_nombre					# Saltamos a la rutina indicada

guardar_datos:							# Calculamos su puntuacion con la formula vista
	mul	$t0, $s2, 20					# Multiplicamos los registros por los valores establecidos
	mul	$t1, $s3, 5						# Multiplicamos los registros por los valores establecidos
	mul	$t2, $s5, 5						# Multiplicamos los registros por los valores establecidos
	add	$t1, $t1, $t2					# Si puntuacion < o = 0 no hay record
	sub	$t2, $t0, $t1					# Guardamos la puntuacion conseguida
	blez	$t2, no_record				# Salta si es menor o igual que cero
	move	$s4, $t2					# Movemos registros

guardar_nombre:					
	la 	$a0, mens_datos					# Pedimos los datos del jugador
	li 	$v0, 4
	syscall

	la 	$a0, datos_usuario				# Reservamos espacio para nombre del jugador
	li	$a1, 11							# 10 caracteres + byte nulo				
	li 	$v0, 8					
	syscall

	la	$a0, mens_puntuacion			# Imprimimos la puntuacion que ha logrado
	li	$v0, 4
	syscall
	move	$a0, $s4					# Movemos registros

	li	$v0, 1							# Nº de puntos logrados
	syscall

	jal 	nuevo_juego					# Saltamos a la rutina indicada

no_record:								# Si no hay record lo comunicamos al usuario
	la 	$a0, mens_norecord				
	li 	$v0, 4
	syscall
	jal  	nuevo_juego					# Saltamos a la rutina indicada

no_recordgraba:							# Si no se ha conseguido record tambien se comunica
	la	$a0, mens_norecord		
	li	$v0, 4
	syscall
	j 	pedir_opcion					# Saltamos a la rutina indicada

#################################################################################################
####################################### RUTINA DE MEJORA ########################################
#################################################################################################
# Esta rutina de mejora sirve para iniciar el tablero de 8 x 8 con un nº predeterminado 		#																										
# de minas segun la experiencia del jugador. No se ha considerado permitir un nº de destapes de	#
# minas debido a que el buscaminas de Windows no permite ningun destape de mina para continuar. #
#################################################################################################
#################################################################################################
###################################### JUEGO POR NIVELES ########################################
#################################################################################################

juego_niveles:							# Imprimimos los niveles y sus caracteristicas
	la	$a0, mens_principiante			# Imprimimos en pantalla el menu de Nivel de dificultad Principiante	
	li	$v0, 4
	syscall

	la	$a0, mens_intermedio			# Imprimimos en pantalla el menu de Nivel de dificultad Intermedio		
	li	$v0, 4
	syscall

	la	$a0, mens_dificil				# Imprimimos en pantalla el menu de Nivel de dificultad Dificil
	li	$v0, 4
	syscall

	la	$a0, mens_op					# Pedimos al usuario el nivel que desea	
	li	$v0, 4
	syscall
	
	li	$v0, 5							# Recogemos los datos introducidos
	syscall	
	move 	$s0, $v0					# $v0 = $s0 = opcion de usuario

	li	$t0, 1							# Cargamos un valor en el registro
	beq 	$s0, $t0, nivel_princ		# Si ha elegido la opcion 1 ponemos 15 minas
	
	li	$t0, 2							# Cargamos un valor en el registro
	beq 	$s0, $t0, nivel_medio		# Si ha elegido la opcion 2 ponemos 30 minas

	li 	$t0, 3							# Cargamos un valor en el registro	
	beq 	$s0, $t0, nivel_experto		# Si ha elegido la opcion 3 ponemos 45 minas

	la	$a0, mens_error					# Si no ha introducido un valor correcto (1-3) 
	li	$v0, 4							# informamos al usuario y volvemos a leer la opcion
	syscall
	j	juego_niveles					# Saltamos a la rutina indicada

nivel_princ:							# Ponemos las minas deseadas y pedimos la semilla
	mul 	$t0, $t0, 15				# de generacion aleatoria
	move 	$s0, $t0
	jal	imprime_retcarro				# Saltamos a la rutina indicada

nivel_medio:
	mul 	$t0, $t0, 15				# Multiplicamos los registros por los valores establecidos
	move 	$s0, $t0
	jal	imprime_retcarro				# Saltamos a la rutina indicada	

nivel_experto:
	mul 	$t0, $t0, 15				# Multiplicamos los registros por los valores establecidos
	move 	$s0, $t0
	jal	imprime_retcarro				# Saltamos a la rutina indicada

imprime_retcarro:
	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall
	jal	imprime_semilla					# Saltamos a la rutina indicada

#################################################################################################
############################################# SALIR #############################################
#################################################################################################

fin_programa:
	li	$v0, 10
	syscall								# Fin del programa

#################################################################################################
####################################### RUTINAS DE JUEGO ########################################
#################################################################################################
	
#################################################################################################
# Num_aleatorio (PRIMER PROCEDIMIENTO)															#
# Descripción: Dada una semilla y una cota superior, genera un nº 								#
#			pseudoaleatorio entre 0 y la cota -1.												#
# Parámetros: 																					#
# 	$a0 = Semilla 																				#
# 	$a1 = Cota superior para el nº aleatorio													#
# Devuelve: 																					#
# 	$v0 = Nº aleatorio generado																	#
#################################################################################################

num_aleatorio:
	addi 	$sp, $sp, -8				# Apilamos
	sw 	$s0, 4($sp)
	sw	$s1, 0($sp)
	
	li 	$s0, 1664525 					# Cte a para randomizar
	li 	$s1, 1013904223 				# Cte b para randomizar
	
	mul   $t1, $s0, $a0					# Multiplicamos los registros
	add   $t1, $t1, $s1					# Sumamos los registros
	divu  $t1, $a1						# Dividimos los registros
	mfhi  $v0							# Recuperamos el cociente de la division anterior
		
	lw    $s1, 0($sp)					# Desapilamos
	lw    $s0, 4($sp)
	addi  $sp, $sp, 8
	jr    $ra							# Terminamos la rutina y volvemos

#################################################################################################
# Direccion_casilla (SEGUNDO PROCEDIMIENTO)														#
# Descripción: Dada una coordenada en uno de los tableros, calcula la posición					#
#			de memoria en el segmento de datos donde se encuentra almacenado					#
#			el byte con el valor de la casilla.													#
# Parámetros: 																					#
# 	$a0: Direccion de la matriz sobre la que calcular la direccion								#
#			(tablero_jugadas o tablero_minas)													#
# 	$a1: Fila de la casilla																		#
# 	$a2: Columna de la casilla																	#
# Devuelve:																						#
# 	$v0: Direccion de memoria de la casilla														#
#################################################################################################
# Para conseguir la direccion de casilla usamos la siguiente formula:            				#
#	1: a = (nº de columnas de la matriz * Fila de la casilla) + columna de la casilla   		#                                                                     #
#	2: b = a - (nº de columnas de la matriz + 1)        	                              		#
#	3: Direccion de la casilla ($v0) = direccion del tablero base + b                   		#
#################################################################################################												#
# Resolucion de la explicacion anterior:														#
# 	$v0 = ($a1 - 1) * 8 + ($a2 - 1) + $a0 														#
#################################################################################################

direccion_casilla:						# Apilamos
	addi 	$sp, $sp, -4
	sw	$s0, 0($sp)						# No guardamos $ra porque esta rutina no llama 
										# a su vez a otra

	li	$s0, 8							# $s0 = Nº de columnas del tablero
	mul	$t0, $s0, $a1					# $t0 = Nº de columnas del tablero * Fila de la casilla
	add	$t1, $t0, $a2					# $t1 = $t0 + Columna de la casilla
	addi	$t2, $s0, 1					# $t2 = Nº de columnas + 1
	sub	$t1, $t1, $t2					# Restamos nº de columnas + 1 a $t1
	add	$v0, $t1, $a0					# Dirección casilla($v0) = Dirección del tablero + $t1
								
	lw	$s0, 0($sp)						# Desapilamos
	addi 	$sp, $sp,4
	jr 	$ra


#################################################################################################
# Obten_casilla (TERCER PROCEDIMIENTO)															#
# Descripción: Acude a un tablero para recuperar el valor de una de sus casillas.				#
# Parámetros:																					#
# 	$a0: Direccion de la matriz sobre la que calcular la direccion								#
#			(tablero_jugadas o tablero_minas)													#
# 	$a1 = Fila de la casilla																	#	
# 	$a2 = Columna de la casilla																	#
# Devuelve:																						#
# 	$v0 = Valor de la casilla. Este puede ser (0-8) indicando nº de minas adyacentes,			#
#			entero con valor igual a cod_mina indicando que hay una mina,						#
# 			entero con valor igual a cod_cubierta para indicar que la casilla					#
#			esta sin descubrir, entero con valor igual a cod_bandera indicando 					#
#			que hay una bandera o entero con valor igual a cod_antiminas indicando				#
#			que la casilla ha sido destruida por orden del jugador.								#
#################################################################################################

obten_casilla:							# Apilamos
	addi 	$sp, $sp, -4
	sw    $ra, 0($sp)				
	jal 	direccion_casilla		
								
	lb 	$v0, 0($v0) 					# Guardamos el valor de la casilla
										# Desapilamos
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra								# Terminamos la rutina y volvemos


#################################################################################################
# Cambia_casilla (CUARTO PROCEDIMIENTO)															#
# Descripción: Esta rutina accede a un tablero para cambiar el valor de una de sus casillas.    #
# Parámetros:																					#
# 	$a0: Direccion de la matriz sobre la que calcular la direccion								#
#			(tablero_jugadas o tablero_minas)													#
# 	$a1 = Fila de la casilla																	#
# 	$a2 = Columna casilla																		#
# 	$a3 = Dato a guardar en casilla																#
#################################################################################################

cambia_casilla:							# Apilamos
	addi 	$sp, $sp, -4
	sw 	$ra, 0($sp)
	jal 	direccion_casilla 			# Terminamos la rutina y volvemos
								
	sb 	$a3, 0($v0)						# Guardamos en la casilla el dato de $a3
										# Desapilamos
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra								# Terminamos la rutina y volvemos


#################################################################################################
# Imprime_tablero (QUINTO PROCEDIMIENTO)														#
# Descripción: Imprime un tablero por la consola. Interpretara los bytes de la matriz           #
#                	traduciendolos a su correspondiente representacion ASCII. 					#
#			Por ejemplo un nº entre 0 y 8 se indexara sobre el 									#
#			vector car_numeros para obtener su codigo ASCII.  									#
# Parámetros:																					#
# 	$a0: Direccion de la matriz sobre la que calcular la direccion								#
#			(tablero_jugadas o tablero_minas)													#
# 	$t0 = Variable para recorrer el bucle (columnas)											#
# 	$t1 = Contador																				#
# 	$t2 = (64) Limite maximo de posiciones														#
# 	$t3 = 8, filas y columnas para comparar														#
#################################################################################################

imprime_tablero:						# Apilamos
	addi	$sp, $sp, -8 			
	sw 	$ra, 0($sp)					
	sw	$s0, 4($sp)
	
	li	$t1, 0							# Cargamos contador y limite
	li	$t2, 64
	li	$t3, 8
	li	$t0, 1
	move	$s0, $a0					# Cargamos la direccion de tablero en $s0
								
	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall

imprime_nums_col:						# Bucle encargado de la impresion de los
	la	$a0, esp						# nº de cada columna del tablero	
	li	$v0, 4
	syscall
	beq	$t0, 1, otro_espacio			# Imprime un espacio mas en el primero para 
	j 	impresion_normal				# que quede alineado con las casillas

otro_espacio:						
	syscall

impresion_normal:
	move	$a0, $t0
	li	$v0, 1
	syscall
	addi	$t0, $t0, 1
	ble	$t0, $t3, imprime_nums_col		# Continua imprimiendo hasta que $t0 sea menor o igual que 8

	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall

	li	$t4, 1							# Contador del nº de filas que se van insertando

imprime_nums_fil:
	li	$t0, 1
	move	$a0, $t4
	li	$v0, 1
	syscall

bucle:
	la	$a0, esp
	li	$v0, 4
	syscall
	
	add	$s1, $s0, $t1					# Dirección del tablero + nº casilla
	lb	$s1, 0($s1)						# $s1 = Valor contenido en la casilla
	
	lb	$t5, cod_mina($0)				# Si hay una mina en la casilla se imprime el caracter '*'
	beq	$s1, $t5, impr_mina				# Saltamos si es igual a $t5
	lb 	$t5, cod_cubierta($0)			# Si hay una casilla sin descubrir se imprime el caracter '-'
	beq	$s1, $t5, impr_cubierta			# Saltamos si es igual a $t5
	lb 	$t5, cod_bandera($0)			# Si hay una casilla con bandera se imprime el caracter 'Ø'
	beq	$s1, $t5, impr_bandera			# Saltamos si es igual a $t5	
	lb	$t5, cod_antiminas($0)			# Si hay una casilla destruida se imprime el caracter ' '
	beq	$s1, $t5, impr_antiminas		# Saltamos si es igual a $t5
								
	la 	$t5, car_numeros				# Si no es ninguna de las anteriores sera un nº
	add	$s1, $s1, $t5					# Obtenemos el valor ASCII del nº que hay en la casilla
	lb	$t5, 0($s1)
	sb	$t5, caracter($0)				# Guardamos el valor ASCII del nº en el espacio reservado
	j	fin_impresion					# Imprimimos el tablero

impr_mina:								# Imprimimos el caracter de una mina
	lb	$t5, car_mina($0)
	sb	$t5, caracter($0)
	j	fin_impresion
							
impr_cubierta:							# Imprimimos el caracter de una casilla cubierta				
	lb	$t5, car_cubierta($0)
	sb	$t5, caracter($0)
	j	fin_impresion	

impr_bandera:							# Imprimimos el caracter de una casilla cubierta con una bandera
	lb	$t5, car_bandera($0)
	sb	$t5, caracter($0)
	j	fin_impresion

impr_antiminas:							# Imprimimos el caracter de una casilla destruida
	lb	$t5, car_antiminas($0)
	sb	$t5, caracter($0)
	j	fin_impresion

fin_impresion:							# Fin de la impresión
	la 	$a0, caracter
	li	$v0, 4
	syscall

	addi	$t1, $t1, 1					# Incrementamos contadores
	addi	$t0, $t0, 1

	beq	$t1, $t2, fin_imprime_tablero	# Salta si es igual a $t2
	ble	$t0, $t3, bucle					# Salta si es menor o igual a $t3

	la	$a0, cr							# Imprimimos un retorno de carro
	li	$v0, 4
	syscall
	
	addi	$t4, $t4, 1					# Aumentamos el contador del nº de filas
	j	imprime_nums_fil

fin_imprime_tablero:
	lw 	$ra, 0($sp)						# Desapilamos		
	lw 	$s0, 4($sp)
	addi 	$sp, $sp, 8
	jr	$ra					

#################################################################################################
# Inicializa_tablero (SEXTO PROCEDIMIENTO)														#
# Descripción: Inicializa un tablero con un valor pasado como parametro.						#
# Parámetros:																					#
# 	$a0: Direccion de la matriz sobre la que calcular la direccion								#
#			(tablero_jugadas o tablero_minas)													#
# 	$a1 = Valor a inicializar																	#
# 	$t0 = Contador																				#
# 	$t1 = (64) Limite maximo de posiciones														#
#################################################################################################

inicializa_tablero:
	addi 	$sp, $sp, -4				# Apilamos
	sw 	$ra, 0($sp)
	li 	$t0, 0 							# Cargamos el contador y el limite de posiciones
	li 	$t1, 64 				
	move 	$t2, $a0

bucle_inicializa:
	beq $t0, $t1, fin_inicializa
	sb 	$a1, 0($t2)						# Inicializamos con el valor de $a1
	addi $t2, $t2, 1
	addi $t0, $t0, 1  					# Incrementamos el contador
	j 	bucle_inicializa				# Saltamos a la rutina indicada

fin_inicializa:							# Desapilamos
	lw 	$ra, 0($sp)
	addi 	$sp, $sp, 4
	jr 	$ra								# Terminamos la rutina y volvemos

#################################################################################################
# Genera_tablero_minas (SÉPTIMO PROCEDIMIENTO)													#
# Descripción: Se ubican aleatoriamente las minas en tablero_minas actualizando					#
# 			el resto de casillas con el nº de minas adyacentes, para ello						#
# 			se invocara a la rutina Incrementa_adyacentes. Tambien hay que actualizar			#
#			la variable casillas_a_destapar.													#
# Parámetros:																					#
# 	$a0 = Nº de minas a ubicar ($s0)															#
# 	$a1 = Semilla en la generacion aleatoria de minas ($s1)										#
# 	$t3 = Carga la direccion de codigo mina														#
# 	$t2 = Contador para colocar minas															#
#################################################################################################

genera_tablero_minas:					# Apilamos		
	addi	$sp, $sp, -12
	sw	$ra, 12($sp)		
	sw	$s0, 8($sp)
	sw	$s1, 4($sp)
		
	move 	$t0, $a0					# Ahora $t0 = nº minas y $t1 = semilla
	move 	$t1, $a1					

	addi	$sp, $sp,-8					# Apilamos
	sw 	$t0, 4($sp)
	sw 	$t1, 0($sp)

	la 	$a0, tablero_minas				# Le pasamos la dirección del tablero a inicializar
	move 	$a1, $zero					# Inicializamos casillas del tablero_minas con el valor cero
	jal 	inicializa_tablero			# Invocamos a la rutina

	lw 	$t1, 0($sp)						# Desapilamos
	lw 	$t0, 4($sp)
	addi 	$sp, $sp, 8

	add 	$t2, $zero, 0	 			# $t2 llevará la cuenta del nº de minas insertadas 
										# en el tablero
	lb 	$t3, cod_mina					# $t3 contiene el valor de cod_mina 
	li 	$a1, 64							# Argumento $a1 = cota superior + 1

insertar_mina: 
	beq $t2, $t0, fin_genera_tablero	# Si contador_minas = a num_minas entonces salir del bucle
	
	move $a0, $t1						# Pasamos la semilla para generar un nº aleatorio			
	
	addi $sp, $sp, -16 					# Apilamos
	sw    $t3, 12($sp)				
	sw    $t2, 8($sp)
	sw    $t1, 4($sp)
	sw    $t0, 0($sp)

	jal 	num_aleatorio				# Generamos un nº aleatorio
	
	lw	$t0, 0($sp)						# Desapilamos
	lw 	$t1, 4($sp)
	lw 	$t2, 8($sp)
	lw 	$t3, 12($sp)
	addi 	$sp, $sp, 16
	
	move 	$t1, $v0					# $t1 = nº aleatorio que será utilizado como próxima semilla
	la 	$t4, tablero_minas				# $t4 = contiene la direcion de comienzo de tablero_minas
	add 	$t4, $t4, $t1				# Obtenemos la dirección en la que se va a insertar una mina $t4
	lb 	$t5, 0($t4)						# Comprobamos que no haya una mina en la posición generada
	beq	$t5, $t3, insertar_mina			# Si hay una mina volvemos a generar de nuevo otra casilla
	sb	$t3, 0($t4)						# Guardamos la mina en la casilla obtenida
	
	addi	$sp, $sp,-20 				# Apilamos
	sw	$a0, 16($sp)
	sw    $t3, 12($sp)				
	sw    $t2, 8($sp)
	sw    $t1, 4($sp)
	sw    $t0, 0($sp)

	move 	$a0, $t1					# Enviamos como argumento el nº de la casilla
	jal 	incrementa_adyacentes		# Saltamos a la rutina indicada
	
	lw 	$t0, 0($sp)						# Desapilamos
	lw 	$t1, 4($sp)
	lw 	$t2, 8($sp)
	lw	$t3, 12($sp)
	lw 	$a0, 16($sp)
	addi 	$sp, $sp, 20
	
	addi	$t2, $t2, 1					# Incrementamos el contador de minas
	j 	insertar_mina					# Saltamos a la rutina indicada

fin_genera_tablero:
	li 	$t1, 64							# Cargamos valores
	sub 	$t1, $t1, $t0				# Nº de casillas que quedan por destapar		
	la 	$t2, casillas_a_destapar 	
	sb 	$t1, 0($t2)						# Actualizamos la variable casillas_a_destapar		
		
	lw	$ra, 12($sp)					# Desapilamos
	lw	$s0, 8($sp)
	lw	$s1, 4($sp)
	addi 	$sp, $sp, 12
	jr	$ra								# Terminamos la rutina y volvemos

#################################################################################################
# Incrementa_adyacentes (OCTAVO PROCEDIMIENTO)													#
# Descripción: Accede a tablero_minas para incrementar en una unidad el valor					#
# 			de todas las casillas adyacentes a la que se pasa como parámetro.					#
#			Una casilla puede tener hasta	8 casillas adyacentes, pero antes de				#
#			calcular la direccion de memoria de una casilla habra que comprobar					#
#			que esta dentro de los limites del tablero. Decrementara en una unidad				#
#			las casillas adyacentes si la rutina destruir_casilla entra en funcionamiento.		#
# Parámetros: 																					#
# 	$a0 = Casilla de la mina																	#
# 	$t0 = Direccion del tablero_minas															#
# 	$t2 = Cociente (para calcular la posicion)													#
#################################################################################################

incrementa_adyacentes:					
	addi	$sp, $sp, -16 				# Apilamos
	sw 	$ra, 12($sp)				
	sw 	$s0, 8($sp)					
	sw 	$s1, 4($sp)					

	la 	$t0, tablero_minas				# $t0 = direcion de comienzo de tablero_minas
	add 	$s0, $t0, $a0				# $s0 = dirección de la casilla que contiene la mina				
	li 		$t0, 8						# Cargamos en 8 en $t0 para poder usar el eregistro en la division 
	div 	$a0, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$s1							# Obtenemos el Cociente en $s1 resultante de la operacion anterior

###################################### CASILLA SUPERIOR #########################################
#################################################################################################

cas_superior:
	addi 	$t1, $a0, -8				# Calculamos la posición y la almacenamos en $t1
	bltz 	$t1, cas_inferior			# Si es una casilla menor que cero saltamos (no existe o no es valida)
	addi	$sp, $sp, -4				# Apilamos el parámetro $a0
	sw   	$a0, 0($sp)					# Guardamos en pila
	move 	$a0, $t1					# Actualizamos la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp,4

################################## CASILLA SUPERIOR IZQUIERDA ###################################
#################################################################################################

cas_superior_izquierda:
	addi 	$t1, $a0, -9				# Calculamos la posición y la almacenamos en $t1
	div 	$t1, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$t2							# Obtenemos el Cociente en $t2 resultante de la operacion anterior
	addi 	$t2, $t2, 1					# Para que sea una casilla correcta, su cociente+1 debe ser igual que el de la casilla seleccionada
	bne $t2, $s1, cas_superior_derecha	# Si es una casilla no valida saltamos para no actualizarla
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp, 4

################################### CASILLA SUPERIOR DERECHA ####################################
#################################################################################################

cas_superior_derecha:
	addi 	$t1, $a0, -7				# Calculamos la posición y la almacenamos en $t1
	div 	$t1, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$t2							# Obtenemos el Cociente en $t2 resultante de la operacion anterior
	addi 	$t2, $t2, 1					# Para que sea una casilla correcta, su cociente+1 debe ser igual que el de la casilla seleccionada
	bne 	$t2, $s1, cas_inferior		# Si es una casilla no valida saltamos para no actualizarla
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp,4

###################################### CASILLA INFERIOR #########################################
#################################################################################################
				
cas_inferior:
	addi 	$t1, $a0, 8					# Calculamos la posición y la almacenamos en $t1
	li 	$t2, 63							# Cargamos en el valor 63 en $t2
	bgt 	$t1, $t2, cas_derecha		# Si la casilla es mayor de 63 entonces es no valida y saltamos para no actualizarla
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp, 4

################################## CASILLA INFERIOR DERECHA #####################################
#################################################################################################

cas_inferior_derecha:
	addi	$t1, $a0, 9					# Calculamos la posición y la almacenamos en $t1
	div 	$t1, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$t2							# Obtenemos el Cociente en $t2 resultante de la operacion anterior
	addi 	$t2, $t2, -1				# Para que sea una casilla correcta, su cociente-1 debe ser igual que el de la casilla seleccionada
	bne $t2,$s1, cas_inferior_izquierda # Si es una casilla no valida saltamos para no actualizarla
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)									
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp, 4

################################## CASILLA INFERIOR IZQUIERDA ###################################
#################################################################################################

cas_inferior_izquierda:
	addi 	$t1, $a0, 7					# Calculamos la posición y la almacenamos en $t1
	div 	$t1, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$t2							# Obtenemos el Cociente en $t2 resultante de la operacion anterior
	addi 	$t2, $t2, -1				# Para que sea una casilla correcta, su cociente-1 debe ser igual que el de la casilla seleccionada
	bne 	$t2, $s1, cas_derecha		# Si es una casilla no valida saltamos para no actualizarla
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp, 4

####################################### CASILLA DERECHA #########################################
#################################################################################################

cas_derecha:
	addi 	$t1, $a0, 1					# Calculamos la posición y la almacenamos en $t1
	div 	$t1, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$t2							# Obtenemos el Cociente en $t2 resultante de la operacion anterior				 
	bne 	$t2, $s1, cas_izquierda		# Para que sea una casilla correcta, su cociente debe ser igual que el de la casilla seleccionada
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp, 4

###################################### CASILLA IZQUIERDA ########################################
#################################################################################################

cas_izquierda:
	addi 	$t1, $a0, -1				# Calculamos la posición y la almacenamos en $t1
	div 	$t1, $t0					# Dividimos el nº de casilla entre 8 ===>$t0 = 8
	mflo 	$t2							# Obtenemos el Cociente en $t2 resultante de la operacion anterior
	bne 	$t2, $s1, fin_incrementa	# Para que sea una casilla correcta, su cociente debe ser igual que el de la casilla seleccionada
	addi	$sp, $sp, -4				# Apilamos
	sw    $a0, 0($sp)	
	move 	$a0, $t1					# Vamos a actualizar la casilla cuya posición está contenida en $t1
	jal 	incrementa					# Saltamos a la rutina incrementa
	lw	$a0, 0($sp)						# Desapilamos
	addi	$sp, $sp,4

fin_incrementa:							# Finalizamos la rutina
	lw 	$ra, 12($sp)					# Desapilamos		
	lw 	$s0, 8($sp)
	lw 	$s1, 4($sp)
	addi 	$sp, $sp, 16

	jr    $ra							# Terminamos la rutina y volvemos

#################################################################################################
# Incrementa (Rutina auxiliar de Incrementa_adyacentes)											#
# Descripción: Comprueba si hay una mina, en caso de no haberla incrementa el contenido en 1	#
# Parámetros:																					#
# 	$a0 = Casilla a comprobar e incrementar														#
# 	$t2 = Codigo de mina																		#
# 	$s0 = Contenido de la casilla																#
#################################################################################################

incrementa:						
	addi	$sp, $sp, -12 				# Apilamos
	sw 	$ra, 8($sp)					
	sw 	$s0, 4($sp)					
		
	la	$t1, tablero_minas				# Obtenemos la dirección de comienzo del tablero
	add	$t1, $t1, $a0					# Obtenemos la dirección de la casilla a actualizar
	lb 	$s0, 0($t1)						# Cargamos el valor contenido en la casilla
	lb 	$t2, cod_mina		
	beq $s0, $t2, no_incrementa			# Comprobamos si hay ninguna mina en la casilla para no actualizarla
	add $s0, $s0, 1						# Sumamos uno al valor de la casilla
	sb 	$s0, 0($t1)						# Guardamos el nuevo valor

no_incrementa:							# Desapilamos
	lw 	$ra, 8($sp)	
	lw 	$s0, 4($sp)
	addi 	$sp, $sp, 12
	jr    $ra							# Terminamos la rutina y volvemos

#################################################################################################
# Destapa_casilla (NOVENO PROCEDIMIENTO)														#	
# Descripción: Esta rutina realiza el destape de la casilla solicitada							#
# Parámetros:																					#
#	$a1 = Fila de la casilla a destapar															#		
#	$a2 = Columna de la casilla a destapar														#
# Devuelve:																						#
#	$v0 = -1, Si se ha destapado una mina														#				
#		0, Si la casilla ya estaba destapada													#	
#		1, Si la casilla ha sido destapada correctamente y no quedan mas por destapar			#
#		2, Si se ha destapado la casilla y quedan mas por destapar								#
#		3, Si la casilla contiene una bandera y el jugador no desea destaparla					#
#		4, Si la casilla ya ha sido destruida													#
#################################################################################################

destapa_casilla:
	addi	$sp, $sp, -12				# Apilamos
	sw	$s1, 8($sp)
	sw	$s0, 4($sp)				
	sw	$ra, 0($sp)					

destape:								# Esta etiqueta se utiliza en el caso de que en 
	addi	$sp, $sp, -8				# el primer destape se encuentre una mina
	sw	$a1, 4($sp)					
	sw  $a0, 0($sp)
										# Cargamos los parámetros para pasarlos a la rutina obten_casilla
	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_jugadas			# Dirección del tablero de jugadas
	jal 	obten_casilla				# Saltamos a obten_casilla

	lw 	$a1, 4($sp)						# Desapilamos	
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8
	move 	$t0, $v0					# Guardamos el valor devuelto por la rutina moviendolo de resgistro

	lb 	$t1, cod_cubierta($0) 			# Cargamos los códigos de cubierta y bandera
	li	$v0, 0							# Guardamos el valor 0 por si cumple la condición de salto
	bgt 	$t0, $t1, fin_destapa		# Si es mayor que $t1 salta a fin_destapa

	lb	$t1, cod_antiminas($0)
	li	$v0, 4							# Si la casilla esta destruida devolvemos el control a la rutina
	beq  $t0, $t1, fin_destapa			# Salta si es igual que $t1

	lb	$t1, cod_bandera($0)			# Comprobamos el valor de la casilla: se puede destapar si es cod_cubierta o cod_bandera
	beq	$t0, $t1, destape_bandera		# Salta si es igual que $t1
	jal 	continuar					# Saltamos a oontinuar

destape_bandera:
	move	$s0, $a0					# Guardamos el valor de los parámetros porque vamos a modificarlos
	move	$s1, $a1					# Guardamos el valor de los parámetros porque vamos a modificarlos

pedir_confirmacion:
	la	$a0, mens_bandera				# Imprimimos aviso de que la casilla contiene una bandera
	li	$v0, 4
	syscall
	
	la	$a0, respuesta					# Buffer donde se almacenará la respuesta del jugador
	li	$a1, 2							# Tamaño es de un caracter + el byte nulo que añade PCSpim
	li 	$v0, 8						
	syscall

	lb	$t0, respuesta($0)				# Cargamos la respuesta del jugador
	li	$v0, 3							# Cargamos el valor devuelto en el caso de que el jugador no quiera continuar
	li	$t1, 0x4E						# Caracter ASCII en hexadecimal de N mayúscula (en decimal 78)
	beq	$t0, $t1, fin_destapa 			# Salta si $t0 es igual que $t1
	li	$t1, 0x6E						# Carácter ASCII en hexadecimal de n minúscula (en decimal 142)
	beq	$t0, $t1, fin_destapa 			# Salta si $t0 es igual que $t1
	li	$t1, 0x53						# Carácter ASCII en hexadecimal de S minúscula (en decimal 115)
	beq	$t0, $t1, recuperar_posicion	# Salta si $t0 es igual que $t1
	li	$t1, 0x73						# Carácter ASCII en hexadecimal de s minúscula (en decimal 147)
	beq	$t0, $t1, recuperar_posicion	# Salta si $t0 es igual que $t1

no_valido:
	la 	$a0, mens_error					# Imprime mensaje de aviso de error
	li 	$v0, 4
	syscall
	j 	pedir_confirmacion				# Salta a la rutina indicada

recuperar_posicion:
	la	$a0, mens_accion				# Imprimimos aviso de que la casilla contiene una bandera
	li	$v0, 4
	syscall

	move	$a0, $s0					# Recuperamos el valor de los parámetros
	move	$a1, $s1

continuar:
	addi	$sp, $sp, -8				# Apilamos
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)
										# Cargamos los parámetros para pasarlos a la rutina obten_casilla
	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 		$a0, tablero_minas			# Dirección del tablero de minas
	jal 	obten_casilla

	lw 		$a1, 4($sp)					# Desapilamos	
	lw 		$a0, 0($sp)					 
	addi	$sp, $sp, 8

	lb	$t1, cod_mina($0)				# Cargamos el código de mina para comparar
	move 	$t0, $v0					# Movemos los valores de un registro a otro
	li	$v0, -1							# Valor devuelto en el caso de que hayamos encontrado una mina 	
	bne	$t0, $t1, no_mina				# Comparamos el valor con cod_mina	

#################################################################################################
##################################### RUTINA DE SEPTIEMBRE ######################################
#################################################################################################

redirecciona:
	bne	$s2, 0, fin_destapa				# Si han habido jugadas efectivas, no es el primer destape
						
	move 	$a2, $a1					# Movemos valores por motivos de utilizacion de registro		
	move 	$a1, $a0					

	addi	$sp, $sp, -8				# Apilamos
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	la	$s1, casillas_a_destapar		# Leemos las casillas que quedan por destapar
	lb	$s1, 0($s1)						# en el contador de casillas_a_destapar
	move	$t0, $s1					# Movemos valores de registros
	li	$t1, 64							# Cargamos valores en $t1
	sub	$a0, $t1, $t0					# Restamos 64 a las casillas_a_destapar para 
	addi	$s5, $s5, 1					# conocer el nº de minas pedidas por el jugador
	move	$a1, $s5					# Ponemos un contador para que la semilla cambie
	jal 	genera_tablero_minas		# si en ese nuevo tablero se encuentra una mina
		
	lw 	$a1, 4($sp)						# Desapilamos	
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8
	
	move 	$a0, $a1					# Valor de la fila
	move 	$a1, $a2					# Valor de la columna		
	jal  	destape						# Destapamos la casilla

no_mina:
	addi	$sp, $sp, -12				# Apilamos
	sw	$t0, 8($sp)						# Guardamos el temporal $t1 que contiene el valor de la casilla para que 
	sw	$a1, 4($sp)						# no se pierda en la llamada a la rutina cambia_casilla
	sw    $a0, 0($sp)
										# Copiamos el valor en el tablero jugadas
	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_jugadas			# Dirección del tablero de jugadas
	move	$a3, $t0					# Vamos a copiar en el tablero jugadas el valor del tablero minas
	jal 	cambia_casilla

	lw	$t0, 8($sp)						# Desapilamos
	lw	$a1, 4($sp)					
	lw	$a0, 0($sp)						
	addi	$sp, $sp, 12
										# casillas a destapar - 1
	lb	$s0, casillas_a_destapar($0)	# Actualizamos el nº de casillas que quedan por destapar
	addi	$s0, $s0, -1				# Restamos en 1 el numero de casillas contenidas en $s0
	sb	$s0, casillas_a_destapar($0)	# Guardamos  el numero de casillas de nuevo

	bne	$t0, 0, segun_valor				# Comparamos el valor con 0, si NO es cero saltamos porque es un nº 1-8
	jal 	destapa_cero				# Destapamos las casillas adyacentes por ser cero	

segun_valor:
	lb	$s0, casillas_a_destapar($0)	# Actualizamos el nº de casillas que quedan por destapar						# Vamos a comprobar el nº de casillas que quedan por destapar
	li	$v0, 1							# Valor a devolver = 1 en el caso de que no quede ninguna casillas por destapar
	beq	$s0, 0, fin_destapa				# Salta si es igual a 0
	li	$v0, 2							# Si no ha saltado es porque quedan casillas sin destapar,
										# por lo tanto devolvemos 2
fin_destapa:							# Desapilamos
	lw 	$ra, 0($sp)
	lw	$s0, 4($sp)
	lw	$s1, 8($sp)							
	addi	$sp, $sp, 12

	jr	$ra
#################################################################################################
# Destapa_cero (DECIMO PROCEDIMIENTO)															#	
# Descripción: Esta rutina realiza el destape de las casillas adyacentes						#
#	 		a una casilla con valor 0															#
# Parámetros:																					#
#	$a0 = Fila de la casilla a destapar															#		
#	$a1 = Columna de la casilla a destapar														#
#################################################################################################

destapa_cero:									
	addi	$sp, $sp, -12				# Apilamos
	sw	$ra, 8($sp)
	sw	$s0, 4($sp)
	sw	$s1, 0($sp)

	li	$s1, 8							# Para ver si se pasan las columnas o las filas
	la	$s0, cod_cubierta				# Cargamos en $s0 el valor de cod_cubierta para ver despues
	lb	$s0, 0($s0)						# si la casilla en cuestion esta destapada o no	

################################## CASILLA SUPERIOR IZQUIERDA ###################################
#################################################################################################

superior_izquierda:
	addi	$t0, $a0, -1				# Restamos 1 a la fila			
	addi	$t1, $a1, -1				# Restamos 1 a la columna

	blez	$t0, superior				# Si la fila es menor o igual que cero saltamos al siguiente
	blez	$t1, superior				# Si la columna es menor o igual que cero saltamos al siguiente

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila - 1			
	move	$a2, $t1					# $a2 = Columna - 1
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

	bne	$v0, $s0, superior				# Si la casilla ya esta destapada saltamos a la siguiente

recur_sup_izq:							# Recursivo superior izquierda
	addi	$sp, $sp, -8				# Apilamos los parámetros
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla superior izquierda
	addi	$a0, $a0, -1				# $a0 = Fila - 1
	addi 	$a1, $a1, -1				# $a1 = Columna - 1

	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8
		
###################################### CASILLA SUPERIOR #########################################
#################################################################################################

superior:
	addi	$t0, $a0, -1				# Restamos 1 a la fila
	move	$t1, $a1					# Columna igual

	blez	$t0, superior_derecha		# Si la fila es menor o igual que cero saltamos al siguiente

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila - 1			
	move	$a2, $t1					# $a2 = Columna
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

	bne	$v0, $s0, superior_derecha		# Si la casilla ya esta destapada saltamos a la siguiente.

recur_sup:								# Recursivo superior
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla superior
	addi	$a0, $a0, -1				# $a0 = Fila - 1

	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

################################### CASILLA SUPERIOR DERECHA ####################################
#################################################################################################

superior_derecha:
	addi	$t0, $a0, -1				# Restamos 1 a la fila
	addi	$t1, $a1, 1					# Sumamos 1 a la columna

    blez	$t0, derecha				# Si la fila es menor o igual que cero saltamos al siguiente	
	bgt	$t1, $s1, derecha				# Si la columna es más grande que ocho saltamos al siguiente

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila - 1			
	move	$a2, $t1					# $a2 = Columna + 1
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8
	
	bne	$v0, $s0, derecha				# Si la casilla ya esta destapada saltamos a la siguiente
	
recur_sup_der:							# Recursivo superior derecha
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla superior derecha
	addi	$a0, $a0, -1				# $a1 = Fila + 1
	addi 	$a1, $a1, 1					# $a1 = Columna + 1

	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)					
	addi	$sp, $sp, 8

####################################### CASILLA DERECHA #########################################
#################################################################################################

derecha:
	move	$t0, $a0					# Fila igual
	addi	$t1, $a1, 1					# Sumamos 1 a la columna

	bgt	$t1, $s1, inferior_derecha		# Si la columna es más grande que ocho saltamos al siguiente
	
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila			
	move	$a2, $t1					# $a2 = Columna + 1
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8
	
	bne	$v0, $s0, inferior_derecha		# Si la casilla ya esta destapada saltamos a la siguiente

recur_der:								# Recursivo derecha
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla derecha
	addi	$a1, $a1, 1					# $a1 = Columna + 1
	
	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

################################## CASILLA INFERIOR DERECHA #####################################
#################################################################################################

inferior_derecha:
	addi	$t0, $a0, 1					# Sumamos 1 a la fila
	addi	$t1, $a1, 1					# Sumamos 1 a la columna

	bgt	$t0, $s1, inferior				# Si la fila es mayor que ocho saltamos al siguiente
	bgt	$t1, $s1, inferior				# Si la columna es mayor que ocho saltamos al siguiente

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila + 1			
	move	$a2, $t1					# $a2 = Columna + 1
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

	bne	$v0, $s0, inferior				# Si la casilla ya esta destapada saltamos a la siguiente

recur_inf_der:							# Recursivo inferior derecha
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla inferior derecha
	addi	$a0, $a0, 1					# $a0 = Fila + 1
	addi	$a1, $a1, 1					# $a1 = Columna + 1

	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8
	
###################################### CASILLA INFERIOR #########################################
#################################################################################################

inferior:
	addi	$t0, $a0, 1					# Sumamos 1 a la fila
	move	$t1, $a1					# Columna igual

	bgt	$t0, $s1, inferior_izquierda	# Si la fila es mayor que ocho saltamos al siguiente

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila - 1			
	move	$a2, $t1					# $a2 = Columna
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8
	
	bne	$v0, $s0, inferior_izquierda	# Si la casilla ya esta destapada saltamos a la siguiente
	
recur_inf:								# Recursivo inferior
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla inferior
	addi	$a0, $a0, 1					# $a0 = Fila + 1

	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

################################## CASILLA INFERIOR IZQUIERDA ###################################
#################################################################################################

inferior_izquierda:
	addi	$t0, $a0, 1					# Sumamos 1 a la fila
	addi	$t1, $a1, -1				# Restamos 1 a la columna

	bgt	$t0, $s1, izquierda				# Si la fila es mayor que ocho saltamos al siguiente
	blez	$t1, izquierda				# Si la columna es menor o igual a cero saltamos a la siguiente

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla		
	move	$a1, $t0					# $a1 = Fila + 1			
	move	$a2, $t1					# $a2 = Columna - 1
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla inicial a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

	bne	$v0, $s0, izquierda				# Si la casilla ya esta destapada saltamos a la siguiente
	
recur_inf_izq:							# Recursivo inferior izquierda
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla inferior izquierda
	addi	$a0, $a0, 1					# $a0 = Columna + 1
	addi	$a1, $a1, -1				# $a1 = Columna - 1

	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

###################################### CASILLA IZQUIERDA ########################################
#################################################################################################

izquierda:
	move	$t0, $a0					# Fila igual
	addi	$t1, $a1, -1				# Restamos 1 a la columna

	blez	$t1, fin_destapa_cero		# Si la columna es menor o igual a cero saltamos al final

	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Comprobamos el valor de la casilla	
	move	$a1, $t0					# $a1 = Fila			
	move	$a2, $t1					# $a2 = Columna - 1
	la 	$a0, tablero_jugadas			
	jal 	obten_casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8
	
	bne	$v0, $s0, fin_destapa_cero		# Si la casilla ya esta destapada saltamos a la siguiente

recur_izq:								# Recursivo izquierda
	addi	$sp, $sp, -8				# Apilamos la posicion de la casilla inicial a destapar
	sw	$a0, 4($sp)					
	sw    $a1, 0($sp)
										# Obtenemos la posicion de la casilla izquierda
	addi	$a1, $a1, -1				# $a1 = Columna - 1
	
	jal 	destapa_casilla				# Destapamos la nueva casilla

	lw	$a0, 4($sp)						# Desapilamos la posicion de la casilla a destapar
	lw	$a1, 0($sp)				
	addi	$sp, $sp, 8

fin_destapa_cero:						# Desapilamos
	lw	$s1, 0($sp)
	lw	$s0, 4($sp)
	lw	$ra, 8($sp)
	addi	$sp, $sp, 12
	jr	$ra


#################################################################################################
####################################### INSERTA BANDERA #########################################
#################################################################################################
# Descripción: Inserta en la casilla seleccionada el caracter '?' correspondiente a una bandera	#
#		   	cuando el jugador duda de una posible mina en el tablero de jugadas. 				#
# Parámetros:													 							 	#
# 	$a0 = Fila												  									#
#	$a1 = Columna									   			  								#
#################################################################################################

inserta_bandera:
	addi 	$sp,$sp,-4					# Apilamos
	sw 	$ra,0($sp)

	addi	$sp, $sp, -8				# Apilamos
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)

	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_jugadas			# Dirección del tablero de jugadas	
	jal 	obten_casilla				# Salta a la rutina indicada

	lw 	$a1, 4($sp)						# Desapilamos
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8

	lb	$t0, cod_cubierta($0)			# Comprobamos que la casilla seleccionada
	bne	$v0, $t0, cas_destapada			# no esta destapada

	lb	$t0, cod_antiminas($0)			# Comprobamos que la casilla seleccionada
	beq	$v0, $t0, cas_destapada			# no esta destruida

	addi	$sp, $sp, -8				# Apilamos
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)

	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_jugadas			# Dirección del tablero de jugadas
	lb	$a3, cod_bandera($0)			# $a3 = Codigo de bandera
	jal 	cambia_casilla				# Salta a la rutina indicada

	lw 	$a1, 4($sp)						# Desapilamos	
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8

	j 	fin_insertarbandera				# Salta a la rutina indicada

cas_destapada:
	la	$a0, mens_insertar				# Informamos de que la casilla esta destruida,
	li	$v0, 4							# contiene una bandera o esta destapada
	syscall

fin_insertarbandera:
	lw 	$ra,0($sp)						# Desapilamos
	addi 	$sp,$sp,4
	jr 	$ra

#################################################################################################
####################################### DESTRUIR CASILLA ########################################
#################################################################################################
# Descripción: Destruccion de la casilla seleccionada, decrementando el valor	de las casillas #
#		    	adyacentes a ella si se encuentra en esta casilla una mina. Se inserta			#
#			el simbolo de casilla destruida y si esa casilla no es mina se actua				#
#			como si se tratase de una casilla normal utilizando destapa_casilla					#
# Parámetros:																				 	#
# 	$a0 = Fila												  									#
#	$a1 = Columna									   			  								#
#################################################################################################

destruir_casilla:
	addi 	$sp,$sp,-4					# Apilamos
	sw 	$ra,0($sp)

	addi	$sp, $sp, -8				# Apilamos
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)

	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_jugadas			# Dirección del tablero de jugadas	
	jal 	obten_casilla				# Salta a la rutina indicada

	lw 	$a1, 4($sp)						# Desapilamos las coordenadas	
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8

	lb	$t0, cod_cubierta($0)			# Comprobamos que la casilla seleccionada
	bne	$v0, $t0, cas_destapada			# no esta destapada

	lb	$t0, cod_bandera($0)			# Comprobamos que la casilla seleccionada
	beq $v0, $t0, casilla_destband		# no tiene una bandera puesta

	addi	$sp, $sp, -8				# Apilamos
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)
										# Vemos si la casilla contiene una mina
	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_minas				# Dirección del tablero de minas
	jal 	obten_casilla				# Salta a la rutina indicada

	lw 	$a1, 4($sp)						# Desapilamos las coordenadas	
	lw 	$a0, 0($sp)					 
	addi	$sp, $sp, 8

	lb	$t0, cod_mina($0)			
	bne	$v0, $t0, actua_destapa_casilla	# Saltamos si no es igual a $t0
 
insertar_blanco:
	addi 	$s5, $s5, 1					# Incrementamos el uso del antiminas en 1

	addi	$sp, $sp, -8				# Apilamos las coordenadas
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)

	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_jugadas			# Dirección del tablero de jugadas
	lb	$a3, cod_antiminas($0)			# $a3 = Codigo de antiminas
	jal 	cambia_casilla			
	
	lw 	$a1, 4($sp)						# Desapilamos las coordenadas		
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8

	addi	$sp, $sp, -8				# Apilamos las coordenadas
	sw	$a1, 4($sp)					
	sw    $a0, 0($sp)

	move 	$a2, $a1					# $a1 => $a2 = nº Columna
	move 	$a1, $a0					# $a0 => $a1 = nº Fila
	la 	$a0, tablero_minas				# Dirección del tablero de minas
	lb	$a3, cod_antiminas($0)			# $a3 = Codigo de antiminas
	jal 	cambia_casilla				# Saltamos a la rutina indicada

	lw 	$a1, 4($sp)						# Desapilamos las coordenadas		
	lw 	$a0, 0($sp)		
	addi	$sp, $sp, 8
	
	jal		comprueba_adyacentes		# Saltamos a la rutina indicada
	jal 	fin_destruir_casilla		# Saltamos a la rutina indicada

actua_destapa_casilla:
	jal 	destapa_casilla				# Saltamos a la rutina indicada
	addi 	$s5, $s5, 1					# Incrementamos el uso del antiminas en 1
	jal	opciones_de_casilla				# Comprobamos si hemos ganado o quedan mas casillas

casilla_destband:						# Informamos de que la casilla esta destruida,
	la	$a0, mens_insertar				# contiene una bandera o ya esta destapada	
	li	$v0, 4					
	syscall

fin_destruir_casilla:
	lw 	$ra, 0($sp)						# Desapilamos $ra
	addi 	$sp, $sp, 4			
	jr 	$ra								# Terminamos la rutina y volvemos

	
#################################################################################################
###################################### COMPRUEBA ADYACENTES #####################################
#################################################################################################
# Comprueba Adyacentes (Rutina auxiliar de Destruir_casilla)									#
# Descripción: Comprueba que existen las casillas adyacentes a la casilla seleccionada y no 	#
#				actualiza casillas con mina o casillas ya destruidas.							#
# Parámetros:													  								#
# 	$a0 = Fila												  									#
#	$a1 = Columna									   			  								#
#################################################################################################

comprueba_adyacentes:
	addi $sp,$sp,-16					# Apilamos
	sw 	$ra, 12($sp)
	sw	$s0, 8($sp)
	
	li	$s0, 8							# Para ver si se pasan las columnas o las filas
	
	move 	$a2, $a1					# Columna				
	move 	$a1, $a0					# Fila

################################## CASILLA SUPERIOR IZQUIERDA ###################################
#################################################################################################
	
decr_superior_izquierda:
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)
	
	addi	$a1, $a1, -1				# Restamos 1 a la fila
	addi	$a2, $a2, -1	 			# Restamos 1 a la columna
	blez	$a1, decr_superior			# Si la fila es menor o igual que cero saltamos al siguiente.
	blez	$a2, decr_superior			# Si la columna es menor o igual que cero saltamos al siguiente.

	la	$a0, tablero_minas				# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0, $t1, decr_superior			# Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0, $t1, decr_superior			# Saltamos si es igual a $t1
	jal decrementa						# Saltamos a la rutina indicada
		
###################################### CASILLA SUPERIOR #########################################
#################################################################################################

decr_superior:
	lw	$a2, 0($sp)						# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)						# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi $a1, $a1, -1					# Restamos 1 a la fila
	blez $a1, decr_superior_derecha		# Si la fila es menor o igual que cero saltamos al siguiente.

	la	$a0, tablero_minas				# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla					# Saltamos a la rutina indicada
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0, $t1, decr_superior_derecha	# Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0, $t1, decr_superior_derecha	# Saltamos si es igual a $t1
	jal decrementa

################################### CASILLA SUPERIOR DERECHA ####################################
#################################################################################################

decr_superior_derecha:
	lw	$a2, 0($sp)						# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)						# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi	$a1, $a1, -1				# Restamos 1 a la fila.
	addi	$a2, $a2, 1					# Sumamos 1 a la columna.
    blez	$a1, decr_derecha			# Si la fila es menor o igual que cero saltamos al siguiente.	
	bgt	$a2, $s0, decr_derecha			# Si la columna es más grande que ocho saltamos al siguiente.

 	la	$a0, tablero_minas				# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0, $t1, decr_derecha			# Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0, $t1, decr_derecha			# Saltamos si es igual a $t1
	jal decrementa						# Saltamos a la rutina indicada

####################################### CASILLA DERECHA #########################################
#################################################################################################

decr_derecha:
	lw	$a2, 0($sp)						# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)						# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi	$a2, $a2, 1					# Sumamos uno a la columna
	bgt	$a2, $s0, decr_inferior_derecha	# Si la columna es más grande que ocho saltamos al siguiente.
	
	la	$a0, tablero_minas				# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla					# Saltamos a la rutina inidicada
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0, $t1, decr_inferior_derecha	# Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0, $t1, decr_inferior_derecha	# Saltamos si es igual a $t1
	jal decrementa						# Saltamos a la rutina indicada

################################## CASILLA INFERIOR DERECHA #####################################
#################################################################################################

decr_inferior_derecha:
	lw	$a2, 0($sp)						# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)						# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi	$a1, $a1, 1					# Sumamos uno a la fila
	addi	$a2, $a2, 1					# Sumamos uno a la fila
	bgt	$a1, $s0, decr_inferior			# Si la fila es mayor que ocho saltamos al siguiente.
	bgt	$a2, $s0, decr_inferior			# Si la columna es mayor que ocho saltamos al siguiente.

	la	$a0, tablero_minas				# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla					# Saltamos a la rutina inidicada
	move 	$t0, $v0
	
	lb	$t1, cod_mina($0)
	beq 	$t0, $t1, decr_inferior		# Saltamos si es igual a $t1	
	lb	$t1, cod_antiminas($0)
	beq 	$t0, $t1, decr_inferior		# Saltamos si es igual a $t1
	jal 	decrementa					# Saltamos a la rutina indicada
	
###################################### CASILLA INFERIOR #########################################
#################################################################################################

decr_inferior:
	lw	$a2, 0($sp)						# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)						# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi	$a1, $a1, 1					# Sumamos uno a la fila
	bgt	$a1,$s0,decr_inferior_izquierda	# Si la fila es mayor que ocho saltamos al siguiente.

	la	$a0, tablero_minas				# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla					# Saltamos a la rutina indicada
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0,$t1,decr_inferior_izquierda # Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0,$t1,decr_inferior_izquierda # Saltamos si es igual a $t1
	jal decrementa						# Saltamos a la rutina indicada

################################## CASILLA INFERIOR IZQUIERDA ###################################
#################################################################################################

decr_inferior_izquierda:
	lw	$a2, 0($sp)					# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)					# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi	$a1, $a1, 1				# Sumamos uno a la fila
	addi	$a2, $a2, -1			# Restamos uno a la columna
	bgt	$a1, $s0, decr_izquierda	# Si la fila es mayor que ocho saltamos al siguiente.
	blez	$a2, decr_izquierda		# Si la columna es menor o igual a cero saltamos a la siguiente.

	la	$a0, tablero_minas			# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla				# Saltamos a la rutina indicada
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0, $t1, decr_izquierda	# Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0, $t1, decr_izquierda	# Saltamos si es igual a $t1
	jal decrementa					# Saltamos a la rutina indicada

###################################### CASILLA IZQUIERDA ########################################
#################################################################################################

decr_izquierda:
	lw	$a2, 0($sp)					# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)					# antes de lo esperado
	
	sw	$a1, 4($sp)
	sw	$a2, 0($sp)

	addi	$a2, $a2, -1			# Restamos uno a la columna
	blez	$a2, fin_decrementa		# Si la columna es menor o igual a cero saltamos al final.

	la	$a0, tablero_minas			# Cargamos en $a0 el tablero de jugadas para llamar a obten_casilla.
	jal	obten_casilla				# Saltamos a la rutina indicada
	move $t0, $v0
	
	lb	$t1, cod_mina($0)
	beq $t0, $t1, fin_decrementa	# Saltamos si es igual a $t1
	lb	$t1, cod_antiminas($0)
	beq $t0, $t1, fin_decrementa	# Saltamos si es igual a $t1
	jal decrementa					# Saltamos a la rutina indicada
	
fin_decrementa:
	lw	$a2, 0($sp)					# Recobramos los valores aqui por si el salto se hace
	lw	$a1, 4($sp)					# antes de lo esperado		
	lw	$s0, 8($sp)
	lw	$ra, 12($sp)
	addi	$sp, $sp, 16
	j	$ra							# Terminamos la rutina y volvemos

#################################################################################################
########################################### DECREMENTA ##########################################
#################################################################################################
# Decrementa (Rutina auxiliar de Comprueba Adyacentes)											#
# Descripción: Disminuye en una unidad el valor de la casilla dada.								#
# Parámetros:													  								#
# 	$t0 = Valor de la casilla												  					#
#################################################################################################

decrementa:
	addi 	$sp,$sp,-4				# Apilamos
	sw 	$ra,0($sp)
	
	sub $t1, $t0, 1
	
	move	$a3, $t1				# Ahora ponemos el valor de la casilla en $a3 para cambia casilla.
	la	$a0, tablero_minas			# Cargamos tab_jugadas en $a0 para cambia_casilla
	jal	cambia_casilla				# Copiamos la casilla de tm en tj.
	
	lw 	$ra, 0($sp)					# Desapilamos
	addi 	$sp, $sp, 4			
	jr 	$ra							# Terminamos la rutina y volvemos

#################################################################################################
##################################### RUTINA DE SEPTIEMBRE ######################################
#################################################################################################
########################################### POLLING #############################################
#################################################################################################

lee_numero:							
	addi	$sp, $sp, -24 			# Apilamos
	sw 	$ra, 0($sp)				
	sw 	$s0, 4($sp)
	sw 	$s1, 8($sp)
	sw 	$s2, 12($sp)
	sw 	$t0, 16($sp)
	sw 	$t1, 20($sp)
								
lectura_1: 							# Lectura de digito 1
	lb 		$s0,0xffff0000			# Carga registro Receptor de Control
	andi 	$s1,$s0,0x00000001		# ¿Hay algo?
	beqz 	$s1,lectura_1			# Si aún no, bucle de espera activa
	lb 		$s2,0xffff0004			# Lee carácter del Receptor de Datos
	
	li	$t0, 48						# Cargamos un "0"
	blt	$s2, $t0, lectura_1			# Si < 0 vuelva a permanecer en espera
	li	$t0, 57						# Cargamos un "9"
	bgt	$s2, $t0, lectura_1			#  Si > 9 vuelva a permanecer en espera
		
	sb		$s2,0xffff000c			# Imprimimos el caracter en pantalla
	
guarda_1: 
	lb 		$s0,0xffff0008			# Carga registro Transmisor de control
	andi 	$s1,$s0,0x00000001		# ¿Ha terminado de imprimirse?
	beqz 	$s1,guarda_1			# Mientras no, bucle de espera activa
	addi	$t2, $s2, -48			# Convertimos el carácter del primer dígito a hexadecimal 

									# Lectura de digito 2
lectura_2: 	
	lb 		$s0,0xffff0000			# Carga registro Receptor de Control
	andi 	$s1,$s0,0x00000001		# ¿Hay algo?
	beqz 	$s1,lectura_2			# Si aún no, bucle de espera activa
	lb 		$s2,0xffff0004			# Lee carácter del Receptor de Datos
	
	li	$t0, 57						# Cargamos un "9"
	bgt	$s2, $t0, lectura_2			# Si > 9 vuelva a permanecer en espera
	li	$t0, 48						# Cargamos un "0"
	bge	$s2, $t0, contador			# Si > ó = 0 guarda el caracter
	li	$t0, 10						# Cargamos un intro"
	bne	$s2, $t0, lectura_2			# Salta si no es igual 
	li	$t0, 0						# $t0=0 como señal de que hemos introducido un enter
	
contador:
	beq	$t0, $0, un_digito			# Si es un digito saltamos para imprimir un solo digito
	sb	$s2,0xffff000c				# Si son dos imprimimos el caracter en pantalla
	
guarda_2: 
	lb 		$s0,0xffff0008			# Carga registro Transmisor de control
	andi 	$s1,$s0,0x00000001		# ¿Ha terminado de imprimirse?
	beqz 	$s1,guarda_2			# Mientras no, bucle de espera activa
	addi	$s2, $s2, -48			# Convertimos el carácter del segundo dígito a hexadecimal

	li	$t0, 10						# Cargamos un "10" para hacer este valor decena
	mul	$t1, $t2, $t0	
	
	add	$v0, $t1, $s2				# Sumamos el segundo dígito (unidades) con las decenas
									# Guardamos en $v0
	j 	fin_lee_numero				# Saltamos a la rutina indicada

un_digito:
	move	$v0, $t2				# Devolvemos el primer dígito como unidad
	
fin_lee_numero:					
	lw 	$ra, 0($sp)					# Desapilamos
	lw 	$s0, 4($sp)
	lw 	$s1, 8($sp)
	lw 	$s2, 12($sp)
	lw 	$t0, 16($sp)
	lw 	$t1, 20 ($sp)
	addi 	$sp, $sp, 24

	jr 	$ra				
	
	
#################################################################################################
#################################################################################################
##### REALIZADO POR LOS ALUMNOS: JOSE ANTONIO CANO TRIGUEROS Y JAVIER GARCIA - VIDAL SIMON ######
######################## 1º I.T.I GESTIÓN GRUPO 1   ASIGNATURA: E.T.C. ##########################
############################ PROFESOR: MIGUEL ÁNGEL CALVO ZARAZAGA ##############################
#################################################################################################
#################################################################################################
#################################################################################################