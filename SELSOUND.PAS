{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2024
  @website(https://www.gladir.com/pcjunior-tools)
  @abstract(Target: Turbo Pascal 7)
}

Program SELSOUND;

Uses DOS;

Var
 Regs:Registers;
 Err:Word;

BEGIN
 If(ParamStr(1)='/?')or(ParamStr(1)='--help')or(ParamStr(1)='-h')or
   (ParamStr(1)='/h')or(ParamStr(1)='/H')Then Begin
  WriteLn('SELSOUND : Cette commande permet de s�lectionner la source de ',
          'son d''un micro-ordinateur PC Junior en utilisant la fonction ',
          '�SOUND SOURCE SELECT� du BIOS.');
  WriteLn;
  WriteLn('Syntaxe : SELSOUND [/?] value');
  WriteLn;
  WriteLn(' /?      Fournir de l''aide sur cette commande.');
  WriteLn(' value   Valeur entre 0 et 3 :');
  WriteLn('           0 = Canal 2 de la minuterie programmable 8253');
  WriteLn('           1 = Entr�e du magn�tocassette');
  WriteLn('           2 = Ligne d''entr�e �Audio In� du canal d''entr�e/sortie');
  WriteLn('           3 = Puce g�n�ratrice de son');
 End
  Else
 If ParamCount>0 Then Begin
  Regs.AH:=$80;
  Val(ParamStr(1),Regs.AL,Err);
  If Err>0 Then Begin
   WriteLn('Param�tre avec une valeur invalide !');
   Halt(2);
  End;
  If Regs.AL>3 Then Begin
   WriteLn('Valeur en dehors de l''intervalle de 0 � 3 !');
   Halt(3)
  End;
  Intr($1A,Regs);
 End
  Else
 Begin
  WriteLn('Param�tre requis !');
  Halt(1);
 End;
END.