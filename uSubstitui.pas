unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
        function Substituir(aStr, aVelho, aNovo: String): String;
  end;

  function Posicao(substr, s: string; proxima: Integer): Integer;
  function Copiar(s: string; inicio, tamanho: Integer): string;
  function Inserir(s, substr: string; posicao: Integer): string;
  function Deletar(s: string; inicio, tamanho: Integer): string;

implementation

function Posicao(substr, s: string; proxima: Integer): Integer;
var
        max, i, tamanho: Integer;
        aux: string;
begin
        Result := 0;
        i := proxima;
        tamanho := Length(substr);
        //WriteLn(tamanho);
        max := Length(s) - tamanho;
        while (i <= max) do
        begin
                Inc(i);
                aux := Copiar(s, i, tamanho);
                //aux := copy(s,i,tamanho);
                if aux = substr then
                begin
                        Result := i;
                        Break;
                end;
        end;
end;

function Copiar(s: string; inicio, tamanho: Integer): string;
var
        i, parar: Integer;
begin
        Result := s;
        parar := inicio + tamanho - 1;
        if parar <= Length(s) then
        begin
                Result := '';
                for i := inicio to parar do
                begin
                        Result := Result + s[i];
                end;
        end;
end;

function Inserir(s, substr: string; posicao: Integer): string;
var
        i: Integer;
        tamanho: Integer;
begin
        Result := s;
        tamanho := Length(s);
        if posicao <= tamanho then
        begin
                Result := '';
                for i := 1 to tamanho do
                begin
                        if i = posicao then
                        begin
                                Result := Result + substr;
                        end;
                        Result := Result + s[i];
                end;
        end
        else
                if ((posicao - 1) = tamanho) then
                begin
                        Result := Result + substr;
                end;
        end;

function Deletar(s: string; inicio, tamanho: Integer): string;
var
        i, parar: Integer;
begin
        Result := s;
        parar := inicio + tamanho - 1;
        if parar <= Length(s) then
        begin
                Result := '';
                for i := 1 to Length(s) do
                begin
                        if (i < inicio) or (i > parar) then
                        begin
                                Result := Result + s[i];
                        end;
                end;
        end;
end;

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
        pos, proxima, cont, tamnovo, tamvelho: Integer;
begin
        Result   := aStr;
        proxima  := 0;
        tamnovo  := Length(aNovo);
        tamvelho := Length(aVelho);
        for cont := 1 to Length(Result) do
        begin
                pos := Posicao(aVelho, Result, proxima);
                if pos > 0 then
                begin
                        proxima := pos + tamnovo;
                        Result  := Deletar(Result, pos, tamvelho);
                        Result  := Inserir(Result, aNovo, pos);
                end;
        end;
end;

end.
