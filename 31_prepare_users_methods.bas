Option Explicit

' ___________________________________________________________________________
Public Function get_filename() As String

Dim strFile As String
Dim lngColumn As Long

On Error Resume Next

With Application.FileDialog(msoFileDialogFilePicker)
  .AllowMultiSelect = False
  .Title = "Please select the desired workbook."
  .InitialFileName = ThisWorkbook.Path
  .Filters.Add "Worksheets", "*.csv", 1
  If .Show = -1 Then
      strFile = .SelectedItems(1)
  End If
End With

If strFile <> "" Then
  Workbooks.Open strFile
Else
  Exit Function
End If

get_filename = strFile

End Function

' ___________________________________________________________________________
Public Function import_csv_data(ByVal strFilename As String)

Dim objFileSystemObject As Object
Dim objLine As Object
Dim strLine As String
Dim intCounter As Integer
Dim wksSheet As Worksheet

Set wksSheet = CSV_Import

On Error Resume Next

wksSheet.Rows.Delete
        
Set objFileSystemObject = CreateObject("Scripting.FilesystemObject")
Set objLine = objFileSystemObject.OpenTextFile(strFilename)

With wksSheet
    intCounter = 1
    Do Until objLine.AtEndOfStream
        strLine = objLine.Readline
        .Cells(intCounter, 1).Value = strLine
        intCounter = intCounter + 1
    Loop
End With

Set objLine = ActiveWorkbook
ActiveWorkbook.Close

wksSheet.Columns("A:A").TextToColumns Destination:=wksSheet.Range("A1"), _
    DataType:=xlDelimited, semicolon:=False

End Function

' ___________________________________________________________________________
Public Function separate_name_components()

Dim bleExclude As Boolean
Dim lngRow As Long
Dim lngRowMax As Long
Dim lngRowFree As Long
Dim strName As String
Dim strNameExclude As String
Dim intCounter As Integer
Dim intCounterCell As Integer
Dim intExclude As Integer
Dim intLbound As Integer
Dim intUbound As Integer
Dim varName As Variant
Dim varExclude As Variant

Result.UsedRange.Clear
Result.Cells(1, 1).Value = "firstname"
Result.Cells(1, 2).Value = "lastname"
Result.Cells(1, 3).Value = "email"
Result.Cells(1, 4).Value = "potential_logon"

intCounterCell = 1

varExclude = Array("Mr.", "Mrs.", "Miss", "MD", "Dr.", "DDS", "Ms.", "DVM", "PhD", "Jr.", "II", "III", "IV")

lngRowMax = CSV_Import.UsedRange.Rows.Count
lngRowFree = 2

On Error Resume Next

For lngRow = 1 To lngRowMax
  strName = CSV_Import.Cells(lngRow, 1).Value
  varName = Split(strName)
  For intCounter = LBound(varName) To UBound(varName)
    strName = varName(intCounter)
    For intExclude = LBound(varExclude) To UBound(varExclude)
      strNameExclude = varExclude(intExclude)
      If strName = strNameExclude Then
        bleExclude = True
        Exit For
      End If
    Next intExclude
    If bleExclude = False Then
      Result.Cells(lngRowFree, intCounterCell).Value = varName(intCounter)
      intCounterCell = intCounterCell + 1
    End If
    bleExclude = False
  Next intCounter
  intCounterCell = 1
  lngRowFree = lngRowFree + 1
Next lngRow

End Function

' ___________________________________________________________________________
Public Function add_random_email_address()

Dim intCounter As Integer
Dim intMail As Integer
Dim lngRow As Long
Dim lngRowMax As Long
Dim strFirstname As String
Dim strLastname As String
Dim strMail As String
Dim varMail As Variant

varMail = Array("@domain1.com", "@domain2.com", "@domain3.com", "@domain4.com")

On Error Resume Next

With Result

  lngRowMax = .UsedRange.Rows.Count
  For lngRow = 2 To lngRowMax
    strFirstname = .Cells(lngRow, 1).Value
    strLastname = .Cells(lngRow, 2).Value
    intMail = Int((UBound(varMail) * Rnd) + 1)
    strMail = strFirstname & "." & strLastname & varMail(intMail)
    .Cells(lngRow, 3).Value = strMail
  Next lngRow

End With

End Function

' ___________________________________________________________________________
Public Function create_logon_name(ByRef wksSheet As Worksheet)

