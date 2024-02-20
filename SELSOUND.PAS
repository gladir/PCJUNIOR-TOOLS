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
  WriteLn('SELSOUND : Cette commande permet de sÇlectionner la source de ',
          'son d''un micro-ordinateur PC Junior en utilisant la fonction ',
          'ÆSOUND SOURCE SELECTØ du BIOS.');
  WriteLn;
  WriteLn('Syntaxe : SELSOUND [/?] value');
  WriteLn;
  WriteLn(' /?      Fournir de l''aide sur cette commande.');
  WriteLn(' value   Valeur entre 0 et 3 :');
  WriteLn('           0 = Canal 2 de la minuterie programmable 8253');
  WriteLn('           1 = EntrÇe du magnÇtocassette');
  WriteLn('           2 = Ligne d''entrÇe ÆAudio InØ du canal d''entrÇe/sortie');
  WriteLn('           3 = Puce gÇnÇratrice de son');
 End
  Else
 If ParamCount>0 Then Begin
  Regs.AH:=$80;
  Val(ParamStr(1),Regs.AL,Err);
  If Err>0 Then Begin
   WriteLn('Paramätre avec une valeur invalide !');
   Halt(2);
  End;
  If Regs.AL>3 Then Begin
   WriteLn('Valeur en dehors de l''intervalle de 0 Ö 3 !');
   Halt(3)
  End;
  Intr($1A,Regs);
 End
  Else
 Begin
  WriteLn('Paramätre requis !');
  Halt(1);
 End;
END.