@echo off

rem :: Programador: LightProgrammer000
rem :: Liguagem de Programacao: Batch Script
rem :: Descricao: Menu Profissional
rem :: Objetivo: Auxiliar nas Tarefas de Escritorio

rem Rotulo: Menu Principal
:menu_principal

rem :: Dimensao de Tela
rem :: mode 70,30

rem :: Variaveis Mutaveis
setlocal enabledelayedexpansion

	rem :: Apresentacoes Iniciais
	cls
	color A
	echo ******************************************
	echo * === Usuario: !username!
	echo * === Computador: !computername!
	echo * === Pasta de Usuario: !userprofile!
	echo * === Pasta de Usuario [Atual]: !cd!
	echo * === Data: !date:/=-!
	echo * === Hora: !time:~0,-6!
	echo ******************************************
	echo. & echo.

	rem :: Menu Principal
	echo ==========================
	echo *     MENU PRINCIPAL     *
	echo ==========================
	echo.
	echo  [1] INFORMACOES GERAIS
	echo  [2] APLICATIVOS DIVERSOS
	echo  [3] REDES E PROTOCOLOS
	echo  [4] CALCULOS DIVERSOS
	echo  [5] SCANNER
	echo  [6] EXECUTANDO PROCESSAMENTO
	echo  [7] SERVICOS
	echo  [8] MANUTENCAO E SUPORTE
	echo  [9] Saida
	echo.

	rem :: Escolha
	choice /c "123456789" /n /m "- Opcao: "

	rem :: Nivel de Erro (1,2,4,5,6,7,8,9)
	goto !errorlevel!

	rem :::::::::::::::::::::::::::::::::::::::::::::::
	rem ::::::::::::::::: SUB - MENUS :::::::::::::::::
	rem :::::::::::::::::::::::::::::::::::::::::::::::

