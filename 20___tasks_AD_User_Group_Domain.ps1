# Using dsadd command:
# Setting up a AD group with multiple levels

dsadd ou "ou=root,dc=domain_name,dc=com"
dsadd ou "ou=first_level,ou=root,dc=domain_name,dc=com"
dsadd ou "ou=second_level,ou=first_level,ou=root,dc=domain_name,dc=com"

# Create and add user to AD group root

dsadd user "cn=Sam Sample,ou=root,dc=domain_name,dc=com" `
-samid SSample -upn SSample@domain_name.com -fn Sam -ln Sample -display "Sam Sample" `
-desc "root commander" -mustchpwd no -pwdneverexpires yes -pwd "Pa$$w0rd!" 

