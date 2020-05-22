@echo off
set menu=0
set feito=1
if exist "arq_sis\temp\tarefa.bat" (
call "arq_sis\temp\tarefa.bat"
goto VTD
)

:Menu
set VTD=1
set feito=1
title Agenda
if not exist "arq_sis\temp\config_ger.bat" (
echo set nome=%nome%>>"arq_sis\temp\ini_rap.bat"
echo.>>"arq_sis\temp\ini_agenda.txt"
call "iniciar.bat"
)
if exist "arq_sis\temp\config_ger.bat" call "arq_sis\temp\config_ger.bat"
if not exist "usuarios\%nome%\agenda\%date%" md "usuarios\%nome%\agenda\%date%"
if exist "arq_sis\temp\ini_agenda.txt" del /q "arq_sis\temp\ini_agenda.txt"
cls
if "%tamanho1%" EQU "0" (
mode %tamanho%
) ELSE (
mode %tamanho1%
)
color %cores%
echo.
echo Caso queira gerenciar uma tarefa espec¡fica, digite o nome.
echo.
dir "usuarios\%nome%\agenda\%date%"
echo.
echo 1.Visualizar dia espec¡fico \ 2.Nova tarefa \ 3.Mostrar tarefas ocutas(feitas) \ 4.Limpar dia
echo.
set /p menu=Comando:
if exist "usuarios\%nome%\agenda\%date%\%menu%.bat" (
if exist "usuarios\%nome%\agenda\Feito\%date%\%menu%" goto Feito
goto VTD
)
if "%menu%" EQU "1" goto VDE
if "%menu%" EQU "2" goto NT
if "%menu%" EQU "3" (
attrib -h "usuarios\%nome%\agenda\%date%\*.bat"
goto Menu
)
if "%menu%" EQU "4" (
rd /s /q "usuarios\%nome%\agenda\%date%"
md "usuarios\%nome%\agenda\%date%"
echo.
echo Feito.
pause
goto Menu
)
title ERRO
color C0
echo.
echo A tarefa digitada nÆo existe ou nÆo ‚ deste dia.
pause
goto Menu

:VTD
if "%vtd%" EQU "1" (
echo.
call "usuarios\%nome%\agenda\%date%\%menu%.bat"
) ELSE (
echo O que vocˆ deseja fazer com a tarefa "%tarefa%"?
)
title Gerenciar tarefa - %tarefa%
if "%nt21%" NEQ "fim" echo.
if "%feito%" EQU "0" (
set vtdf=Desmarcar tarefa como finalizada
) ELSE (
set vtdf=Marcar tarefa como finalizada
)
if "%vtd%" EQU "1" (
echo 1.%vtdf% \ 2.Excluir \ 3.Mudar data \ 4.Renomear \ 5.Voltar
) ELSE (
echo 1.%vtdf% \ 2.Excluir \ 3.Mudar data \ 4.Renomear
)
echo.
set /p vtd1=Comando:
if "%vtd1%" EQU "1" (
if "%feito%" EQU "1" goto MTF
if "%feito%" EQU "0" goto DTF
)
if "%vtd1%" EQU "2" (
attrib -h "usuarios\%nome%\agenda\%date%\%menu%.bat"
del /q "usuarios\%nome%\agenda\%date%\%menu%.bat"
if exist "usuarios\%nome%\agenda\Feito\%date%\%menu%" rd /q "usuarios\%nome%\agenda\Feito\%date%\%menu%"
echo.
echo Feito.
pause
goto Menu
)
if "%vtd1%" EQU "3" goto MD
if "%vtd1%" EQU "4" goto RT
if "%vtd%" EQU "1" (
if "%vtd1%" EQU "5" set feito=1
if "%vtd1%" EQU "5" goto Menu
)
cls
goto VTD

:MTF
md "usuarios\%nome%\agenda\Feito\%date%\%menu%"
attrib +h "usuarios\%nome%\agenda\%date%\%menu%.bat"
set feito=0
echo.
echo Feito.
pause
cls
goto VTD

:DTF
if exist "usuarios\%nome%\agenda\Feito\%date%\%menu%" rd /s /q "usuarios\%nome%\agenda\Feito\%date%\%menu%"
attrib -h "usuarios\%nome%\agenda\%date%\%menu%.bat"
set feito=1
echo.
echo Feito.
pause
cls
goto VTD

:RT
title Renomear - %tarefa%
color %cores%
echo.
echo Digite o nome que vocˆ deseja atribuir a tarefa.
echo Para voltar ao menu, digite 1.
echo.
set /p rt=Renomear:
if "%rt%" EQU "1" goto Menu
if not exist "usuarios\%nome%\Agenda\%date%\%menu%.bat" (
title ERRO
color C0
echo.
echo NÆo foi poss¡vel encontrar a tarefa espec¡ficada.
pause
goto RT
)
if exist "usuarios\%nome%\Agenda\%date%\%rt%.bat" (
title ERRO
color C0
echo.
echo J  existe uma tarefa com este mesmo nome.
pause
goto Menu
)
ren "usuarios\%nome%\Agenda\%date%\%menu%.bat" "%rt%.bat"
if exist "usuarios\%nome%\Agenda\Feito\%date%\%menu%" ren "usuarios\%nome%\Agenda\Feito\%date%\%menu%" "%rt%"
set menu=%rt%
echo.
echo Feito.
pause
cls
goto VTD