rem ::::::::::::::::::::::::::::::::::
rem :: SUB MENU: INFORMACOES GERAIS ::
rem ::::::::::::::::::::::::::::::::::
:1
	rem :: Tela Inicial
	cls
	color B
	echo ------------------------------
	echo *     INFORMACOES GERAIS     *
	echo ------------------------------
	echo.
	echo  [1] Resumo
	echo  [2] Completo
	echo  [3] Dados da Conta
	echo  [4] Dimensoes de Tela
	echo  [5] Variaveis Padroes  [Path]
	echo  [6] Monitor de Memoria [RAM]
	echo  [7] Criacao de Usuario [Perfil Administrativo]
	echo  [8] Delecao de Contas  [Perfil Administrativo]
	echo  [9] Ativando Conta     [Administrador]
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 1
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 1
	)

	rem :: Opcao: > 9
	if !esc! gtr 9 (

		:: Retorno ao Menu Local
		goto 1
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.

	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Informacoes
		wmic timezone get caption, daylightname, standarddayofweek /format:list

		rem :: Volume
		echo ----------
		echo - Volume -
		echo ----------
		vol c:
		echo. & echo.

		rem :: Versao
		echo ----------
		echo - Versao -
		echo ----------
		ver & winver
		echo. & echo.		
	)

	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Mensagem
		echo --------------------------
		echo - Informacoes de Sistema -
		echo --------------------------
		echo.

		rem :: Sistemas
		systeminfo & echo. & echo.

		rem :: Memoria
		echo -----------
		echo - Memoria -
		echo -----------
		wmic memorychip get capacity, manufacturer /format:list

		rem :: Disco Rigido
		echo ----------------
		echo - Disco Rigido -
		echo ----------------
		wmic diskdrive get caption, size

		rem :: Processador
		echo ---------------
		echo - Processador -
		echo ---------------
		wmic cpu get caption, manufacturer, maxclockspeed, name, NumberOfCores /format:list

		rem :: Placa Mae
		echo -------------
		echo - Placa Mae -
		echo -------------
		wmic baseboard get manufacturer, product, version /format:list

		rem: Extras
		echo ----------
		echo - Extras -
		echo ----------
		wmic os get caption, freephysicalmemory, manufacturer, muilanguages, numberofprocesses, numberofusers, osarchitecture, primary, registereduser, systemdirectory, systemdrive, version /format:list
	)

	rem :: Opcao: 3
	if !esc! == 3 (

		rem :: Mensagem
		echo --------------------------
		echo - Informacoes de Usuario -
		echo --------------------------
		echo.

		rem :: Mensagem
		echo ***********
		echo *   MAC   * 
		echo ***********
		getmac & echo.

		rem :: Mensagem
		echo ************
		echo *   HOST   * 
		echo ************
		echo. & hostname & echo.

		rem :: Mensagem
		echo ************
		echo *   USER   * 
		echo ************
		echo. & quser & echo.

		rem :: Mensagem
		echo **************
		echo *   SESSAO   * 
		echo **************
		echo. & query session & echo.

		rem :: Mensagem
		echo **************
		echo *   SESSAO   * 
		echo **************
		echo. & qprocess & echo.

		rem :: Mensagem
		echo *******************
		echo *   ATUALIZACAO   * 
		echo *******************
		echo. & wmic qfe & echo.
	)

	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Configuracoes de Tela
		mode /status
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		rem :: Estrutura de Decisao
		if defined path (

			rem :: Exibicao de Dados
			echo - Variavel [path]: Existe
			echo.

			rem :: Variavel Path
			set p
			echo.

		) else (

			rem :: Exibicao de Dados
			echo - Variavel [path]: Nao Existe
			echo.
		)
	)

	rem :: Opcao: 6
	if !esc! == 6 (

		rem :: Inicializando Variavel
		set /a ciclo=0

		rem :: Rotulo
		:main
			rem :: Cores
			color 1f

			rem :: Titulo
			title Memoria RAM

			rem :1: Lista de Tarefas com Processamento de Memoria
			rem :2: Tempo para Atualizacao de 1 Segundo: timeout
			rem :3: Protecao Contra Saida de Tela: /nobreak
			timeout /t 1 /nobreak > nul

			rem :: Lista de Tarefas: /nh (Sem Cabecalhos)
			tasklist /nh > !temp!\info.txt

			rem :: Nivel de Erro: 0 (Sem Erros)
			if !errorlevel! == 0 (

				rem :: Estrutura de Repeticao: Leitura do Arquivo (Linha por Linha da 5ª Coluna)
				for /f "tokens=5" %%i in (!temp!\info.txt) do (

					rem :: Variavel
					set memoria=%%i

					rem :: Retirada do Ponto
					set memoria_tratada=!memoria:.=!

					rem :: Somatorio das Memorias
					set /a soma_memoria+=memoria_tratada
				)

			) else (

				rem :: Mensagem
				echo Processos Inexistentes !!

				rem :: Pause
				pause

				rem :: Saida
				exit
			)

			rem :: Variavel
			set /a var=soma_memoria
			set /a cont=0

			rem :: Rotulo
			:numeros
				rem :: Extracao de 1 Numero
				set num=!var:~%cont%,1!

				rem :: Se o Numero nao for Equivalente a "nada"
				if not "!num!" equ "" (

					rem :: Incremento de Contador
					set /a cont+=1

					rem :: Retornando para 'numeros'
					goto numeros
				)

				rem :: Tela Inicial
				cls
				echo ----------------------
				echo *     RESULTADOS     *
				echo ----------------------
				echo.

				rem :: >= 7 
				if !cont! geq 7 (

					rem :: <= 9
					if !cont! leq 9 (

						rem :: GigaBytes
						echo Uso da RAM: !var:~0,1!,!var:~1,2! GB	
					)
				)

				rem :: >= 4
				if !cont! geq 4 (

					rem :: <= 6
					if !cont! leq 6 (

						rem :: GigaBytes
						echo Uso da RAM: !var:~0,-3! MB	
					)
				)

				rem :: >= 1
				if !cont! geq 1 (

					rem :: <= 3
					if !cont! leq 3 (

						rem :: KiloBytes
						echo Uso da RAM: !var:~0,-3! KB	
					)
				)

				rem :: Resetando Variavel
				set /a soma_memoria=0

				rem :: Retorno ao Programa
				timeout /t 5

				rem :: Variavel
				set /a ciclo+=1

				rem :: Ciclo girou 6 vezes
				if !ciclo! == 6 (

					rem :: Delecao de Arquivo
					del /q !temp!\info.txt

					rem :: Retorno ao Menu Local
					goto 1
				)

				rem :: Retorno ao Main
				goto main
	)

	rem :: Opcao: 7
	if !esc! == 7 (

		rem :: Usuarios
		net user & echo.

		rem :: Entrada de Dados
		set /p usuario=- Digite o Usuario: 

		rem :: Criacao de Usuario
		net user !usuario! /add

		rem :: Senha
		net user !usuario! *

		rem :: Grupo de Administradores
		net localgroup Administradores !usuario! /add

		rem :: Mensagem
		cls & echo. & echo. & color A
		echo - Usuario: !usuario!
		echo - Situacao: Adicionado
	)

	rem :: Opcao: 8
	if !esc! == 8 (

		rem :: Usuarios
		net user & echo.

		rem :: Entrada de Dados
		set /p usuario=- Digite o Usuario: 

		rem :: Grupo de Administradores
		net user !usuario! /del

		rem :: Mensagem
		cls & echo. & echo. & color C
		echo - Usuario: !usuario!
		echo - Situacao: Excluido
	)

	rem :: Opcao: 9
	if !esc! == 9 (

		rem :: Usuarios
		net user & echo.

		rem :: Conta Administrativa
		net user Administrador /active:yes

		rem :: Mensagem
		cls & echo. & echo. & color C
		echo - Conta Administrativa Ativada
	)	

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retorno ao Menu Principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 1

