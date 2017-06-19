wrighting-cas
==============

Example .m2/settings file is in util
The ldap.manager.password needs to be the actual password
pwm.ldap.proxy.password needs to be the PWM encoded password
Assumes using mail address to authorize

Tomcat configuration
====================

You should ensure that tomcat is using java8 e.g. by setting JAVA_HOME in /etc/default/tomcat8 as update-alternatives might not set this correctly

https://tomcat.apache.org/tomcat-8.0-doc/security-howto.html
https://tomcat.apache.org/tomcat-8.0-doc/ssl-howto.html

https://blog.eveoh.nl/2014/02/tls-ssl-ciphers-pfs-tomcat/

What represents secure settings changes over time so this is only an indication

    <Connector port="8443" protocol="org.apache.coyote.http11.Http11NioProtocol" SSLEnabled="true"
               maxThreads="150" scheme="https" keystoreFile="/etc/tomcat8/keystore"
               secure="true" connectionTimeout="240000" clientAuth="false" sslProtocol="TLSv1.2" ciphers="TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256,TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384,TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA,TLS_ECDHE_RSA_WITH_RC4_128_SHA,TLS_RSA_WITH_AES_128_CBC_SHA256,TLS_RSA_WITH_AES_128_CBC_SHA,TLS_RSA_WITH_AES_256_CBC_SHA256,TLS_RSA_WITH_AES_256_CBC_SHA,SSL_RSA_WITH_RC4_128_SHA"/>

If you are using a proxy then you can restrict access by using firewall rules or you *may* want to configure a trust relationship e.g. by adding the attributes (Not covering how to create this)

Firewall
========

sudo ufw allow from 192.168.0.4 to any port 8443 proto tcp
