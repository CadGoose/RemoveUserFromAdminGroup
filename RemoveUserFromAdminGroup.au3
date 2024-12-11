; Ensure the script runs as administrator
If Not IsAdmin() Then
    MsgBox(0, "Error", "This script must be run as administrator!")
    Exit
EndIf

; Prompt for the user account name to be removed from the local administrators group
$userAccount = InputBox("User Account", "Enter the username to be removed from the local administrators group:")

; Validate input - check if the user canceled, entered an empty string, or entered a bad username
If @error Or StringLen($userAccount) = 0 Then
    MsgBox(0, "Error", "No username entered. Exiting script.")
    Exit
EndIf

; Predefined credentials for performing the operation
$adminUsername = "ADMIN USER NAME"
$adminPassword = "ADMIN PASSWORD"

; Prepare the net command to remove the user from the local administrators group
$netCommand = 'net localgroup administrators "' & $userAccount & '" /delete'

; Use ShellExecute to run the command with admin privileges
Local $result = ShellExecute('cmd.exe', '/c ' & $netCommand, @SystemDir, 'runas', @SW_HIDE)

; Wait for the command to complete
If $result Then
    ; Wait for the command to finish (you can adjust the sleep time if necessary)
    Sleep(3000)

    ; Check if the user was successfully removed from the local admin group
    If FileExists('C:\Windows\System32\cmd.exe') Then
        MsgBox(0, "Success", "User " & $userAccount & " has been successfully removed from the local administrators group.")
    Else
        MsgBox(0, "Error", "Failed to remove the user from the local administrators group.")
    EndIf
Else
    MsgBox(0, "Error", "Failed to execute the command with admin rights.")
EndIf

; Ask the user whether to restart now or later
Local $restartChoice = MsgBox(4, "Restart", "Would you like to restart the computer now? (Yes = Restart Now, No = Restart Later)")

If $restartChoice = 6 Then  ; If the user selects "Yes"
    Shutdown(6)  ; Restart the computer
Else
    MsgBox(0, "Info", "You can restart the computer later.")
EndIf