rem ::::::::::::::::::::::::::::::::::::
rem :: SUB MENU: APLICATIVOS DIVERSOS ::
rem ::::::::::::::::::::::::::::::::::::
:2
	rem :: Tela Inicial
	cls
	color B
	echo -------------------------------
	echo *     APLICATIVOS DIVERSOS    *
	echo -------------------------------
	echo.
	echo  [1] Paint
	echo  [2] WordPad
	echo  [3] Calculadora
	echo  [4] Tela Prompt
	echo  [5] Pagina do Gooogle
	echo  [6] Limpeza de Sistema
	echo  [7] Malicious Remove Tools
	echo  [8] Gerenciador de Tarefas
	echo  [9] Inicializacao de Sistema [msconfig]
	echo  [10] Politica de Grupo Local [gpedit]
	echo  [11] Politica de Seguranca Local [secpol]
	echo  [12] Registro para Criacao de Arquivos [.bat]
	echo  [13] Ordenacao de Lista Desordenada [Ordem Alfabetica]
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 2
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 2
	)

	rem :: Opcao: > 13
	if !esc! gtr 13 (

		:: Retorno ao Menu Local
		goto 2
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.

	rem :: Opcao: 1
	if !esc! == 1 (

		:: Excecucao
		start mspaint.exe

		:: Mensagem
		echo. & echo - Paint Ativado
	)

	rem :: Opcao: 2
	if !esc! == 2 (

		:: Excecucao
		write

		:: Mensagem
		echo. & echo - WordPad Ativado	
	)

	rem :: Opcao: 3
	if !esc! == 3 (

		:: Excecucao
		start calc.exe
		
		:: Mensagem
		echo. & echo - Calculadora Ativada
	)
	
	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Exibicao
		color C & echo. & echo * Nova Tela Prompt Acionada !!

		rem :: Diretorio Raiz
		cd /

		rem :: Titulo
		title Security Screen

		rem :: Caractere Inicial
		PROMPT Security - $D - $T$G

		rem :: Abertura de Tela
		start "Security" cmd.exe
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		:: Execucao
		start iexplore.exe www.google.com.br
		
		:: Mensagem
		echo. & echo - Google....
	)

	rem :: Opcao: 6
	if !esc! == 6 (

		:: Mensagem
		echo. & echo - Ativando Limpeza...

		:: Excecucao
		cleanmgr
	)	

	rem :: Opcao: 7
	if !esc! == 7 (

		rem :: Exibicao
		echo - Malicious Remove Tools

		rem :: Executando Ferramenta
		start mrt
	)	

	rem :: Opcao: 8
	if !esc! == 8 (

		rem :: Exibicao
		echo - Gerenciador de Tarefas

		:: Excecucao
		start taskmgr.exe
	)

	rem :: Opcao: 9
	if !esc! == 9 (

		rem :: Exibicao
		echo -  Inicializacao de Sistema

		:: Excecucao
		msconfig
	)

	rem :: Opcao: 10
	if !esc! == 10 (

		rem :: Politica de Grupo Local
		echo - Politica de Grupo Local

		rem :: Excecucao
		gpedit.msc
	)	

	rem :: Opcao: 11
	if !esc! == 11 (

		rem :: Politica de Seguranca Local
		echo - Politica de Seguranca Local

		rem :: Excecucao
		gpedit.msc
	)

	rem :: Opcao: 12
	if !esc! == 12 (
	
		rem :: Criacao de Registro
		( 	
			echo Windows Registry Editor Version 5.00
			echo [HEY_CLASSES_ROOT\.bat]
			echo @="batfile"
			echo.
			echo [HKEY_CLASSES_ROOT\.bat\PersistentHandle]
			echo @="{5e941d80-bf96-11cd-b579-08002b30bfeb}"
			echo.
			echo [HKEY_CLASSES_ROOT\.bat\ShellNew]
			echo "NullFile"=""
			echo "Data"="@Echo off"

		) > !temp!\reg.reg

		rem :: Delecao
		cd !temp! & reg.reg & del /q reg.reg
	)

	rem :: Opcao: 13
	if !esc! == 13 (

		rem :: Entrada de Dados no Arquivo
		set /p lista=- Arraste para aqui sua Lista: 

		rem :: Protecao
		if not defined lista (

			rem :: Retorno ao Menu Local
			goto 2		
		)

		rem :1: Lista em Ordem Alfabetica: sort
		rem :2: Entrada de Dados < :: Saida de Dados >
		sort < !lista! > Lista_Alfabetica.txt

		rem :: Exibicao de Dados (5 Segundos)
		cls & echo. & echo - Lista processando.....
		timeout /t 5
	)

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retorno ao Menu Principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 2

