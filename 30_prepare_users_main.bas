Option Explicit

' ____________________________________________________________________________________________________
' Methods are to be found at 31_prepare_users_methods.bas
' ____________________________________________________________________________________________________
Sub main_operation()

Dim operations As New cls_operations

Dim dteStart As Date
Dim dteEnd As Date
Dim dteDiff As Date
Dim lngIndividuals As Long

Dim strFile As String
Dim strInput As String

dteStart = Now() ' Measure processing time

If MsgBox("Import CSV file with names?", vbYesNo + vbQuestion) = vbYes Then
  strFile = CallByName(operations, "get_filename", VbMethod)
  CallByName operations, "import_csv_data", VbMethod, strFile
End If

CallByName operations, "separate_name_components", VbMethod
CallByName operations, "add_random_email_address", VbMethod

strInput = InputBox("Enter the number of partial users")
lngIndividuals = CallByName(operations, "check_input", VbMethod, strInput)
CallByName operations, "process_individuals", VbMethod, lngIndividuals

If MsgBox("Create LogOn names for all imported users? ", vbYesNo + vbQuestion) = vbYes Then
  CallByName operations, "create_logon_name", VbMethod, Result
End If

If MsgBox("Filter partial_names table? ", vbYesNo + vbQuestion) = vbYes Then
  CallByName operations, "apply_autofilter", VbMethod
End If

dteEnd = Now() ' Measure processing time
dteDiff = dteEnd - dteStart
Debug.Print dteDiff

End Sub
