program QS6;

{$AppType CONSOLE}

uses
  SysUtils,
  uISubstitui in 'uISubstitui.pas',
  uSubstitui in 'uSubstitui.pas';

{$R *.RES}

var
  name : string;
  substituir: TSubstitui;

begin
  substituir := TSubstitui.Create;
  WriteLn(substituir.Substituir('O rato roeu a roupa do rei de roma', 'ro', 'teste'));
  //substituir.Substituir('O rato roeu a roupa do rei de roma', 'ro', 'teste');
  ReadLn(name);
end.

