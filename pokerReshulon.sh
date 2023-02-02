#!/bin/bash
clear
echo -e -n "\n"
echo -e -n "\n"


#explique +- com he pensat les coses:
#	quan comprobe una parella el contador dóna 2 dues vegades, aleshores la suma es 2+2+1+1+1
#	quan es un trio dóna 3 tres vegades, 3+3+3+1+1
#
#


#cree la array
baralla=( 1f0a1 1f0a2 1f0a3 1f0a4 1f0a5 1f0a6 1f0a7 1f0a8 1f0a9 1f0aa 1f0ab 1f0ad 1f0ae 1f0b1 1f0b2 1f0b3 1f0b4 1f0b5 1f0b6 1f0b7 1f0b8 1f0b9 1f0ba 1f0bb 1f0bd 1f0be 1f0c1 1f0c2 1f0c3 1f0c4 1f0c5 1f0c6 1f0c7 1f0c8 1f0c9 1f0ca 1f0cb 1f0cd 1f0ce 1f0d1 1f0d2 1f0d3 1f0d4 1f0d5 1f0d6 1f0d7 1f0d8 1f0d9 1f0da 1f0db 1f0dd 1f0de )
barallaDesordenada=($(echo ${baralla[@]} | tr " " "\n" | sort -R | tr "\n" " "111))

#funcions
function mostrarRivalOcult {
	echo "################################################"
	echo -e -n "\n"
	echo -e -n "\n"
	echo -e -n "                    "
	for i in {0..4}; do
	echo -e -n "\U1f0a0 ";
	done
}

function mostrarRivalNoOcult {
	echo "################################################"
	echo -e -n "\n"
	echo -e -n "\n"
	echo -e -n "                    "
	for i in {20..24}; do
echo -e -n "\U${barallaDesordenada[$i]} ";
done
}

function mostrarEspaisTaula {
	echo -e -n "\n"
	echo -e -n "\n"
	echo -e -n "\n"
	echo -e -n "\n"
	echo -e -n "\n"
	echo -e -n "\n"
}

function mostrarMa {

echo -e -n "                    "
for i in {0..4}; do
echo -e -n "\U${barallaDesordenada[$i]} ";
done
echo -e -n "\n"
echo -e -n "\n"
echo -e -n "\n"
echo "################################################"
echo -e -n "\n"
echo -e -n "\n"
}

function mostrarTaula {
	clear
	mostrarRivalOcult
	mostrarEspaisTaula
}

function sustituir {
	pi=`expr $1 - 1`;
	next=`expr $1 \* 10`;
	barallaDesordenada[$pi]=`echo ${barallaDesordenada[$next]}`;
	if [ $2>0 ]
	then pi=`expr $2 - 1`;
	next=`expr $2 \* 10`;
	barallaDesordenada[$pi]=`echo ${barallaDesordenada[$next]}`;
	fi
	if [ $3>0 ]
	then pi=`expr $3 - 1`;
	next=`expr $3 \* 10`;
	barallaDesordenada[$pi]=`echo ${barallaDesordenada[$next]}`;
	fi
	if [ $4>0 ]
	then pi=`expr $4 - 1`;
	next=`expr $4 \* 10`;
	barallaDesordenada[$pi]=`echo ${barallaDesordenada[$next]}`;
	fi
	if [ $4>0 ]
	then pi=`expr $4 - 1`;
	next=`expr $4 \* 10`;
	barallaDesordenada[$pi]=`echo ${barallaDesordenada[$next]}`;
	fi
}

function comprobarColor {
	contador1=1
	lletra1=$(echo $1 | cut -c 4-4)
	lletra2=$(echo $2 | cut -c 4-4)
	lletra3=$(echo $3 | cut -c 4-4)
	lletra4=$(echo $4 | cut -c 4-4)
	lletra5=$(echo $5 | cut -c 4-4)
	if [[ $lletra1 == $lletra2 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $lletra1 == $lletra3 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $lletra1 == $lletra4 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $lletra1 == $lletra5 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $contador1 -ge 4 ]] 
	then echo "1"
	else echo "0"
	fi	
}

