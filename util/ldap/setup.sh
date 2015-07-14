#If the following command shows more than one naming context then memberof won't work
#ldapsearch -x -b '' -s base '(objectclass=*)' namingContexts
#There should not be a nodomain context
#This can be modified by adding the domain to the name in the /etc/hosts
if [ "$USER" != "root" ]
then
	echo "Must be run as root"
	exit
fi
apt-get purge slapd
rm -rf /var/lib/ldap/*

apt-get install slapd ldap-utils
ldapadd -Y EXTERNAL -H ldapi:/// -f memberOf1.ldif
ldapadd -Y EXTERNAL -H ldapi:/// -f memberOf2.ldif
ldapadd -Q -Y EXTERNAL -H ldapi:/// -f pwm.openldap.ldif
ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f perms.ldif
ldapmodify -Q -Y EXTERNAL -H ldapi:/// -f index.ldif

ldapadd -x -D cn=admin,dc=wrighting,dc=org  -W -f setup.ldif

ldappasswd -W -S -D "cn=admin,dc=wrighting,dc=org" "cn=pwm,ou=system,ou=people,dc=wrighting,dc=org"