rem :: ::::::::::::::::::::::::::::::::::
rem :: :: SUB MENU: REDES E PROTOCOLOS ::
rem :: ::::::::::::::::::::::::::::::::::
:3
	rem :: Tela Inicial
	cls
	color B
	echo ------------------------------
	echo *     REDES E PROTOCOLOS     *
	echo ------------------------------
	echo.
	echo  [1] IP
	echo  [2] ARP
	echo  [3] DNS
	echo  [4] PING
	echo  [5] ROUTE
	echo  [6] NETSTAT
	echo  [7] TRACERT
	echo  [0] Menu Principal
	echo.
	
	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 3
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 3
	)

	rem :: Opcao: > 7
	if !esc! gtr 7 (

		:: Retorno ao Menu Local
		goto 3
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.

	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Exibicao de Dados (Sem Quebra de Linha)
		echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		set /p a=- IP < nul
		set /p b=Protoloco < nul
		echo.
		echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		echo. & echo.

		rem :: IP v4: Encontrando sem Distincao de Letras Maiusculas ou Minusculas
		echo ----------------------------------------------------------------
		ipconfig | find /i "ipv4"
		echo ----------------------------------------------------------------
		echo. & echo.

		rem :: IP v6: Encontrando sem Distincao de Letras Maiusculas ou Minusculas
		echo ------------------------------------------------------------------
		ipconfig | find /i "ipv6"
		echo ------------------------------------------------------------------
		echo. & echo.

		rem :: Variaveis
		set a=- IP
		set b=Protoloco Total
		set conc=!a! !b!

		rem :: Concatenacao [Sem Pulo]
		echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		echo !conc!
		echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

		rem :: Variavel com Comando
		set c=ipconfig /all
		echo.

		rem :: Comando: ipconfig /all
		!c!

		rem :: Tela 
		echo. & echo.
		echo ---------------------------
		echo *   Deseja Renovar o IP   *
		echo ---------------------------
		echo  [1] Sim
		echo  [2] Nao
		echo.
		set /p opc=- Opcao: 
		echo.

		rem :: Opcao: 1
		if !opc! == 1 (

			rem :: Liberando IP
			ipconfig /release

			rem :: Renovando
			ipconfig /renew
		
		) else (

			rem :: Retorno ao Menu Local
			goto 3
		)
	)

	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Variaveis
		set a=- ARP
		set b=Protoloco
		set conc=!a! !b!

		rem :: Concatenacao: Sem Quebra de Linha
		echo ------------------------------------------------------------------
		echo !conc!
		echo ------------------------------------------------------------------

		rem :: Variavel com Comandos
		set c=arp /a
		echo.

		rem :: Comando: arp /a
		!c!
	)
	
	rem :: Opcao: 3
	if !esc! == 3 (

		rem :: Variaveis
		set a=- DNS
		set conc=!a!

		rem :: Concatenacao: Sem Quebra de Linha
		echo ------------------------------------------------------------------
		echo !conc!
		echo ------------------------------------------------------------------
		echo.

		rem :: Dados de DNS
		ipconfig /displaydns | more
		echo ------------------------------------------------------------------
		echo. & echo. & pause

		rem :: Tela
		:limp_dns
			echo ----------------------
			echo *   Limpeza de DNS   *
			echo ----------------------
			echo  [1] Sim
			echo  [2] Nao
			echo.
			set /p limpeza=- Deseja Limpar o DNS: 
			echo.
			
			if not defined limpeza (
			
				rem ::
				cls
				goto limp_dns
			)

			rem :: Opcao: 1
			if !limpeza! == 1 (

				rem :: Limpeza de DNS
				ipconfig /flushdns
			
			) else (

				rem :: Retorno ao Menu Local
				goto limp_dns
			)
	)

	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Variaveis
		set a=- PING
		set conc=!a!

		rem :: Concatenacao: Sem Quebra de Linha
		echo ------------------------------------------------------------------
		echo !conc!
		echo ------------------------------------------------------------------
		echo.

		rem :: Comandos
		set /p png=- Digite o site [Ex: www.google.com.br]: 
		echo.
		
		if not defined png (
			
			rem :: Retorno ao Menu Local
			goto 3
		)

		ping !png! -4
		echo ------------------------------------------------------------------
		echo. & echo.
		
		ping !png!
		echo ------------------------------------------------------------------
		echo. & echo.
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		rem :: Variaveis
		set a=- ROUTE
		set conc=!a!

		rem :: Concatenacao: Sem Quebra de Linha
		echo ------------------------------------------------------------------
		echo !conc!
		echo ------------------------------------------------------------------
		echo.

		rem :: Rotas
		route print
		echo ------------------------------------------------------------------
		echo. & echo.
	)

 rem :: Opcao: 6
	if !esc! == 6 (

		rem :: Variaveis
		set a=- NETSTAT
		set conc=!a!

		rem :: Concatenacao: Sem Quebra de Linha
		echo ------------------------------------------------------------------
		echo !conc!
		echo ------------------------------------------------------------------
		echo.

		rem :: Variavel com Comandos
		set c=netstat /n
		set d=netstat /e /s
		echo.

		rem :: Comandos
		!c! & echo.
		echo ------------------------------------------------------------------
		
		!d! & echo.
		echo ------------------------------------------------------------------
	)

	rem :: Opcao: 7
	if !esc! == 7 (

		rem :: Variaveis
		set a=- TRACERT
		set conc=!a!

		rem :: Concatenacao: Sem Quebra de Linha
		echo ------------------------------------------------------------------
		echo !conc!
		echo ------------------------------------------------------------------
		echo.

		rem :: Comandos
		set /p trac=- Digite o site [Ex: www.google.com.br]: 

		rem :: Protecao
		if not defined trac (

			rem :: Retorno ao Menu Principal
			goto 3
		)	

		rem :: Rastreamento
		tracert !trac!
		echo ------------------------------------------------------------------
		echo. & echo.
	)

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retorno ao Menu Principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 3

