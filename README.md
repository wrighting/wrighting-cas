wrighting-cas
==============

Example .m2/settings file
The ldap.manager.password needs to be the actual password
pwm.ldap.proxy.password needs to be the PWM encoded password
Assumes using mail address to authorize

<settings xmlns="http://maven.apache.org/SETTINGS/1.1.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.1.0 http://maven.apache.org/xsd/settings-1.1.0.xsd">
  <profiles>
    <profile>
      <id>ian-profile</id>
      <activation>
        <activeByDefault>true</activeByDefault> 
        <!-- <property><name>eclipse.preferences.version</name></property> -->
      </activation>
      <properties>
	<wrighting.mail.host>localhost</wrighting.mail.host>
	<wrighting.cas.server.name>https://wrighting.org</wrighting.cas.server.name>
	<wrighting.cas.logout>/logout?service=http://wrighting.org/</wrighting.cas.logout>
	<wrighting.cas.context>sso</wrighting.cas.context>
	<wrighting.cas.host.name>wrighting.org</wrighting.cas.host.name>
        <wrighting.ldap.url>ldap://localhost:389</wrighting.ldap.url>
	<wrighting.ldap.useStartTLS>false</wrighting.ldap.useStartTLS>
        <pwm.ldap.proxy.password>*************</pwm.ldap.proxy.password>
        <wrighting.ldap.manager.userdn>cn=pwm,ou=system,ou=people,dc=wrighting,dc=org</wrighting.ldap.manager.userdn>
	<wrighting.ldap.manager.password><![CDATA[*************]]></wrighting.ldap.manager.password>
	<wrighting.ldap.authentication.basedn>ou=users,ou=people,dc=wrighting,dc=org</wrighting.ldap.authentication.basedn>
	<wrighting.ldap.search.filter>(uid={user})</wrighting.ldap.search.filter>
	<wrighting.ldap.authn.format>mail=%s,ou=users,ou=people,dc=wrighting,dc=org</wrighting.ldap.authn.format>
        <logDirectory>/var/log/tomcat7/</logDirectory>
        <logAppender>cas</logAppender>
        <wrighting.config.newUser.enable>false</wrighting.config.newUser.enable>
      </properties>
    </profile>
  </profiles>

</settings>
