# !/bin/bash
#-------------------------------------------------------------------------------
# Formatear datos
#-------------------------------------------------------------------------------
# Version:

linea_guiones ()
{
echo "-- --------------------------------------------------------------"  
}


run_data()
{	
#-------------------------------------------------------------------------------
# RUN_DATE Fecha y hora de la ejecucion del script
RUN_DATE="$(date  +\#\ %Y\/%m\/%d\ %H:%M)"
RUN_DATE_FILE="$(date  +%Y-%m-%d_%H%M)"    # Nuevo formato para usar en nombres de Archivo
#-------------------------------------------------------------------------------
# Nombre abreviado del script en ejecucion... para que los mensajes sean mas legibles.

VERS=${0##*_} 		# Elimina /abc/def/ghi/./Gen_list_files_cel_NO_copiar_  Queda "V0.5.sh"
VERS=${VERS%.*} 	# Elimina ".sh"  Queda "V0.5"

COM=${0%_*}    				#; echo $COM   # ELimina "_V0.5.sh"
COM=${COM##*/} 				#; echo $COM   # Elimina "/abc/def/ghi/./"
COMANDO_COMPLETO=${COM}   	# Para determinar que secciones ejecutar en Verifica.. y Genera
COM=${COM:0:4} 				#; echo $COM   # Solo los primeros 4 caracteres

NOM_ABREV=${COM}'..'${VERS}
return
}
#-------------------------------------------------------------------------------

genera_banner ()
{	
# Aca viene el banner y la lista de variables a incluir
DIR_REF=${PWD}

FLAG_TERM="FALSE"           # Si algun parametro no esta definido terminar temprano

if [ ! -f  "${CSV_IN_FILE}" ]
then
	echo "El Archivo ${CSV_IN_FILE} NO existe"
	exit
fi

if [  -d "${SQL_OUT_FILE}" ]
then
  echo "${NOM_ABREV}: No se puede generar: ${SQL_OUT_FILE} Es un directorio"
  exit
fi


  linea_guiones 										>${SQL_OUT_FILE}
  echo "-- Nombre    :  ${SQL_OUT_FILE}"				>>${SQL_OUT_FILE}
  echo "-- Creado por: $0     Run_date  : ${RUN_DATE}"	>>${SQL_OUT_FILE}
  printf "%s\n" "--"									>>${SQL_OUT_FILE}
  echo "-- Directorio Origen:  ${PWD}" 					>>${SQL_OUT_FILE}
  echo "-- CSV_IN_FILE :				${CSV_IN_FILE}"	>>${SQL_OUT_FILE}
  linea_guiones 										>>${SQL_OUT_FILE}
# echo "-- Variables incluidas:"			  	        >>${SQL_OUT_FILE}	

#------------------------------------------------------------------------------

if [  -d "${ERROR_LOG}" ]
then
  echo "${NOM_ABREV}: No se puede generar: ${ERROR_LOG} Es un directorio"
  exit
fi


  linea_guiones 										>${ERROR_LOG}
  echo "-- Nombre    :  ${ERROR_LOG}"					>>${ERROR_LOG}
  echo "-- Creado por: $0     Run_date  : ${RUN_DATE}"	>>${ERROR_LOG}
  printf "%s\n" "--"									>>${ERROR_LOG}
  echo "-- Directorio Origen:  ${PWD}" 					>>${ERROR_LOG}
  echo "-- CSV_IN_FILE :				${CSV_IN_FILE}"	>>${ERROR_LOG}
  linea_guiones 										>>${ERROR_LOG}

  
  
  
return	
}

validate_line()
{
	
if [ ${#VAL_COL[@]}  -ne ${NUM_COLS}     ]
then
	LINE_IS_VALID="FALSE"
	if [ ${#VAL_COL[@]} -le ${NUM_COLS}    ]
	then
		echo "Hay un c/r en la linea" "${VAL_COL[0]}" "${VAL_COL[1]}"
#		echo "Error   -->" ${VAL_COL[@]}
	else
		if [ ${#VAL_COL[@]} -gt ${NUM_COLS}  ]  # Este if se podria omitir...
		then
			echo "Hay DEMASIADAS comas en la linea" "${VAL_COL[0]}" "${VAL_COL[1]}"
#			echo "Error   -->" ${VAL_COL[@]}
		fi
	fi
else
    NUM_COL=0  						# Indice para recorrer las columnas
									# Eliminando caracteres espureos
	while [ ${NUM_COL} -le ${NUM_COLS} ]
	do
	  VAL_COL[${NUM_COL}]=${VAL_COL[${NUM_COL}]//\'/ }
	  let NUM_COL++
	done
    
	LINE_IS_VALID="TRUE"
fi	
return
	}

#------------------------------------------------------------------------------
procesar_dni_cuil()
#------------------------------------------------------------------------------
{
HAY_DNI="FALSE"

if [ ${#VAL_COL[21]} = 0 ]  # No hay cargado DNI ni CUIL
then
	HAY_DNI="FALSE" ; 	DNI="${DNI_NO_DISPONIBLE}"
	HAY_CUIL="FALSE" ; 	CUIL="${CUIL_NO_DISPONIBLE}"
	return
fi
#  printf "%s\n" 	${VAL_COL[21]^^}

/bin/grep -q -e "^ *DNI" <<< ${VAL_COL[21]^^}	# EL patron DNI (may o min) 
												# al comienzo de la linea
												# precedido de blancos o no
if [ $? = 0 ]
then
#	echo "Remover "DNI " y tomar los digitos"
	HAY_DNI="TRUE"
	DNI="${VAL_COL[21]^^}"
#	DNI=${DNI#DNI }
    DNI=$(/bin/sed -r 's/^ *DNI *//' <<< "${DNI}")	# DNI al comienzo precedido y seguido
												# de blancos
    DNI=$(/bin/sed -r 's/ *DNI *.*$//' <<< "${DNI}") # DNI repetido... al final de la linea
												# Caso excepcional...
	VAL_COL[30]="${DNI//./}" 					# ESta es la columna DNI
	HAY_CUIL="FALSE" ; 	CUIL="${CUIL_NO_DISPONIBLE}" ; VAL_COL[21]=${CUIL}
	return
fi

/bin/grep -q -e "${PATRON_CUIL}" <<< ${VAL_COL[21]^^}  # Hay un CUIL y de el tomaremos el DNI
if [ $? = 0 ]
then
#	echo "Obtener DNI y guardar CUIL"
	HAY_DNI="TRUE"
	HAY_CUIL="TRUE"
#	DNI=$( cut -d\- -f2 <<<${VAL_COL[21]} )
	VAL_COL[30]=$( cut -d\- -f2 <<<${VAL_COL[21]} )   # ESta es la columna DNI
#	CUIL=$( sed -r 's/.*([0-9]{2}-)([0-9]{8}-)([0-9]{1}) .*/\1\2\3/' <<<${VAL_COL[21]} ) 
	VAL_COL[21]=$( sed -r 's/.*([0-9]{2}-)([0-9]{8}-)([0-9]{1}) .*/\1\2\3/' <<<${VAL_COL[21]} ) # Este es el CUIL
	return
else
	HAY_DNI="FALSE" ; 	DNI="${DNI_NO_DISPONIBLE}"
	HAY_CUIL="FALSE" ; 	CUIL="${CUIL_NO_DISPONIBLE}"
fi
	

}
#------------------------------------------------------------------------------
generar_t_especialidad ()
#------------------------------------------------------------------------------
{
if [ ${#VAL_COL[9]} = 0 ]
then
	HAY_ESPEC=FALSE
	return
fi

IFS_ANT=${IFS}

VAL_COL[9]=${VAL_COL[9]//\#/}	 #  Eliminamos el caracter "#"

IFS=';'  read -r -a ESPECIALIDADES <<< ${VAL_COL[9]}

let TOT_ESPEC=${#ESPECIALIDADES[@]}-1

let i=0

while [ $i -le ${TOT_ESPEC} ]
do
#    VAL_COL[100]=${ESPECIALIDADES[$i]}
#	generar_insert ${TABLE_NAME_3}  >>${SQL_OUT_FILE}		#---->>
    printf "%s\n"  ${ESPECIALIDADES[$i]} >>${ESPECIALIDADES_FILE}
	let i++
done

IFS=${IFS_ANT}
	
}

#------------------------------------------------------------------------------
procesar_telefono()
#------------------------------------------------------------------------------
{
if [ ${#VAL_COL[17]} = 0 ]
then
	HAY_TELEFONO=FALSE
	return
fi



VAL_COL[20]=$( cut -d\; -f2 <<<${VAL_COL[17]} )  # Valor Telefono 2

VAL_COL[17]=$( cut -d\; -f1 <<<${VAL_COL[17]} )  # Valor Telefono 1

return

# IFS_ANT=${IFS}

# VAL_COL[9]=${VAL_COL[9]//\#/}	 #  Eliminamos el caracter "#"

#IFS=';'  read -r -a TELEFONOS <<< ${VAL_COL[17]}

#let TOT_TELS=${#TELEFONOS[@]}-1

#let i=0

#while [ $i -le ${TOT_TELS} ]
#do
##	printf "%s %s %s\n" "SQL Insertar=" ${DNI} ${ESPECIALIDADES[$i]}
    #VAL_COL[100]=${ESPECIALIDADES[$i]}
	#generar_insert ${TABLE_NAME_3}
	#let i++
#done

#IFS=${IFS_ANT}	
	
}
#------------------------------------------------------------------------------
procesar_email()
#------------------------------------------------------------------------------
{
if [ ${#VAL_COL[22]} = 0 ]
then
	VAL_COL[22]="${EMAIL_NO_DISPONIBLE}"
	VAL_COL[32]="${EMAIL_NO_DISPONIBLE}"
	HAY_EMAIL=FALSE
	return
fi

# SI tiene un solo mail agregar ";" al final 
/bin/grep -q -e "; *$" <<< ${VAL_COL[22]}
if [ $? != 0 ]
then
	VAL_COL[22]+=";"
fi


VAL_COL[32]=$( cut -d\; -f2 <<<${VAL_COL[22]} )  # Valor email 2

VAL_COL[22]=$( cut -d\; -f1 <<<${VAL_COL[22]} )  # Valor email 1

for num_col in 22 32
do
	if [ ${#VAL_COL[${num_col}]} = 0 ]
	then
		VAL_COL[${num_col}]="${EMAIL_NO_DISPONIBLE}"
	fi
done

return
}

#------------------------------------------------------------------------------
generar_insert()
#------------------------------------------------------------------------------
{
# Imprimimos las lineas de sentencias SQL
	

TABLE_NAME=${1}  # Le pasamos como parametro el nombre de la tabla

CURR_IFS=$IFS
IFS=$OLDIFS


FORM_NOM_COL="("
FORM_VAL="("
LINEA_NOM=""

printf "%s %s \n" "Insert into"  ${TABLE_NAME}

COL=${LISTA_COLUMNAS[0]} 						# Cual es la primer columna
printf "(%s%s%s"  '`' "${NOMBRE_COL[${COL}]}" '`' 

PRIMERA_COL=TRUE

for INDEX in ${LISTA_COLUMNAS[@]}
do
	if [ ${PRIMERA_COL} = "TRUE" ]
	then
		PRIMERA_COL=FALSE             # salteamos la Primera col por el tema de las comas
		continue
	else
		printf  ",\`%s\`" "${NOMBRE_COL[${INDEX}]}"
	fi
done

printf ")\n" 


printf "%s\n" "Values"

printf "('%s'" "${VAL_COL[${COL}]}" 
PRIMERA_COL=TRUE

for INDEX in ${LISTA_COLUMNAS[@]}
do
	if [ ${PRIMERA_COL} = "TRUE" ]
	then
		PRIMERA_COL=FALSE
		continue
	else
		printf ",'%s'" "${VAL_COL[${INDEX}]}"
	fi
done

printf "%s\n" ")"

printf ";\n"

IFS=$CURR_IFS

return
}

#------------------------------------------------------------------------------
estandarizar_estado()
#------------------------------------------------------------------------------
{
# Se editan aca los contenidos de la columna estado para normalizarla

# Estado en					Estado en
# Planilla 					Tabla
#-----------------------------
# Asignado					ASIGNADO
# Disponible				DISPONIBLE
# No Disponible Temp.		NO_DISP_TEMP
# Interno					INTERNO	
# De Baja					DE_BAJA				(*) No sabemos si es correcto
# Con Restricciones			CON_RESTRICC		(*) No sabemos si es correcto
# Puntual					PUNTUAL				(*) No sabemos si es correcto
#

# Se editan aca los contenidos de la columna esta para estandarizarlos
# 

#let TOT_ESPEC=${#ESPECIALIDADES[@]}-1

#let i=0

#while [ $i -le ${TOT_ESPEC} ]



# SOlo estandarizar estado 

let cont=0
let TOT_ESTADOS=${#ESTADO_EN_PLANILLA[@]}-1

while [ ${cont} -le ${TOT_ESTADOS} ]
do
	if [ "${VAL_COL[2]}" = "${ESTADO_EN_PLANILLA[${cont}]}"   ]
	then
		VAL_COL[2]="${ESTADO_EN_TABLA[${cont}]}" 
		return
	fi
	let cont++
done


}

fake_main()
{
return
}

#------------------------------------------------------------------------------
# main
#------------------------------------------------------------------------------
declare -a NOMBRE_COL
declare -a NCM_Lineas 
declare -a VAL_COL
declare -a ESPECIALIDADES
declare -a TELEFONOS
declare -i TOT_ESPEC TOT_TELS i cont TOT_ESTADOS NUM_COL

declare -a LISTA_COLUMNAS
declare -a LISTA_COLUMNAS_1=(30 0 1 22 32)      # Apellido Nombre DNI email1 email2
declare -a LISTA_COLUMNAS_2=(30 21)				#DNI CUIL
declare -a LISTA_COLUMNAS_3=(30 100)			# DNI ESPECIALIDAD
declare -a LISTA_COLUMNAS_4=(30 2 34)			# DNI ESTADO f_act_estado
declare -a LISTA_COLUMNAS_5=(100)				# Especialidad

declare -a ESTADO_EN_PLANILLA ESTADO_EN_TABLA	# Equivalencia de un nombre a otro

run_data														#---->

DNI_NO_DISPONIBLE=""
CUIL_NO_DISPONIBLE="N/D"
EMAIL_NO_DISPONIBLE="N/D"

SQL_SCRIPT_NAME="ESPEC"
CSV_IN_FILE="../Datos/Libro2_V1.4.csv"

SQL_OUT_FILE=../SQL_Scripts/"${RUN_DATE_FILE}_${SQL_SCRIPT_NAME}"".sql"
ERROR_LOG=../Errores/"${RUN_DATE_FILE}_${SQL_SCRIPT_NAME}_ERR"".log"
ESPECIALIDADES_FILE=../SQL_Scripts/"${RUN_DATE_FILE}_${SQL_SCRIPT_NAME}"".txt"
ESPECIALIDADES_FILE_SRT=../SQL_Scripts/"${RUN_DATE_FILE}_${SQL_SCRIPT_NAME}"".srt"

 > ${ESPECIALIDADES_FILE}						# Desprolijo !!!! Choto !!!!

# Se podria usar un array asociativo y luego hacer
# TABLE_NAME[T_USERS1]="T_USERS1"
# Asi seria mas facil identificar a que tabla nos referimos sin tener que 
# regresar aca...

TABLE_NAME_1="t_users1"
TABLE_NAME_2="t_users2"
TABLE_NAME_3="t_especialidad_user"
TABLE_NAME_4="t_estado_user"
TABLE_NAME_5="t_especialidades"

NUM_COLS=26 # Number of expected columns to read from csv file

genera_banner													#---->

PATRON_CUIL="^ *[0-9]\{2\}\-[0-9]\{8\}\-[0-9]\{1\}"


# Estado en										Estado en
# Planilla 										Tabla
#---------------------------------------------------------------------------
ESTADO_EN_PLANILLA[0]="Asignado"			; ESTADO_EN_TABLA[0]="ASIGNADO"		
ESTADO_EN_PLANILLA[1]="Disponible"			; ESTADO_EN_TABLA[1]="DISPONIBLE"	
ESTADO_EN_PLANILLA[2]="No Disponible Temp."	; ESTADO_EN_TABLA[2]="NO_DISP_TEMP"
ESTADO_EN_PLANILLA[3]="Interno"				; ESTADO_EN_TABLA[3]="INTERNO"
ESTADO_EN_PLANILLA[4]="De Baja"				; ESTADO_EN_TABLA[4]="DE_BAJA"		#(*) No sabemos si es correcto
ESTADO_EN_PLANILLA[5]="Con Restricciones"	; ESTADO_EN_TABLA[5]="CON_RESTRICC"	#(*) No sabemos si es correcto
ESTADO_EN_PLANILLA[6]="Puntual"				; ESTADO_EN_TABLA[6]="PUNTUAL"		#(*) No sabemos si es correcto



# NOMBRE_COL	Nombre Col			   COL	Nombre Excel
#		[Indice]
NOMBRE_COL[0]="apellido"			#	A	Apellido
NOMBRE_COL[1]="nombres"				#	B	Nombre	
NOMBRE_COL[2]="estado"				#	C	Estado
NOMBRE_COL[3]="comentarios"			#	D	Comentarios
NOMBRE_COL[4]="f_ingreso"			#	E	Fecha de ingreso
NOMBRE_COL[5]="socio"				#	F	Socio
NOMBRE_COL[6]=""					#	G	Proyectos	 N/A
NOMBRE_COL[7]=""					#	H	Area de trabajo del proyecto
NOMBRE_COL[8]=""					#	I	Aptitud
NOMBRE_COL[9]="array_especialidad"	#	J	Especialidad (parsear y a otra tabla)
NOMBRE_COL[10]=""					#	K	Asertividad
NOMBRE_COL[11]=""					#	L	Sociabilidad
NOMBRE_COL[12]=""					#	M	Actitud
NOMBRE_COL[13]=""					#	N	Talleres
NOMBRE_COL[14]=""					#	O	Actividades
NOMBRE_COL[15]="acuerdo"			#	P	Acuerdo
NOMBRE_COL[16]=""					#	Q	Z
NOMBRE_COL[17]="tel_1"				#	R	Telefono 1
NOMBRE_COL[18]=""					#	S	Presentacion
NOMBRE_COL[19]="referido_por"		#	T	Referido por
NOMBRE_COL[20]="tel_2"				#	U	Telefono 2
NOMBRE_COL[21]="cuil"				#	V	CUIL	
NOMBRE_COL[22]="email_1"			#	W	E-mail
NOMBRE_COL[23]="entrevistado_por" 	# 	X	Entrevistado por
NOMBRE_COL[24]=""					#	Y	Item type
NOMBRE_COL[25]=""					#	Z	PATH

# Columnas que no estan en la planilla
NOMBRE_COL[30]="dni"
NOMBRE_COL[31]="profesion"
NOMBRE_COL[32]="email_2"
NOMBRE_COL[33]="rol"
NOMBRE_COL[34]="f_act_estado"

# Columnas auxiliares para recibir datos parseados
NOMBRE_COL[100]="especialidad"


# Por ahora cargamos una sola vez la fecha de actualizacion...

FECHA_ACTUALIZ="$(date  +\%Y-%m-%d\ %H:%M:%S)"  # Fecha de actualizacion 

# echo ${NOMBRE_COL[0]} ${NOMBRE_COL[1]} ${NOMBRE_COL[2]} ${NOMBRE_COL[3]}


OLDIFS=$IFS
IFS=,

while IFS=','  read -ra VAL_COL
do
	validate_line  >>${ERROR_LOG}
	
	if [ ${LINE_IS_VALID} = "FALSE" ]
	then
		continue
	fi
	
	procesar_dni_cuil								#---->
	
	VAL_COL[34]=${FECHA_ACTUALIZ}
	
	if [ ${HAY_DNI} = "TRUE" ]
	then
 
        # procesar_telefono							#---->

#        procesar_email								#---->
 # Tabla T_VOLS1       
        #unset LISTA_COLUMNAS
        #LISTA_COLUMNAS=("${LISTA_COLUMNAS_1[@]}")
        #generar_insert ${TABLE_NAME_1}	>>${SQL_OUT_FILE}			#---->
        
 # Tabla T_VOLS2       
        #unset LISTA_COLUMNAS
        #LISTA_COLUMNAS=("${LISTA_COLUMNAS_2[@]}")
        #generar_insert ${TABLE_NAME_2}	>>${SQL_OUT_FILE}			#---->
        
# Tabla T_ESPECIALIDAD_VOLS	
        unset LISTA_COLUMNAS
        LISTA_COLUMNAS=("${LISTA_COLUMNAS_3[@]}")
		generar_t_especialidad						#---->
				
## Tabla T_ESTADO_VOLS
		#estandarizar_estado							#---->
		#unset LISTA_COLUMNAS
        #LISTA_COLUMNAS=("${LISTA_COLUMNAS_4[@]}")
        #generar_insert ${TABLE_NAME_4}  	>>${SQL_OUT_FILE}		#---->
		
		# linea_guiones >>${SQL_OUT_FILE}											
	else
		printf "%s %s %s %s \n" "--"${VAL_COL[0]} ${VAL_COL[1]} "-->SIN_DNI"  	>>${ERROR_LOG}
		printf "%s\n" "-- " 													>>${ERROR_LOG}
	fi
	
	unset VAL_COL
	
done < ${CSV_IN_FILE}

IFS=$OLDIFS

/bin/grep -v -e "^$" < ${ESPECIALIDADES_FILE} | sort -u  >${ESPECIALIDADES_FILE_SRT}
	
unset LISTA_COLUMNAS
LISTA_COLUMNAS=("${LISTA_COLUMNAS_5[@]}")	

while read VAL_COL[100]
do
 
  generar_insert ${TABLE_NAME_5}  	>>${SQL_OUT_FILE}
#  printf "%s %s \n" "Insertar"  ${ESP}

done <${ESPECIALIDADES_FILE_SRT}