rem :: :::::::::::::::::::::::::::::::::
rem :: :: SUB MENU: CALCULOS DIVERSOS ::
rem :: :::::::::::::::::::::::::::::::::
:4
	rem :: Tela Inicial
	cls
	color B
	echo -----------------------------
	echo *     CALCULOS DIVERSOS     *
	echo -----------------------------
	echo.
	echo  [1] Tabuada
	echo  [2] Operacoes Matematicas
	echo  [3] WordList Numerica
	echo  [4] Lista Numerica [Pares e Impares]
	echo  [5] Contando Caracteres
	echo  [6] Tipagem de Caracteres
	echo  [7] Analisando Arquivos
	echo  [8] Analisando Letras [Maiusculas, Minusculas e Numeros]
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 4
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 4
	)

	rem :: Opcao: > 8
	if !esc! gtr 8 (

		:: Retorno ao Menu Local
		goto 4
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.

	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Entrada de Dados
		set /p n=- Digite Numero: 

		rem :: Protecao
		if not defined n (

			rem :: Retorno ao Menu Local
			goto 4
		)

		rem :: Estrutura de Repeticao
		for /l %%i in (0, 1, 10) do (

			rem :: Calculos
			set /a tab=%%i * !n!

			rem :: Exibicao
			echo. & echo - %%i x !n! = !tab!
		)
	)

	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Entrada de Dados
		set /p n1=- Digite N1: 
		set /p n2=- Digite N2: 

		rem :: Protecao
		if not defined n1 (

			rem :: Retorno ao Menu_Local
			goto 4
		)

		rem :: Protecao
		if not defined n2 (

			rem :: Retorno ao Menu_Local
			goto 4
		)

		rem :: Calculos
		set /a soma=!n1! + !n2!
		set /a subtracao=!n1! - !n2!
		set /a multiplicacao=!n1! * !n2!
		set /a divisao=!n1! / !n2!
		set /a modulo=!n1! %% !n2!

		rem :: Saida de Dados
		echo.
		echo --------------------------------
		echo - Soma: !soma!
		echo - Subtracao: !subtracao!
		echo - Multiplicacao: !multiplicacao!
		echo - Quoeciente Inteiro: !divisao!
		echo - Resto da Divisao: !modulo!
		echo --------------------------------
		echo.
	)

	rem :: Opcao: 3
	if !esc! == 3 (

		rem :: Entrada de Dados
		set /p num_ini=- Digite o Numero Inicial: 
		set /p num_fin=- Digite o Numero Final: 
		set /p razao=- Digite a Razao: 

		rem :: Protecao
		if not defined num_ini (

			rem :: Retorno ao Menu Local
			goto 4
		)

		rem :: Protecao
		if not defined num_fin (

			rem :: Retorno ao Menu Local
			goto 4
		)

		rem :: Protecao
		if not defined razao (

			rem :: Retorno ao Menu Local
			goto 4
		)

		rem :: Mensagem
		echo. & echo - Processando ..... & echo.

		rem :: Estrutura de Repeticao: Progressao Aritmetica
		for /l %%i in (!num_ini!, !razao!, !num_fin!) do (

			rem :: Relatorio: Saida de Dados
			echo %%i >> Lista_Numerica.txt
		)

		rem :: Mensagem: Encerramento
		cls. & echo. & color D & echo.
		echo ********************** 
		echo * Processo Terminado *
		echo **********************
		echo.
	)

	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Variaveis
		set Lista_Par=
		set Lista_Impar=

		rem :: Entrada de Dados
		set /p num=- Digite N: 

		rem :: Estrutura de Decisao: Protecao
		if not defined num (

			rem :: Retorno ao Menu_Local
			goto 4
		)

		rem :: Estrutura de Repeticao
		for /l %%i in (0, 1, !num!) do (

			rem :: Calculo do Modulo [Resto da Divisao]
			set /a calc=%%i%%2

			rem :: Estrutura de Decisao
			if !calc! == 0 (

				rem :: Lista de Pares
				set Lista_Par=!Lista_Par! - %%i

			) else (

				rem :: Lista de Impares
				set Lista_Impar=!Lista_Impar! - %%i
			)
		)

		rem :: Retirada dos 2 Primeiros Caracteres
		echo.
		echo - Lista de Pares: !Lista_Par:~2!

		rem :: Retirada dos 2 Primeiros Caracteres
		echo.
		echo - Lista de Impares: !Lista_Impar:~2!
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		rem :: Contagem de Caracteres
		set /a cont=0

		rem :: Contagem de Espacos
		set /a espc=0

		rem :: Entrada de Dados
		set /p nome=- Digite uma Palavra ou Frase: 

		rem :: Rotulo Interno
		:Letras
			rem :: Variavel: Extracao de Letras
			set letra=!nome:~%cont%,1!

			rem :: Variavel sem Definicao
			if not defined nome (

				rem :: Retorno ao Menu Local
				goto 4
			)

			rem :: Espaco: Vazio
			if "!letra!" equ " " (

				rem :: Incrementador: Espaco Vazio
				set /a espc+=1
			)

			rem :: Se a 'Extracao de Letra' ainda tiver Caractere
			if not "!letra!" equ "" (

				rem :: Incrementador: Letras
				set /a cont+=1

				:: Retorno a Letras
				goto Letras
			)

			rem :: Calculo de Caracteres
			set /a carc=!cont! - !espc!

			rem :: Mensagem: Encerramento
			cls &  color F & echo. & echo.
			echo ********************** 
			echo * Processo Terminado *
			echo **********************
			echo.

			rem :: Nome
			echo - Nome: !nome!

			rem :: Espaco
			echo - Espaco: !espc!

			rem :: Caracteres
			echo - Caracteres: !carc!	
	)

	rem :: Opcao: 6
	if !esc! == 6 (

		rem :: Variaveis
		set /a let=0
		set /a num=0

		rem :: Entrada de Variaveis
		set /p frase=- Digite uma frase: 

		:Frase
			rem :: Protecao
			if not defined frase (

				rem :: Fluxo para Frase
				goto Analise_Frase
			)

			rem :1: Capturando Letra por Letra
			rem :2: Ex: (t)este --> Error Level = 0
			rem :3: Ex: t(e)ste --> Error Level = 0
			rem :4: Ex: te(s)te --> Error Level = 0
			rem :5: Ex: tes(t)e --> Error Level = 0
			rem :6: Ex: test(e) --> Error Level = 0
			set /a caractere=!frase:~0,1!

			rem :: Estrutura de Decisao: Nivel de Erro == 0
			if !caractere! == 0 (

				rem :: Flag: Letra
				set /a let=1

			) else (

				rem :: Flag: Numero
				set /a num=1
			)

			rem :1: Retirada de 1 Caractere da Frase [Esquerda -> Direita] ::
			rem :2: Ex: (t)este --> (t)
			rem :3: Ex: t(e)ste --> (e)
			rem :4: Ex: te(s)te --> (s)
			rem :5: Ex: tes(t)e --> (t)
			rem :6: Ex: test(e) --> (s)
			set frase=!frase:~1!

			rem :: Retornando a Funcao 'Frase'
			goto Frase

		rem :: Rotulo
		:Analise_Frase
			rem :: Mensagem: Encerramento
			cls & color D & echo. & echo.
			echo ********************** 
			echo * Processo Terminado *
			echo **********************
			echo.

			rem :: Resultados
			if !num!!let! == 00 (

				echo - Vazio
				echo.
			)

			rem :: Resultados
			if !num!!let! == 01 (

				echo - Alfabetico
				echo.
			)

			rem :: Resultados
			if !num!!let! == 10 (

				echo - Numerico
				echo.
			)

			rem :: Resultados
			if !num!!let! == 11 (

				echo - AlfaNumerico
				echo.
			)
	)
	
	rem :: Opcao: 7
	if !esc! == 7 (

		:: Entrada de Dados
		set /p arquivo=* Arraste o Arquivo para a Tela: 

		:: Tela Final
		color E
		cls
		echo ------------------------
		echo *     PROPRIEDADES     *
		echo ------------------------
		echo.

		:: Chamada de Procedimento
		call :var !arquivo!

		:var
			echo - Nome: %~n1				& rem n: Nome 
			echo - Unidade: %~d1			& rem d: Unidade
			echo - Tamanho: %~z1 			& rem z: Tamanho
			echo - Extensao: %~x1	 		& rem x: Extensao
			echo - Caminho: %~p1	 	 	& rem p: Caminho
			echo - Caminho Total: %~dpnx1 	& rem dpnx: Caminho Total 
			echo - Data: %~t1				& rem t: Data
	)

	rem :: Opcao: 8
	if !esc! == 8 (

		rem :: Variaveis
		set min=0
		set mai=0

		rem :: Entrada de Dados
		set /p arg=- Digite uma Palavra ou Frase: 

		rem :: Protecao Inicial: Sem Nenhum Argumento
		if not defined arg (

			rem :: Retorno ao Menu Local
			goto 4
		)

		rem :: Rotulo
		:Analisando_Letra
			rem :1: Analisando Letra:
			rem :2: Ex: Palavra "Teste": (T) (e) (s) (T) (e)
			set letra=!arg:~0,1!

			rem :: Localizando se "letra" esta -> abcdefghijklmnopqrstuvwxyz
			echo "!letra!" | findstr /r [abcdefghijklmnopqrstuvwxyz] > nul

			rem :: Sem Erro: Letra Minusculas
			if !errorlevel! == 0 (

				rem :: Letras Minusculas
				set /a min=1

			) else (

				rem :: Letras Maiusculas ou Numeros
				set /a mai=1
			)

			rem :1: Retirando 1 Caractere :::::::::::::::::::
			rem :2: Palavra Teste: (T) - (e) - (s) - (t) - (e)
			rem :3: Palavra Teste: (X) - (e) - (s) - (t) - (e)
			rem :4: Palavra Teste: (X) - (X) - (s) - (t) - (e)
			rem :5: Palavra Teste: (X) - (X) - (X) - (t) - (e)	
			rem :6: Palavra Teste: (X) - (X) - (X) - (X) - (e)
			rem :7: Palavra Teste: (X) - (X) - (X) - (X) - (X)
			set arg=!arg:~1!

			rem :: Acabando as Letras: Ir o "end"
			if "!arg!" equ "" (

				goto Apresentacao_Letra
			)

			rem :: Retornando a Funcao Analisando_Letra
			goto Analisando_Letra

		rem :: Rotulo
		:Apresentacao_Letra
			if !min!!mai! == 00 (

				echo. & echo. & echo :: Resultado:
				echo. & echo - Impossivel analisar
			)

			if !min!!mai! == 10 (

				echo. & echo. & echo :: Resultado:
				echo. & echo - Letras Minusculas
			)

			if !min!!mai! == 01 (

				echo. & echo. & echo :: Resultado:
				echo. & echo - Letras Maiusculas e/ou Caracteres
			)

			if !min!!mai! == 11 (

				echo. & echo. & echo :: Resultado:
				echo. & echo - Letras Maiusculas, Minusculas e/ou Caracteres
			)
	)
	
	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retorno ao Menu Principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 4

