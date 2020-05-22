@echo off

:Menu
title Novo usu rio
mode 100,20
color 07
cls
echo.
echo Preencha as informa‡äes abaixo para continuar.
if exist "arq_sis\temp\novo_usuario_config.txt" echo Caso queira voltar ao Gerenciamento de Usu rio, digite 1.
echo.
set /p nome=Nome:
if exist "arq_sis\temp\novo_usuario_config.txt" (
if "%nome%" EQU "1" call "arq_sis\configuracoes.bat"
)
if exist "usuarios\%nome%" (
title ERRO
color C0
echo.
echo Este usu rio j  existe.
pause
goto Menu
)
set senha=0
set /p senha=Senha:
if "%senha%" EQU "0" (
title ERRO
color C0
echo.
echo Vocˆ nÆo pode deixar este campo vazio.
pause
goto Menu
)
if "%senha%" EQU "1" (
title ERRO
color C0
echo.
echo Algumas partes do programa nÆo funcionam ao fazer isto.
pause
goto Menu
)
set /p senha1=Confirmar senha:
if "%senha%" NEQ "%senha1%" (
title ERRO
color C0
echo.
echo As senhas digitadas nÆo correspondem.
pause
goto Menu
)
echo.
echo Digite uma cor para plano de fundo e outra para letra.
echo Ex:07
echo.
echo 0 = Preto        8 = Cinza
echo 1 = Azul         9 = Azul claro
echo 2 = Verde        A = Verde claro
echo 3 = Verde- gua   B = Verde- gua claro
echo 4 = Vermelho     C = Vermelho claro
echo 5 = Roxo         D = Lil s
echo 6 = Amarelo      E = Amarelo claro
echo 7 = Branco       F = Branco brilhante
echo.
set /p cores=Cores:

:Tamanho
echo.
echo Digite um valor para tamanho de tela.
echo Ex:120,20
echo.
echo OBS:nÆo ‚ recomend vel colocar o valor abaixo de 100,20.
echo.
set /p tamanho=Tamanho:

:Tamanho1
mode %tamanho%
echo.
echo Continuar com este tamanho de tela?
echo.
echo 1.Sim
echo 2.NÆo
echo.
set /p tamanho1=Comando:
if "%tamanho1%" EQU "1" goto Verificar
if "%tamanho1%" EQU "2" (
cls
goto Tamanho
)
cls
goto Tamanho1

:Verificar
color %cores%
cls
echo.
echo Verifique-se vocˆ digitou tudo corretamente.
echo.
echo Nome:%nome% \ Senha:%senha% \ Tamanho de tela:%tamanho% \ Esquema de cores:%cores%
echo.
echo 1.Concordar e continuar
echo 2.Voltar e corrigir informa‡äes
echo.
set /p verificar=Comando:
if "%verificar%" EQU "1" goto Criar
if "%verificar%" EQU "2" goto Menu
goto Verificar

:Criar
md "usuarios\%nome%\imagens"
md "usuarios\%nome%\videos"
md "usuarios\%nome%\documentos"
md "usuarios\%nome%\musicas"
md "usuarios\%nome%\config"
md "usuarios\%nome%\anotacoes"
md "usuarios\%nome%\agenda"
echo set nome=%nome%>>"usuarios\%nome%\config\nome.bat"
echo set senha=%senha%>>"usuarios\%nome%\config\senha.bat"
echo set cores=%cores%>>"usuarios\%nome%\config\cores.bat"
echo set tamanho=%tamanho%>>"usuarios\%nome%\config\tamanho.bat"

:Fim
title Fim
cls
echo.
echo O usu rio %nome% foi criado com sucesso.
pause
exit
