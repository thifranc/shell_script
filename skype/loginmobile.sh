while read LOGIN
do
	ldapsearch uid=$LOGIN |
	if grep "dn" | grep "2016"
		then 
			ldapsearch uid=$LOGIN |
			grep "mobile" | sed "s/[^0-9]*//g" |
			grep -E "^0[0-9]{9}$" | sed "s/^0/+33/g" >> $2
			(echo SUCCESS ; exit 1)
		else 
			(echo FAIL ; exit 0) fi
done < $1