Dim intNameApendix As Integer
Dim intNameLogon As Integer
Dim lngLogon As Long
Dim lngMatchResult As Long
Dim lngRow As Long
Dim lngRowMax As Long
Dim strFirstname As String
Dim strLastname As String
Dim strLogon As String
Dim strMatchResult As String
Dim varLogon As Variant

On Error Resume Next

With wksSheet
  
  ReDim varLogon(lngLogon)
  lngRowMax = .UsedRange.Rows.Count
  For lngRow = 2 To lngRowMax
    strFirstname = .Cells(lngRow, 1).Value
    strLastname = .Cells(lngRow, 2).Value
    strLogon = Left(strFirstname, 1) & strLastname
    intNameApendix = 0
    If Not IsNumeric(Application.Match(strLogon, varLogon, 0)) Then
      varLogon(lngLogon) = strLogon
      lngLogon = lngLogon + 1
      ReDim Preserve varLogon(lngLogon)
    Else
      Do While IsNumeric(Application.Match(strLogon, varLogon, 0))
        intNameApendix = intNameApendix + 1
        strLogon = strLogon & CStr(intNameApendix)
        If Not IsNumeric(Application.Match(strLogon, varLogon, 0)) Then
          varLogon(lngLogon) = strLogon
          lngLogon = lngLogon + 1
          ReDim Preserve varLogon(lngLogon)
          Exit Do
        Else
          strLogon = Left(strFirstname, 1) & strLastname
        End If
      Loop
    End If
    .Cells(lngRow, 4).Value = strLogon
  Next lngRow
  
  If UBound(varLogon) > 0 Then
    ReDim Preserve varLogon(UBound(varLogon) - 1)
  End If
  
End With

End Function

' ___________________________________________________________________________
Public Function process_individuals(ByVal lngIndividuals As Long)

Dim operations As New cls_operations

Dim lngCellFree As Long
Dim lngCounter As Long
Dim lngIndividualNumber As Long
Dim lngRow As Long
Dim lngRowMax As Long
Dim varNumber As Variant
Dim wksSheet As Worksheet

Set wksSheet = partial_group

With partial_group
  .UsedRange.Clear
  .Cells(1, 1).Value = "firstname"
  .Cells(1, 2).Value = "lastname"
  .Cells(1, 3).Value = "email"
  .Cells(1, 4).Value = "potential_logon"
End With

lngRowMax = Result.UsedRange.Rows.Count

ReDim varNumber(lngCounter)

Do Until lngCounter = lngIndividuals
  lngIndividualNumber = Int((lngRowMax * Rnd) + 1)
  If Not IsNumeric(Application.Match(lngIndividualNumber, varNumber, 0)) Then
    varNumber(lngCounter) = lngIndividualNumber
    lngCounter = lngCounter + 1
    ReDim Preserve varNumber(lngCounter)
  End If
Loop

ReDim Preserve varNumber(UBound(varNumber) - 1)

With wksSheet
  lngCellFree = .Cells(.Rows.Count, 1).End(xlUp).Row + 1
  For lngCounter = LBound(varNumber) To UBound(varNumber)
    .Cells(lngCellFree, 1).Value = Result.Cells(varNumber(lngCounter), 1).Value
    .Cells(lngCellFree, 2).Value = Result.Cells(varNumber(lngCounter), 2).Value
    .Cells(lngCellFree, 3).Value = Result.Cells(varNumber(lngCounter), 3).Value
    lngCellFree = lngCellFree + 1
  Next lngCounter
End With

CallByName operations, "create_logon_name", VbMethod, wksSheet

End Function

' ___________________________________________________________________________
Public Function apply_autofilter()

With partial_group
  If Not .AutoFilterMode = True Then .Range("A1").AutoFilter
  .Range("A:D").Sort key1:=.Range("B1"), order1:=xlAscending, Header:=xlYes
End With

End Function

Public Function check_input(ByVal strInput As String) As Long

Dim lngIndividuals As Long
Dim lngMaxIndividuals As Long

lngMaxIndividuals = Result.UsedRange.Rows.Count

If IsNumeric(strInput) = True Then
  lngIndividuals = CInt(strInput)
Else
  MsgBox "Wrong input format. Number of individuals is set to 200."
  lngIndividuals = 50
End If

If lngIndividuals > lngMaxIndividuals Then
  MsgBox "Number of individuals exceeds individuals from list."
  lngIndividuals = 50
End If

check_input = lngIndividuals

End Function
