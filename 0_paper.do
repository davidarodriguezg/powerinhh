************************************************************************
* PROJECT:              Bargaining power within the household: the potential role of unpaid care work
* DO-FILE NAME:         0_Paper.do
* DESCRIPTION:          Do file que llama a los otros y corre todo
************************************************************************

clear all           //limpia toda la memoria
set logtype smcl    //para guardar log files en formato smcl
set more off,perm   //para que no aparezca more
set type double		//para crear variables en formato doble (mas precision con valores grandes ej millones de pesos)
set seed 1

*Ruta
global main_path "C:\Users\david\OneDrive - Universidad Externado de Colombia\David\David Academico\Proyectos\Power in HH"                     // carpeta que contiene las 5 carpetas del paper SOLO CAMBIAR ÉSTA
*Carpeta en la que esta guardada la información
global data_path "${main_path}\2_data" 	  //no cambiar	
                      //  cd= current directory

* Carpeta donde estan guardados los do-files
global do_path "${main_path}\3_program" 	//no cambiar	

*Carpeta donde ubicar los logs
global log_path "${main_path}\4_results\log" //no cambiar		

*Carpeta donde se guardaran los excel de las estimaciones
global est_path "${main_path}\4_results\est" 

*Carpeta donde guardar las gráficas
global graph_path "${main_path}\4_results\graph" 

*Carpeta donde guardar las tablas
global table_path "${main_path}\4_results\table" 

capture log close         
log using "${log_path}\Power in HH.smcl", replace  
noi display   "$S_DATE $S_TIME"  //dia y hora
cd "${data_path}"  

*Do-files a ejecutar
qui do "${do_path}\1_variables.do"   //crear variables
qui do "${do_path}\2_modelos.do"     //estimar costos
qui do "${do_path}\3_simulacion.do"  //simular pagos 
qui do "${do_path}\4_tablas.do"      //crear tablas
qui do "${do_path}\5_graficas.do"    //crear graficas 

capture log close
