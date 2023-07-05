#users-->(NAME PASS)
#vehicles-->(ID BRAND MODEL LPNUMBER STATUS)
#rides-->(START END USER DRIVER PCOUNT PRICE)


choice1=("dodaj vozilo" "uredi vozilo" "izbrisi vozilo" "provjeri voznje" "exit")
choice2=("rezervisi voznju" "provjeri voznje" "exit")
YELLOW='\033[0;33m'
NC='\033[0m'
BOLD='\033[1m'


user=""
found=false

echo "$(clear)"

while [ -z "$user" ]
    do
    echo -e "\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"
    
    echo -ne "${YELLOW}${BOLD}Username : ${NC}"
    read -e NAME
    echo -ne "${YELLOW}${BOLD}Password : ${NC}"
    read -se PASS
    
    if [ "$NAME" == "admin" ]
        then
        if [ "$PASS" == "123" ]
            then
            user="admin"
            found=true
            echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"
            echo -e "\n${YELLOW}${BOLD}Dobrodošao, Administrator\n\n\n"
            else
            echo -e "$(clear)\n${YELLOW}${BOLD}Pogrešan password!${NC}"
            fi
        else
        while IFS=" " read -r FNAME FPASS
            do
            if [ "$NAME" = "$FNAME" ]
                then
                found=true
                if [ "$PASS" = "$FPASS" ]
                    then
                    user="korisnik"
                    echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"
                    echo -e "\n${YELLOW}${BOLD}Dobrodošao, $NAME\n\n\n"
                    break
                    else
                    echo -e "$(clear)\n${YELLOW}${BOLD}Pogrešan password!${NC}"
                    fi
                fi
            done < "users.txt"
        if [ "$found" == false ]
            then
            echo -e "$(clear)\n\n\n${YELLOW}${BOLD}Korisnik ne postoji!\nUnesite bilo šta da bi zatvorili program."
            read exitBuffer
            exit
            fi 
        fi
done
 

