  Readme
For the RuleCompliance bash file

The purpose of this project is to check the compliance of 5 vulnerabilities from STIG(Security Technical Implementation Guides which include 2 from Cat I and 3 from Cat II in the Ubuntu operating system. The users who will use thos to check those vulnerabilities and fix them in case they fail. It has a set of rules for each security vulnerability to check and fix this data to prevent the certain vulnerability.

For the script, the main objective is to check and fix the compliance of the five vulnerabilities like said. The script starts with a variable that would be used to represent the vulnerable that equals to the input which is its command to check the compliance
If the vulnerability is compliant, then a message will print saying it is co

It features two if...else statements(while three if statements) per each vulnerablility
One if...statement is checking its compliance and if it is compliant, then it would print a message that says so, otherwise it will print that it is not compliant that it will get to the second if...else statement which will fix this checked error.
It will allow users to type in y for yes and n for no.
In the additional if statement, the users typed in yes, there would be a command that will be able to fix the error as it will show its process in the command line and will print that the system is compliant with the vulnerability fixed
Otherwise, if the vulnerability cannot be fixed or if the user typed in no or any other input, then it would print a message that the system is not compliant as the error is still prevent in the Ubuntu system

The 5 rules that are used in this code for the Ubuntu system are:
1.SV-251504r832977(CAT I) - Must not allow any accounts with any blank or null passwords in the Ubuntu operating system.
2. SV-238327r654156(CAT I) - Must not have the rsh-server package installed
3.SV-238300r654075(CAT II)- Must configure audit tools that with of 0755 or less permissive
4. SV-238354r853429 - The system needs to have an application firewall installed in order to control remote access
5.SV-238342r654201(CAT II) -Must configure /var/log/syslog file to be owned by syslog.

You wil need the following things to use the system:
Ubuntu Operating System
Knowledge on Bash language and command line tools that will be used in the process
Use of root or sudo command for login
In order to use this script, follow these steps:
1.Click on the terminator application on the Ubuntu operating system
2. When starting the program, make sure you type in ./RuleCompliance.sh
3. The system will to put in your password to the Ubuntu operating system while this is required for the usage of sudo
3. If the checks failed in a vulnerability, make sure that you click on y for yes to fix the  compliance to increase prevention in the system

Examples of command line entries:
./RuleCompliance.sh
The system is not compliant while Ctrl-Alt Delete is enabled
Would you like to disable Ctrl-Alt-Delete? Type in y/n: y
Unit /etc/systemd/system/ctrl-alt-del.target is masked, ignoring.
System is compliant as Ctrl Alt Delete has been disabled

grep: server: No such file or directory
The system is not compliant while the RSH Server package is installed
Would you like to uninstall the RSH Server package? Type y/n: n
The system is still not compliant while the RSH Server is still installed

stat: cannot stat '/sbin/auditctl': No such file or directory
stat: cannot stat '/sbin/aureport': No such file or directory
stat: cannot stat '/sbin/ausearch': No such file or directory
stat: cannot stat '/sbin/autrace': No such file or directory
stat: cannot stat '/sbin/auditd': No such file or directory
stat: cannot stat '/sbin/audispd': No such file or directory
stat: cannot stat '/sbin/augenrules': No such file or directory
The system is not complaint as it cannot configure Audit tools that are of 0755 or less permissive
Would you like to configure audit tools that 0755 or less permissive. Type in y/n: cs
The system is still not compliant as it cannot configure audit tools that are 0755 or less permissive

The system is not compliant with the application firewall uninstalled as it does not have any remote access controls
Would you like to to install the application firewall to control remote access? Type y/n: 
Type y/n: y
Reading package lists... Done
Building dependency tree       
Reading state information... Done
ufw is already the newest version (0.36-6ubuntu1.1).
0 upgraded, 0 newly installed, 0 to remove and 55 not upgraded.
System is compliant as the application firewall is installed for remote access

stat: cannot stat 'syslog': No such file or directory
The system is not compliant as /var/log/syslog is not owned by syslog
Would you like to configure /var/log/syslog? Type y/n: n
The system is still not compliant while /var/log/syslog is not configured

Looking at these examples, the user has to type y for yes to fix the compliance. When doing so, the process of these operations will show on the command line
However, if the user press n, no, or any other input, the the compliance will fail and not continue it is not protected from the vulnerabilities.
With all of this said, it would make the system more vulnerable when typing any response besides y to fix this compliance to make it more protected.
