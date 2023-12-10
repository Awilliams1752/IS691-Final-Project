#!/bin/bash

#Allyson Williams
#12/8/2023
#IS 580/691

#Rule 1 - SV-238380r832974
# This system verifies that Ctrl-Alt-Delete is disabled
CtrlAltDelCheck=$(sudo systemctl status ctrl-alt-del.target)

#Create an if...else loop if the statement is compliant
if [[ "$CtrlAltDelCheck" == *true* ]]; then

        #if the rule is complaint
        echo "The system is complaint without Ctrl-Alt-Deleted enabled"

	#If the rule is not complaint
else
        echo "The system is not complaint while Ctrl-Alt Delete is enabled"
fi
#Allow user to fix the complaince
if [[ "$CtrlAltDelCheck" != *true* ]]; then
	#Asks users if they want to disable Ctrl-Alt-Delete from the system
        read -p "Would you like to disable Ctrl-Alt-Delete? Type in y/n: " disablecad
fi
		#If the user responds with yes(y)
          if [[ $disablecad == 'y' ]]; then
			#Disables the ctrl-alt-delete feature
                       sudo systemctl disable ctrl-alt-del.target

			#Masks the ctrl-alt-delete feature
		       sudo systemctl mask ctrl-alt-del.target

			#Reload daemon to start over
			sudo systemctl daemon-reload 
			#Print a message that the system is compliant and ctrl-alt-delete is disabled
			echo "System is compliant as Ctrl Alt Delete has been disabled"
			#If the user pressed no or another input or if the system is not compliant, it prints a message that it is not compliant
	else echo "The system is still not compliant as it still has Ctrl-Alt-Delete enabled"
fi

#Rule 2- SV-238327r654156 
# The system must not have the rsh-server package installed

RSHInstall=$(dpkg -l | grep rsh- server).

#Create an if...else loop if the statement is compliant
if [[ "$RSHInstall" == *true* ]]; then
	#if the rule is complaint
        echo "The system is compliant without the RSH Server installed"
	#If the rule is not complaint
else
        echo "The system is not compliant while the RSH Server package is installed"
fi

#Allow user to fix the complaince
if [[ "$RSHInstall" != *true* ]]; then

	#Gives the user the option to uninstall the RSH server package
        read -p  "Would you like to uninstall the RSH Server package? Type y/n: " uninstallrsh
fi
		#If the compliance works
                if [[ $uninstallrsh == 'y' ]]; then

			#Root removes the RSH Server package
			sudo apt-get remove rsh-server
			#Prints a message that the system is compliant and the RSH server package is uninstalled
			echo "System is compliant as the RSH Server package is uninstalled"

		#If the compliance fails and the command do not work
		else echo "The system is still not compliant while the RSH Server is still installed"
fi

#Rule 3- SV-238300r654075  The system must configure audit tools that with of 0755 or less permissive
ConfigAudit=$(stat -c "%n %a" /sbin/auditctl /sbin/aureport /sbin/ausearch /sbin/autrace /sbin/auditd /sbin/audispd /sbin/augenrules)

#Create an if...else statement if the statement is complaint
if [[ "ConfigAudit" == *true* ]]; then
#if the rule is complaint
        echo "The system is compliant as it can configure Audit tools that are of 0755 or less permissive"
#If the rule is not complaint
else
        echo "The system is not compliant as it cannot configure Audit tools that are of 0755 or less permissive"
fi

#Fix the compliance
if [[ "$ConfigAudit" != *true* ]]; then

		#Gives the user the option of(y/n) if they want to configure audit tools that 0755 or less permissive
	read -p "Would you like to configure audit tools that 0755 or less permissive. Type in y/n: " config0755
fi
		#If you decide to fix the compliance, it would fix the error using the operation
		if [[ $config0755 == 'y' ]]; then

			#Configure the audit tools to protect the system from unathorized acces
			sudo chmod 0755 [audit_tool] 

			#Prints a message that the audit tools that are 0755 or less permissive are configured
			echo "System is compliant as audit tools that are 0755 or less permissive are configured"

		#If the compliance fails
		else echo "The system is still not compliant as it cannot configure audit tools that are 0755 or less permissive"
fi

#Rule 4 - SV-238354r853429 - The system needs to have an application firewall installed in order to control remote access methods
RemoteFirewall=$(dpkg -l | grep ufw) #Variable for the rule

#Create an if...else loop if the statement is compliant
if [[ "$RemoteFirewall" == *true* ]]; then

        echo "The system is compliant with the application firewall installed with remote access controls"

#If the rule is not complaint
else
        echo "The system is not compliant with the application firewall uninstalled as it does not have any remote access controls"
fi

#Allow user to fix the complaince
if [[ "$RemoteFirewall" != *true* ]]; then

	#Gives the option to fix the compliance
        read -p  "Would you like to to install the application firewall to control remote access? Type y/n: " installremotefw
fi
		#If the user chose to fix the compliance, then it would perform the following commands
                if [[ $installremotefw == 'y' ]]; then

		#Installs the uncomplicated firewall
                sudo apt-get install ufw 

		#Prints a message that the compliance is fixed
                 echo "System is compliant as the application firewall is installed for remote access"

		#If the compliance is still not fixed
                else echo "The system is still not compliant while the application firewall is still not installed for remote access"
fi

#Rule 5- SV-238342r654201 -The system must configure /var/log/syslog file to be owned by syslog.
SyslogConfig=$(sudo stat -c "%n %U" /var/log/syslog /var/log/syslog syslog)

if [[ "$SyslogConfig" == *true* ]]; then
#if the rule is complaint
        echo "The system is compliant as /var/log/syslog as it is owned by syslog"
#If the rule is not complaint
else
        echo "The system is not compliant as /var/log/syslog is not owned by syslog"
fi

#Allow user to fix the complaince
if [[ "$SyslogConfig" != *true* ]]; then
	#Allow users to have the option to config /var/log/syslog either pressing y or n for yes or no
        read -p  "Would you like to configure /var/log/syslog? Type y/n: " configuresyslog
fi
		#If the user chose to fix the compliance, it will follow the commands
                if [[ $configuresyslog == 'y' ]]; then

		#Configure the system to have the "/var/log/syslog file
                sudo chown syslog /var/log/syslog

		#If the compliance is fixed, it will print that /var/log/syslog is configured
                 echo "System is compliant as /var/log/syslog is configured"

		#If the compliance is still not fixed
                else echo "The system is still not compliant while /var/log/syslog is not configured" 
fi
