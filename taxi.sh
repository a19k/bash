#users-->(NAME PASS)
#vehicles-->(ID BRAND MODEL LPNUMBER STATUS)


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
    echo -e "\n\n\n\t      ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"
    
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
            echo -e "$(clear)\n\n\n\t      ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"
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
                    echo -e "$(clear)\n\n\n\t      ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"
                    echo -e "\n${YELLOW}${BOLD}Dobrodošli, $NAME\n\n\n"
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


case $user in

    admin)

        for (( i=0; i<${#choice1[@]}; i++))
        do
        echo -e "${YELLOW}$(($i+1))| ${BOLD}${choice1[$i]}\n${NC}"
        done

        read choice

        case $choice in
            1|"dodaj vozilo")


            echo -e "$(clear)\n\n\n\t      ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"



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



            ;;
            2|"uredi vozilo")



            echo -e "$(clear)\n\n\n\t      ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"

            echo -e "<${YELLOW}${BOLD}Uređivanje vozila${NC}>\n"

            echo -e "${YELLOW}${BOLD}Unesite ID vozila kojeg uređujete(NNN): ${NC}"
            read -e tempID



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


            sed -e "/${tempID}/d" vehicles.txt
            echo "${ID} ${BRAND} ${MODEL} ${LPNUMBER} ${STATUS}" >> vehicles.txt



            ;;
            3|"izbrisi vozilo")
            


            echo -e "$(clear)\n\n\n\t      ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< ${NC}< ${YELLOW}${BOLD}< TAXI SISTEM Simulacija > ${NC}> ${YELLOW}${BOLD}> ${NC}> ${YELLOW}${BOLD}>${NC}\n\n\n"

            echo -e "<${YELLOW}${BOLD}Uređivanje vozila${NC}>\n"

            echo -e "${YELLOW}${BOLD}Unesite ID vozila kojeg uređujete(NNN): ${NC}"
            read -e tempID

            sed "//d" vehicles.txt

            ;;
            4|"provjeri voznje")
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

        for (( i=0; i<${#choice2[@]}; i++))
        do
        echo -e "${YELLOW}$(($i+1))| ${BOLD}${choice2[$i]}\n${NC}"
        done

        read choice


        case $choice in
            1|"rezervisi voznju")
            ;;
            2|"provjeri voznje")
            ;;
            3|"exit")
            exit
            ;;
            *)
            echo "smol brain"
            ;;
        esac

    ;;


    exit)

    exit

    ;;


    *)

    echo "smol brain"

	;;

esac