while true
do
    case $user in

        admin)
            
            echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"


            for (( i=0; i<${#choice1[@]}; i++))
            do
            echo -e "${YELLOW}$(($i+1))| ${BOLD}${choice1[$i]}\n${NC}"
            done

            read choice

            case $choice in
                1|"dodaj vozilo")


                echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"



                echo -e "<${YELLOW}${BOLD}Dodavanje vozila u Bazu${NC}>\n"


                echo -ne "${YELLOW}${BOLD}Id (NNN): ${NC}"
                read -e ID
                echo -ne "${YELLOW}${BOLD}Marka vozila (XX_XX): ${NC}"
                read -e BRAND
                echo -ne "${YELLOW}${BOLD}Model vozila (XX_XX): ${NC}"
                read -e MODEL
                echo -ne "${YELLOW}${BOLD}Registarska oznaka (TA-NNNNNN): ${NC}"
                read -e LPNUMBER
                echo -ne "${YELLOW}${BOLD}Trenutni status vozila (SLOBODNO/ZAUZETO/VAN_SLUZBE): ${NC}"
                read -e STATUS

                echo "${ID} ${BRAND} ${MODEL} ${LPNUMBER} ${STATUS}" >> vehicles.txt


                clear
                ;;
                2|"uredi vozilo")
                

                echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"



                echo -e "<${YELLOW}${BOLD}Uređivanje vozila${NC}>\n"

                echo -e "${YELLOW}${BOLD}Unesite ID vozila kojeg uređujete:${NC}"
                read -e tempID

                echo -e "\n\n"
                echo -ne "${YELLOW}${BOLD}Id (NNN): ${NC}"
                read -e ID
                echo -ne "${YELLOW}${BOLD}Marka vozila (XX_XX): ${NC}"
                read -e BRAND
                echo -ne "${YELLOW}${BOLD}Model vozila (XX_XX): ${NC}"
                read -e MODEL
                echo -ne "${YELLOW}${BOLD}Registarska oznaka (TA-NNNNNN): ${NC}"
                read -e LPNUMBER
                echo -ne "${YELLOW}${BOLD}Trenutni status vozila (SLOBODNO/ZAUZETO/VAN_SLUZBE): ${NC}"
                read -e STATUS


                echo -e "\n\n\n${YELLOW}${BOLD}Vozilo:\n"
                sed -n "/${tempID}/p" vehicles.txt

                echo -e "\nJeste li sigurni da želite izmjeniti vozilo?(Y/N)${NC}"
                read -e YN

                if [ "$YN" = "Y" ]
                then
                sed -i "/${tempID}/d" vehicles.txt
                echo "${ID} ${BRAND} ${MODEL} ${LPNUMBER} ${STATUS}" >> vehicles.txt
                fi

                clear
                ;;
                3|"izbrisi vozilo")


                echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"



                echo -e "<${YELLOW}${BOLD}Brisanje vozila${NC}>\n"

                echo -e "${YELLOW}${BOLD}Unesite ID vozila kojeg brišete:${NC}"
                read -e tempID


                echo -e "\n\n\n${YELLOW}${BOLD}Vozilo:\n"
                sed -n "/${tempID}/p" vehicles.txt

                echo -e "\nJeste li sigurni da želite izbrisati vozilo?(Y/N)${NC}"
                read -e YN

                if [ "$YN" = "Y" ]
                then
                sed -i "/${tempID}/d" vehicles.txt
                fi


                clear
                ;;
                4|"provjeri voznje")

                colored=true


                echo -e "$(clear)${YELLOW}${BOLD}-------------------------------------------------------------------------------------------------------$NC"

                while IFS=" " read -r START END NAME DRIVER PCOUNT PRICE
                do

                    if [ "$colored" == true ] || [ "$colored" == 0 ]
                        then
                            echo -e "${YELLOW}${BOLD}"
                        else
                            echo -e "$NC"
                    fi

                    printf "%-20s %-20s %-20s %-20s %s %s\n" "$START" "$END" "$NAME" "$DRIVER" "$PCOUNT" "$PRICE"

                    colored=$((!$colored))

                done < "rides.txt"

                echo -e "${YELLOW}${BOLD}-------------------------------------------------------------------------------------------------------$NC"

                echo -e "\n${YELLOW}${BOLD}Unesite bilo šta kada se želite vratiti na meni.${NC}\n"
                read exitBuffer



                clear
                ;;
                5|"exit")
                exit
                ;;
                *)
                echo "smol brain"
                ;;
            esac    

        ;;


        korisnik)

            echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"


            for (( i=0; i<${#choice2[@]}; i++))
            do
            echo -e "${YELLOW}$(($i+1))| ${BOLD}${choice2[$i]}\n${NC}"
            done


            read choice


            case $choice in
                1|"rezervisi voznju")

                echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"

                
                echo -e "<${YELLOW}${BOLD}Kreiranje rezervacije${NC}>\n"


                echo -ne "${YELLOW}${BOLD}Polazište (20 max): ${NC}"
                read -e START
                echo -ne "${YELLOW}${BOLD}Odredište (20 max): ${NC}"
                read -e END
                echo -ne "${YELLOW}${BOLD}Ime vozača (20 max): ${NC}"
                read -e DRIVER
                echo -ne "${YELLOW}${BOLD}Broj putnika : ${NC}"
                read -e PCOUNT
                echo -ne "${YELLOW}${BOLD}Cijena (KM): ${NC}"
                read -e PRICE

                echo "${START} ${END} ${NAME} ${DRIVER} ${PCOUNT} ${PRICE}" >> rides.txt



                clear
                ;;
                2|"provjeri voznje")

                echo -e "$(clear)\n\n\n\t\t         ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"

                echo -e "${YELLOW}${BOLD}Spisak vaših vožnji:\n\n${NC}"

                sed -n "/${NAME}/p" rides.txt

                echo -e "\n${YELLOW}${BOLD}Unesite bilo šta kada se želite vratiti na meni.${NC}\n"
                read exitBuffer


                clear
                ;;
                3|"exit")
                exit
                ;;
                *)
                echo "smol brain"
                ;;
            esac

        ;;
         *)

        echo "smol brain"

        ;;

    esac
done
