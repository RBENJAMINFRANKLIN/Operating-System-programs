var=1
while [ $var -eq 1 ]
do
	echo "1.Create address book"
	echo "2.Display"
	echo "3.insert"
	echo "4.Modify"
	echo "5.Delete"
	echo "6.Exit"
	read choice
	case $choice in
		1) if [ -f record.text ]
		   then
			echo "File already exists"
		   else
			touch record.txt
		   fi;;
		2) if [ -s record.txt ]
		   then
			echo "Reg no    Name	Phone	Address	Year"
			echo "  "
			cat record.txt
			echo "  "
		   else
			echo "File is empty"
		   fi
		   ;;
		3) read -p "Reg no" reg
		   read -p "Name" name
		   read -p "Address" add
		   read -p "Phone no" ph
                   read -p "Year" year
		   echo "$reg  $name  $ph  $add  $year">>record.txt;;
		4) if [ -s record.txt ]
			then
				
				#echo "Enter line no"
				#read line
				echo "reg no"
				read reg
				l=`wc -l record.txt|cut -f1 -d " "`
				a=`grep -n -w "^$reg" record.txt|cut -f1 -d ":"`
				n=$(($a-1))
				c=$(($l-$a))
				head -$n record.txt>temp.txt
				   read -p "Reg no" reg
				   read -p "Name" name
				   read -p "Address" add
				   read -p "Phone no" ph
				   read -p "Year" year
				echo "$reg  $name  $ph  $add  $year">>temp.txt
				tail -$c record.txt >> temp.txt
				mv temp.txt record.txt
				
				#grep -v -i $reg record.txt > del.txt
				#mv del.txt record.txt
				#read -p "Reg no" reg
			       # read -p "Name" name
			       # read -p "Address" add
			       # read -p "Phone no" ph
			       # read -p "Year" year
				# echo " $reg \t $name \t $ph \t $add \t $year \n">>record.txt
				#sed -i "$line s/.*/  $reg $name  $add  $ph  $year /" record.txt     #edit files in place (makes backup if SUFFIX supplied) 
		   fi
				;;  
		5) if [ -s record.txt ]
		   then
			read -p "Enter the reg no" reg
			grep -v -i $reg record.txt > del.txt
			mv del.txt record.txt
			#mv del.txt abc.txt
			#sed -i -e "/$reg/d" record.txt
			echo "successfully deleted"
		   else
			echo "The file is already empty"
		   fi;;
		6) break
		   ;;
		*) echo "invalid choice";;
	esac
done
	
		   
		  
