# Reset the password of an AD user:

$username = "SampleS"
$passwd = ConvertTo-SecureString '[password123]' -AsPlainText -Force

Set-ADAccountPassword -Identity $username -Reset -NewPassword $passwd