:MD
cls
echo.
echo Digite a nova data da tarefa.
echo Para voltar ao menu digite 1.
echo Ex:02/09/2002
echo.
set /p md=Data:
if "%md%" EQU "1" goto Menu
if not exist "%md%" md "usuarios\%nome%\agenda\%md%"
if exist "usuarios\%nome%\agenda\%md%\%menu%.bat" (
title ERRO
color C0
echo.
echo J  existe uma tarefa nesta data com este mesmo nome.
pause
goto MD
)
xcopy /y /h /e /i "usuarios\%nome%\agenda\%date%\%menu%.bat" "usuarios\%nome%\agenda\%md%"
if exist "usuarios\%nome%\agenda\%date%\%menu%.bat" del /q "usuarios\%nome%\agenda\%date%\%menu%.bat"
echo.
echo Feito.
pause
goto Menu

:VDE
title Visualizar dia espec¡fico
cls
echo.
echo Digite o dia que vocˆ quer visualizar.
echo Para voltar ao menu, digite 1.
echo.
set /p vde=Dia:
if "%vde%" EQU "1" goto Menu
if not exist "usuarios\%nome%\agenda\%vde%" (
title ERRO
color C0
echo.
echo Este dia nÆo ‚ v lido ou nÆo est  registrado na agenda.
pause
goto VDE
)
set date=%vde%
goto Menu

:NT
title Nova tarefa
cls
echo.
echo Preencha as informa‡äes abaixo para continuar.
echo.
set /p nt=Nome:
echo.
echo Digite "fim" para finalizar.
echo.
set /p nt21=Coment rio(linha 1/5):
if "%nt21%" EQU "fim" (
set nt22=fim
set nt23=fim
set nt24=fim
set nt25=fim
goto NT1
)
set /p nt22=Coment rio(linha 2/5):
if "%nt22%" EQU "fim" (
set nt23=fim
set nt24=fim
set nt25=fim
goto NT1
)
set /p nt23=Coment rio(linha 3/5):
if "%nt23%" EQU "fim" (
set nt24=fim
set nt25=fim
goto NT1
)
set /p nt24=Coment rio(linha 4/5):
if "%nt24%" EQU "fim" (
set nt25=fim
goto NT1
)
set /p nt25=Coment rio(linha 5/5):
if "%nt25%" EQU "fim" goto NT1

:NT1
echo.
set nt3=0
set /p nt3=Data de aviso(00/00/0000):
if "%nt3%" EQU "0" set nt3=%date%
goto NT2

:NT2
title %nt%
cls
echo.
if "%nt21%" NEQ "fim" echo %nt21%
if "%nt22%" NEQ "fim" echo %nt22%
if "%nt23%" NEQ "fim" echo %nt23%
if "%nt24%" NEQ "fim" echo %nt24%
if "%nt25%" NEQ "fim" echo %nt25%
if "%nt21%" NEQ "fim" echo.
echo Data de entrega:%nt3%
echo.
echo 1.Continuar \ 2.Voltar e corrigir informa‡äes \ 3.Cancelar
echo.
set /p nt4=Comando:
if "%nt4%" EQU "1" goto ANT
if "%nt4%" EQU "2" goto NT
if "%nt4%" EQU "3" goto Menu
goto NT2

:ANT
if exist "usuarios\%nome%\agenda\%nt3%\%nt%.bat" (
title ERRO
color C0
echo.
echo Esta tarefa j  existe.
pause
goto Menu
)
if not exist "usuarios\%nome%\agenda\%nt3%" md "usuarios\%nome%\agenda\%nt3%"
echo @echo off >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo. >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo :Menu >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo. >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo if exist "usuarios\%%nome%%\agenda\Feito\%%nt3%%\%nt%" goto Sair >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
if "%nt21%" EQU "fim" (
echo set nt21=fim>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
) ELSE (
echo.>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
)
if "%nt21%" NEQ "fim" echo echo %nt21%>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
if "%nt22%" NEQ "fim" echo echo %nt22%>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
if "%nt23%" NEQ "fim" echo echo %nt23%>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
if "%nt24%" NEQ "fim" echo echo %nt24%>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
if "%nt25%" NEQ "fim" echo echo %nt25%>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo. >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo set tarefa=%nt% >>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo.>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
echo :Sair>>"usuarios\%nome%\agenda\%nt3%\%nt%.bat"
goto Fim

:Fim
title Fim
cls
echo.
echo Feito, a tarefa "%nt%" foi criada com sucesso.
pause
goto Menu

:Feito
echo.
set feito=0
echo Esta tarefa est  marcada como feita.
call :VTD
goto Menu