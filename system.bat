@echo off
:: Arquivo em lote
rem Comentario com comando REM

:: Estrutura em escolha
:menu

	:: Apresentacao
	cls && color A
	echo.
	echo #############################
	echo # User: %userprofile% #
	echo # Computer: %computername% #
	echo #############################
	echo.
	
	:: Opcoes
	echo [1] Verificacao de erros
	echo [2] Checagem do disco
	echo [3] Scanner
	echo [4] Melhorar inicializacao
	echo [5] Saida
	
	:: Estrutura em escolha
	choice /n /c:12345 /t 60 /d 5 /m "# Resp.: "
	
	:: Estrutura de decisao
	if %errorlevel% == 1 goto 1
	if %errorlevel% == 2 goto 2
	if %errorlevel% == 3 goto 3
	if %errorlevel% == 4 goto 4
	if %errorlevel% == 5 goto 5

	:1
		goto funcao1

	:2
		goto funcao2
		
	:3
		goto funcao3
	
	:4
		goto funcao4

	:5
		exit
		
:: FUNCOES
:funcao1
	cls && color B
	echo.
	echo ########################
	echo # Verificacao de erros #
	echo ########################
	echo.
	sfc /verifyonly && pause
	goto menu
	
:funcao2
	cls && color C
	echo.
	echo #####################
	echo # Checagem do disco #
	echo #####################
	echo.
	chkdsk && pause
	goto menu

:funcao3
	cls && color D
	echo.
	echo ###########
	echo # Scanner #
	echo ###########
	echo.
	sfc /scannow && pause
	goto menu
	
:funcao4
	cls && color D
	echo.
	echo ##################
	echo # Defragmentador #
	echo ##################
	echo.
	defrag c: /B /U && pause
	goto menu
