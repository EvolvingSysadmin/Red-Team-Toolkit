# Penetration Testing Tools

List of useful tools outside of Kali/Metasploit.

https://github.com/absolomb/WindowsEnum

## WindowsEnum.ps1

A Powershell Privilege Escalation Enumeration Script.

### Usage

To run the quick standard checks.

```PowerShell
.\WindowsEnum.ps1
```

Directly from CMD

```CMD
powershell -nologo -executionpolicy bypass -file WindowsEnum.ps1
```
Extended checks will search for config files, various interesting files, and passwords in files and the registry, etc. It will take some time so be patient.

```PowerShell
.\WindowsEnum.ps1 extended
```
```CMD
powershell -nologo -executionpolicy bypass -file WindowsEnum.ps1 extended
```

## UserInfo.cmd


