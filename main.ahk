; Advanced Calculator Script

; --feel free to change GUI settings as wanted--

; GUI Settings
Gui +AlwaysOnTop
Gui Add, Edit, w300 vInput
Gui Add, Button, gCalculate, =
Gui Add, Text, w300 vResult
Gui Show, w320 h200, Advanced Calculator

; Button Listeners
Calculate:
    Gui Submit, NoHide
    Result := EvaluateExpression(Input)
    GuiControl,, Result, % Result
    Return

GuiClose:
    ExitApp
Return

; Function to Evaluate Algebraic Expressions
EvaluateExpression(Expression) {
    Expression := StrReplace(Expression, " ", "") ; Remove whitespace
    Expression := ReplaceVariables(Expression) ; Replace variables with their values
    Result := ""
    
    try {
        Result := eval(Expression)
    } catch {
        MsgBox, The expression is invalid.
    }
    
    return Result
}

; Function to Replace Variables
ReplaceVariables(Expression) {
    VariableList := {
        "x": 5,
        "y": 10
    }
    
    for Var, Value in VariableList {
        Expression := StrReplace(Expression, Var, Value)
    }
    
    return Expression
}
