theory defunctionalization_Expr
  imports "NTP4Verif.NTP4Verif"
begin
datatype  expr = Cte "int" | Sub "expr" "expr"
typedecl  prog
end