rem :: :::::::::::::::::::::::
rem :: :: SUB MENU: SCANNER ::
rem :: :::::::::::::::::::::::
:5
	rem :: Tela Inicial
	cls
	color B
	echo --------------------
	echo *     SCANNER      *
	echo --------------------
	echo.
	echo  [1] Procurando Pastas
	echo  [2] Procurando Arquivos e Diretorios
	echo  [3] Procurando Arquivos [Por Extensao]
	echo  [4] Procurando por Tarefas [Sem Extensao]
	echo  [5] Localizando Caracteres em Arquivos [.txt .exe]
	echo  [6] Localizando Erros no Disco Rigido
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 5
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 5
	)

	rem :: Opcao: > 6
	if !esc! gtr 6 (

		rem :: Retorno ao Menu Local
		goto 5
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.

	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Entrada de Dados
		set /p pasta=- Digite o Nome da Pasta: 

		rem :: Protecao
		if not defined pasta (

			rem :: Retornando a Menu Local
			goto 5
		)

		rem :: Estrutura de Repeticao: Procurando Pastas
		for /d %%i in (*) do (

			rem :: Estrutura de Decisao: /i (Sem Distincao de Caractere)
			if /i "%%i" equ "!pasta!" (

				rem :: Encontrando Pastas e seu Caminho
				color A & echo. & echo.
				echo - Pasta: !Pasta!
				echo - Caminho: %%~fi 
				echo - Situacao: Encontrada !!
				echo.

				rem :: Pause e Retornando Menu Local
				pause & goto 5
			)
		)

		rem :: Encontrando Pastas e seu Caminho
		color C & echo.
		echo - Pasta: !Pasta!
		echo - Situacao: Nao Encontrada !!
		echo.
	)

	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Relatorio
		dir /b > !temp!\dir.txt

		rem :: Entrada de Dados
		set /p proc=- Digite o Arquivo ou Diretorio a ser Encontrado: 

		rem :1: Ver Arquivo de Texto na Tela de Comando: type 
		rem :2: Encontrar Arquivo: find /i /n
		echo. & type !temp!\dir.txt | find /i /n "!proc!"

		rem :: Delecao de Arquivo
		del /q !temp!\dir.txt
	)

	rem :: Opcao: 3
	if !esc! == 3 (

		rem :: Entrada de Dados
		set /p ext=- Digite a Extensao: 

		rem :: Protecao
		if not defined ext (

			rem :: Retornando a Menu Local
			goto 5
		)

		rem :1: Estrutura de Repeticao
		rem :2: Listagem de Pastas e Subpastas: /r
		echo.
		for /r %%i in ( *.!ext! ) do (

			rem :: Exibicao de Dados
			color C & echo. & echo. & echo - Procurando...
			echo - Arquivo: %%i
			echo. & pause
		)
	)

	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Lista de Tarefas
		tasklist

		rem :: Entrada de Dados
		echo.
		set /p tarf=- Digite a Tarefa [Sem Extensao]: 

		rem :: Protecao
		if not defined tarf (

			rem :: Retornando a Menu Local
			goto 5
		)

		rem :: Lista de Tarefas Filtradas por Nome
		set proc=tasklist /fi "imagename eq !tarf!.exe" /fo table

		rem :: Executando Comando
		echo.
		echo +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		!proc!
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		rem :: Configuracoes
		color C
		title Localizacao

		rem :: Variavel
		set /a rstd=0

		rem :1: Verificacao da Existencia de Arquivo
		rem :2: Arquivo: arq.txt
		if exist !temp!\arq.txt (

			:: Delecao
			del /f /q !temp!\arq.txt
		)

		rem :: Arquivo: result.txt
		if exist !temp!\result.txt (

			:: Delecao
			del /f /q !temp!\arq.txt	
		)

		rem :: Arquivo: linhas.txt
		if exist !temp!\linhas.txt (

			:: Delecao
			del /f /q !temp!\linhas.txt
		)

		echo. & echo.

		rem :: Entrada de Dados: String
		set /p string=- Digite^> 

		rem :: Titulo
		title LOCALIZANDO...

		rem :: Procurando: Pastas e SubPastas
		for /r %%i in (*.txt *.exe) do (

			rem :: Encontrando "string" dentro de cada Arquivo Pesquisado
			find /n /i "!string!" %%i > !temp!\arq.txt

			rem :: Identificando o Numero da Linha da Ocorrencia
			find /i "[" !temp!\arq.txt

			rem :: Nivel de Erro: 0 (Sem Erros)
			if !errorlevel! == 0 (

				rem :: Ler Arquivo e Salvar: "result.txt"
				type !temp!\arq.txt >> !temp!\result.txt

				rem :: Incrementando Resultado
				set /a rstd+=1
			)
		)

		rem :: Mensagem
		cls
		type !temp!\result.txt | more

		rem :: Menu Opcao
		echo. & echo. & echo.
		echo  - Voltar -
		echo  [s] SIM
		echo  [n] NAO
		echo.
		choice /c "s" /n /m "-Opc: "

		:s
			goto 5
	)

	rem :: Opcao: 6
	if !esc! == 6 (

		:: Tela Inicial
		cls
		color E
		echo ====================
		echo *     Scanning     *
		echo ====================
		echo.
		cd /

		:: Scanner
		sfc /scannow

		:: Funcao
		chkdsk
	)

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retornando ao menu_principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 5