function comprobarParella {
	contador1=1
	lletra1=$(echo $1 | cut -c 5-5)
	lletra2=$(echo $2 | cut -c 5-5)
	lletra3=$(echo $3 | cut -c 5-5)
	lletra4=$(echo $4 | cut -c 5-5)
	lletra5=$(echo $5 | cut -c 5-5)

	
	if [[ $lletra1 == $lletra2 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $lletra1 == $lletra3 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $lletra1 == $lletra4 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	if [[ $lletra1 == $lletra5 ]] 
	then contador1=`expr $contador1 + 1`;
	fi
	echo "$contador1"	
}
mostrarRivalOcult
mostrarEspaisTaula
mostrarMa

echo "Quines cartes vols descartar?"
read cartaDescartar cartaDescartar1 cartaDescartar2 cartaDescartar3 cartaDescartar4
if [[ "$cartaDescartar">0 && "$cartaDescartar"<6 ]]
then
sustituir "$cartaDescartar" "$cartaDescartar1" "$cartaDescartar2" "$cartaDescartar3" "$cartaDescartar4"
fi

clear
echo -e -n "\n"
echo -e -n "\n"
mostrarRivalOcult
mostrarEspaisTaula
mostrarMa
echo -e -n "\n"
echo "Pressiona Enter per continuar."
read donaIgual  #no el gaste

clear 
echo -e -n "\n"
echo -e -n "\n"
mostrarRivalNoOcult
mostrarEspaisTaula
mostrarMa


carta1=`echo ${barallaDesordenada[0]}`
carta2=`echo ${barallaDesordenada[1]}`
carta3=`echo ${barallaDesordenada[2]}`
carta4=`echo ${barallaDesordenada[3]}`
carta5=`echo ${barallaDesordenada[4]}`

carta21=`echo ${barallaDesordenada[20]}`
carta22=`echo ${barallaDesordenada[21]}`
carta23=`echo ${barallaDesordenada[22]}`
carta24=`echo ${barallaDesordenada[23]}`
carta25=`echo ${barallaDesordenada[24]}`

#comproba1color 
#del jugador
color=$(comprobarColor "$carta1" "$carta2" "$carta3" "$carta4" "$carta5")
#comproba2color
if [[ $color == '0' ]] 
then color=$(comprobarColor "$carta2" "$carta1" "$carta3" "$carta4" "$carta5")
fi
#comprobar parelles, trios, poker, full 
#del jugador
if [[ $color == '0' ]] 
then 
	parella1=$(comprobarParella "$carta1" "$carta2" "$carta3" "$carta4" "$carta5")
	parella2=$(comprobarParella "$carta2" "$carta1" "$carta3" "$carta4" "$carta5")
	parella3=$(comprobarParella "$carta3" "$carta2" "$carta1" "$carta4" "$carta5")
	parella4=$(comprobarParella "$carta4" "$carta2" "$carta3" "$carta1" "$carta5")
	parella5=$(comprobarParella "$carta5" "$carta2" "$carta3" "$carta4" "$carta1")
	suma=`expr $parella1 + $parella2 + $parella3 + $parella4 + $parella5`;
	if [[ $suma == '5' ]] 
	then elQueTens='No tens res'
	fi
	if [[ $suma == '7' ]] 
	then elQueTens='Tens una Parella'
	fi
	if [[ $suma == '9' ]] 
	then elQueTens='Tens Doble Parella'
	fi
	if [[ $suma == '11' ]] 
	then elQueTens='Tens un trio'
	fi
	if [[ $suma == '13' ]] 
	then elQueTens='Tens un Full'
	fi
	if [[ $suma == '17' ]] 
	then elQueTens='Tens un Poker'
	fi
else suma=20
elQueTens='Tens Color'
fi


#comproba1color 
#de IA
color=$(comprobarColor "$carta21" "$carta22" "$carta23" "$carta24" "$carta25")
#comproba2color
if [[ $color == '0' ]] 
then color=$(comprobarColor "$carta22" "$carta21" "$carta23" "$carta24" "$carta25")
fi
#comprobar parelles, trios, poker, full 
#de IA
if [[ $color == '0' ]] 
then 
	parella21=$(comprobarParella "$carta21" "$carta22" "$carta23" "$carta24" "$carta25")
	parella22=$(comprobarParella "$carta22" "$carta21" "$carta23" "$carta24" "$carta25")
	parella23=$(comprobarParella "$carta23" "$carta22" "$carta21" "$carta24" "$carta25")
	parella24=$(comprobarParella "$carta24" "$carta22" "$carta23" "$carta21" "$carta25")
	parella25=$(comprobarParella "$carta25" "$carta22" "$carta23" "$carta24" "$carta21")
	sumaIA=`expr $parella21 + $parella22 + $parella23 + $parella24 + $parella25`;
	if [[ $sumaIA == '5' ]] 
	then elQueTeLaIA='No té res'
	fi
	if [[ $sumaIA == '7' ]] 
	then elQueTeLaIA='Té una Parella'
	fi
	if [[ $sumaIA == '9' ]] 
	then elQueTeLaIA='Té Doble Parella'
	fi
	if [[ $sumaIA == '11' ]] 
	then elQueTeLaIA='Té un trio'
	fi
	if [[ $sumaIA == '13' ]] 
	then elQueTeLaIA='Té un Full'
	fi
	if [[ $sumaIA == '17' ]] 
	then elQueTeLaIA='Té un Poker'
	fi
else sumaIA=20
elQueTeLaIA='Té Color'
fi
echo "$elQueTens            $elQueTeLaIA" 

if [[ $suma -gt $sumaIA ]]
then echo "Has guanyat :-D"
fi
if [[ $suma -eq $sumaIA ]]
then echo "Empat :-/"
fi
if [[ "$suma" -lt "$sumaIA" ]]
then echo "Has perdut :-("
fi

echo -e -n "\n"
echo -e -n "\n"
echo "Pressiona Enter per continuar."
read donaIgual  #no el gaste
clear


echo -e -n "\n"
echo "################################################"
echo -e -n "\n"
echo -e -n "\n"
echo "        Vols jugar altra? Vols pique?"
echo "        Només si és si"
echo "           Si [S]"
echo "           No [N]"
echo -e -n "\n"
echo -e -n "\n"
echo "################################################"
read altra

if [[ $altra == "S" ]]
then 
./pokerReshulon.sh 
fi
if [[ $altra == "s" ]]
then 
./pokerReshulon.sh 
fi
if [[ $altra == 'N' ]]
then 
echo "No és no"
fi
if [[ $altra == 'n' ]]
then 
echo "No és no"
fi






