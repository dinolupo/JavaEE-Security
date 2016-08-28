# Java EE 7 Security Demo Application

This project is an example application to show security of Java EE applications.

To show how LDAP authentication works, start the ldap-vagrant server, then in Glassfish or Payara, configure the following authentication realm:

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

With `ldapphpadmin` (see the readme into the folder ldap-vagrant) configure a group with members alice and bob, then try to authenticate with a member of the group and with another member. 

> LDAP group configuration

cn=backoffice,dc=vagrant,dc=dev