rem ::::::::::::::::::::::::::::::::::::::::
rem :: SUB MENU: EXECUTANDO PROCESSAMENTO ::
rem ::::::::::::::::::::::::::::::::::::::::
:6
	rem :: Tela Inicial
	cls
	color B
	echo ------------------------------------
	echo *     EXECUTANDO PROCESSAMENTO     *
	echo ------------------------------------
	echo.
	echo  [1] Lista Total de Tarefas
	echo  [2] Analisando Processo [1 PID]
	echo  [3] Encerrando Processo [1 PID]
	echo  [4] Encerrando Tarefa [Com Extensao]
	echo  [5] Encerrando Tarefas [Sem Extensao]	
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		rem :: Retornando ao Menu Local
		goto 6
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (
	
		:: Retorno ao Menu Local
		goto 6
	)

	rem :: Opcao: > 5
	if !esc! gtr 5 (
	
		:: Retorno ao Menu Local
		goto 6
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.
	
	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Lista de Tarefas
		tasklist & echo.
	)
	
	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Lista de Tarefas
		wmic process get name, processid & echo.

		rem :: Entrada de Dados
		set /p pid=- Analisando Processo [1 PID]: 

		rem :: Lista de Tarefas Filtradas por Processos
		echo. & echo - Lista & cls
		echo. & tasklist /fi "pid eq !pid!" /fo list & echo.

		rem :1: gt: >
		rem :2: eq: ==
		echo. & tasklist /fi "pid eq !pid!" /fo csv & echo.
	)

	rem :: Opcao: 3
	if !esc! == 3 (

		rem :: Lista de Tarefas
		wmic process get name, processid & echo.

		rem :: Entrada de Dados
		set /p pid=- Encerrando Processo [1 PID]: 

		rem :: Encerrando Processo
		taskkill /pid "!pid!" & echo.
	)
	
	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Lista de Tarefas
		tasklist & echo.

		rem :: Entrada de Dados
		set /p tarefas=- Encerrando Tarefa [Com Extensao]: 

		rem :: Encerrando Tarefas
		taskkill /f /t /fi "imagename eq "!tarefas!" "
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		rem :: Lista de Tarefas
		tasklist & echo.

		rem :: Entrada de Dados
		set /p tarefas=- Encerrando Tarefas [Sem Extensao]: 

		rem :: Encerrando Tarefas (Sem Extensao)
		tskill /a /v "!tarefas!"
	)	

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retornando ao menu_principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 6
	
