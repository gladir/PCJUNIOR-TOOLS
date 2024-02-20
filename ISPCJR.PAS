{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/pcjunior-tools)
  @abstract(Target: Turbo Pascal 7)
}

Program ISPCJR;

Var
 Model:Byte Absolute $F000:$FFFE;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('ISPCJR : Cette commande permet de v‚rifier s''il s''agit ',
          'd''un micro-ordinateur PC Junior.');
  WriteLn;
  WriteLn('Syntaxe : ISPCJR [/?]');
  WriteLn;
  WriteLn(' /?    Fournir de l''aide sur cette commande.');
 End
  Else
 Begin
  Case Model of
   $FD:WriteLn('PC Junior d‚tect‚ !');
   Else Begin
    WriteLn('Ce n''est pas un PC Junior');
    Halt(1);
   End;
  End;
 End;
END.