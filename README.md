# Java EE 7 Security Demo Application

This project is an example application to show security of Java EE applications.

Clone this repo with:

`git clone --recursive https://github.com/dinolupo/JavaEE-Security.git`

## Security with LDAP

To show how LDAP authentication and authorization works, start the `ldap-vagrant` server:

	cd ldap-vagrant
	vagrant up

Then in Glassfish or Payara, configure the following authentication realm:

> payara41/glassfish/domains/domain1/config/domain.xml

```xml
<auth-realm classname="com.sun.enterprise.security.auth.realm.ldap.LDAPRealm" name="LdapRealm">
	<property name="directory" value="ldap://ldap.vagrant.dev"></property>
	<property name="base-dn" value="dc=vagrant,dc=dev"></property>
	<property name="jaas-context" value="ldapRealm"></property>
	<property name="search-filter" value="(&amp;(objectClass=inetOrgPerson)(uid=%s))"></property>
	<property name="group-search-filter" value="(&amp;(objectClass=groupOfNames)(member=%d))"></property>
	<property name="assign groups" value="Domain Users"></property>
	<property name="search-bind-dn" value="cn=admin,dc=vagrant,dc=dev"></property>
	<property name="search-bind-password" value="password"></property>
	<property name="java.naming.referral" value="follow"></property>
</auth-realm>
```

You can check with `ldapphpadmin` (see the readme into the folder ldap-vagrant) the ldap configuration if you want. 

Now start the server deploy/run the war.

Authentication is defined by users configured in the system. For example you can login with the following login and password:
	
	alice / password 

Authorization is defined in LDAP using `backoffice` and `clients` groups. Those groups are mapped to roles in the file `glassfish-web.xml`. 