rem ::::::::::::::::::::::::
rem :: SUB MENU: SERVICOS ::
rem ::::::::::::::::::::::::
:7
	rem :: Tela Inicial
	cls
	color B
	echo --------------------
	echo *     SERVICOS     *
	echo --------------------
	echo.
	echo  [1] Analise de Servicos
	echo  [2] Inicializacao de Servicos
	echo  [3] Configuracao de Servicos
	echo  [4] Delecao de Servicos
	echo  [5] Criando Tarefas Agendadas [Teste]
	echo  [6] Excluindo Tarefa Agendada [Teste]
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	rem :: Protecao de Escolha
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 7
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 7
	)

	rem :: Opcao: > 6
	if !esc! gtr 6 (

		:: Retorno ao Menu Local
		goto 7
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.
	
	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Mensagem
		echo - Analisando Servicos

		rem :: Servicos
		services.msc
	)
	
	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Criacao de Pasta e Mudanca de Diretorio
		mkdir !userprofile!\Inicia
		cd !userprofile!\Inicia

		rem :: Criacao de Arquivo ".bat"
		echo tree >> Painel.bat

		rem :: Criando Servico
		sc create Inicia type= own start= auto displayname= "!usename!" binpath="!userprofile!\Inicia\Painel.bat"

		rem :: Iniciando Servico
		sc query Inicia
	)

	rem :: Opcao: 3
	if !esc! == 3 (
	
		:: Entrada de Dados
		set /p servico=- Digite o Novo Nome do Servico: 

		:: Mudanca o Nome do Servico
		sc config Inicia displayname= "!servico!"
	)

	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Excluido Pasta
		rd /s /q !userprofile!\Inicia 

		:: Delete Servico
		sc delete Inicia
	)

	rem :: Opcao: 5
	if !esc! == 5 (

		rem :: Criando Arquivo .bat
		echo tree > !userprofile!\Teste.bat

		rem :: Tarefa Agendada
		schtasks /create /sc minute /mo 1 /tn "Teste" /tr "!userprofile!\Teste.bat"

		rem :: Mensagem
		cls & echo. & echo.	
		echo - Tareta: Teste
		echo - Tarefa Agendada
	)

	rem :: Opcao: 6
	if !esc! == 6 (

		rem :: Lista de Tarefas Agendadas
		schtasks

		rem :: Comando
		schtasks /f /delete /tn "Teste"

		rem :: Mensagem
		cls & echo. & echo.	
		echo - Tareta: Teste
		echo - Tarefa Excluida
	)

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retornando ao menu_principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 7

rem ::::::::::::::::::::::::::::::::::::
rem :: SUB MENU: MANUTENCAO E SUPORTE ::
rem ::::::::::::::::::::::::::::::::::::
:8
	rem :: Tela Inicial
	cls
	color B
	echo --------------------------------
	echo *     MANUTENCAO E SUPORTE     *
	echo --------------------------------
	echo.
	echo  [1] Opcoes de Pasta
	echo  [2] Alteracao de Data
	echo  [3] Icones de Sistema
	echo  [4] Painel de Controle
	echo  [5] Programas e Recursos
	echo  [6] Propriedades do Mouse
	echo  [7] Mudando Nome do Disco Rigido
	echo  [8] Criar Unidade de Disco Virtual
	echo  [9] Deletar Unidade de Disco Virtual
	echo  [0] Menu Principal
	echo.

	rem :: Escolha
	set /p esc=- Opcao: 

	rem :::::::::: PROTECAO ::::::::::
	if not !errorlevel! == 0 (

		:: Retornando ao Menu Local
		goto 8
	)

	rem :: Opcao: < 0
	if !esc! lss 0 (

		:: Retorno ao Menu Local
		goto 8
	)

	rem :: Opcao: > 9
	if !esc! gtr 9 (

		:: Retorno ao Menu Local
		goto 8
	)
	rem ::::::::::::::::::::::::::::::

	rem :: Tela Intermediaria
	cls
	color E
	echo ----------------------
	echo *     RESULTADOS     *
	echo ----------------------
	echo.

	rem :: Opcao: 1
	if !esc! == 1 (

		rem :: Mensagem
		echo - Opcoes de Pasta

		rem :: Comando: Opcoes de Pasta
		rundll32 shell32.dll, Options_RunDLL
	)

	rem :: Opcao: 2
	if !esc! == 2 (

		rem :: Mensagem
		echo - Alteracao de Datas

		rem :: Comando: Datas
		rundll32 shell32.dll, Control_RunDLL timedate.cpl
	)	

	rem :: Opcao: 3
	if !esc! == 3 (

		rem :: Mensagem
		echo - Icones de Sistema		

		rem :: Comandos: Icones de Sistemas
		rundll32 shell32.dll, Control_RunDLL desk.cpl,,
	)

	rem :: Opcao: 4
	if !esc! == 4 (

		rem :: Mensagem
		echo - Painel de Controle

		rem :: Painel de Controle
		rundll32 shell32.dll, Control_RunDLL
	)

	rem :: Opcao: 5
	if !esc! == 5 (
	
		rem :: Mensagem
		echo - Programas e Recursos

		rem :: Comandos: Programas e Recursos
		rundll32 shell32.dll, Control_RunDLL appwiz.cpl
	)
	
	rem :: Opcao: 6
	if !esc! == 6 (
	
		rem :: Mensagem
		echo - Propriedades do Mouse

		rem :: Comandos: Propriedades do Mouse
		rundll32 shell32.dll, Control_RunDLL main.cpl
	)

	rem :: Opcao: 7
	if !esc! == 7 (
		
		rem :: Entrada de Dados
		set /p hd=- Digite Unidade de Volume: 
		label c: !hd!
	)
	
	rem :: Opcao: 8
	if !esc! == 8 (
		
		rem :: Mensagem
		echo - Particoes
		
		rem :: Comandos
		subst & echo.
		
		rem :: Entrada de Dados
		set /p vol=Digite a Letra do Volume: 

		rem :: Criacao de Particao para a Area de Trabalho
		subst !vol!: !userprofile!\desktop
	)

	rem :: Opcao: 9
	if !esc! == 9 (
		
		rem :: Particoes
		subst & echo.
		
		rem :: Entrada de Dados
		set /p vol=Digite a Letra do Volume: 

		rem :: Deletar de Particao para a Area de Trabalho
		subst /d !vol!:
	)

	rem :: Opcao: 0
	if !esc! == 0 (

		rem :: Retornando ao menu_principal
		goto menu_principal
	)

	rem :: Pause
	echo. & pause

	rem :: Retorno ao Menu Local
	goto 8
	
rem :: Saida
:9
	rem :: Mensagem
	rem :: msg /w * "O Script Sera Encerrado !!"
	exit

endlocal
