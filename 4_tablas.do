************************************************************************
* PROJECT:              Bargaining power within the household: the potential role of unpaid care work
* DO-FILE NAME:         4_tablas.do
* DESCRIPTION:          Do file que prepara las tablas
************************************************************************


use ENUT4.dta, clear

cd ""
capture erase "${table_path}\results.xml"
mat empty =J(1,1,0)
xml_tab empty,  save("${table_path}\results.xml") replace sheet(Start)

*****************************Descriptivos********************************


*****************Matriz de ingresos por hora y horas diarias, solo parejas*********
preserve
expand 2, gen(dupli)
replace educ=5 if dupli==1

mat Mat_Ing_Horas= J(6,4,0)
mat  rownames Mat_Ing_Horas = none primary secondary tertiary postgrad total
mat  colnames Mat_Ing_Horas = ing_hora_M ing_hora_W horas_M horas_W
local row=1
local col=1

qui foreach educ in  0 1 2 3 4 5 {
	qui foreach wom in 0 1 {

		sum ing_lab_hora [iw=f_exp] if educ==`educ' & mujer==`wom' & miembro!=3 & edad>=10
		mat Mat_Ing_Horas[`row',`col'] =r(mean)/1000

		sum horas_total_diarias [iw=f_exp] if educ==`educ' & mujer==`wom' & miembro!=3 & edad>=10
		mat Mat_Ing_Horas[`row',`col'+2] =r(mean)


		local col= `col'+1
	}
	local col=1
	local row= `row'+1
}
mat list Mat_Ing_Horas

xml_tab Mat_Ing_Horas, save("${table_path}\results.xml") title("Descriptivos horas e ingresos") append sheet(Mat_Ing_Horas)
restore

*****************Matriz de ingresos y costos por decil*********

preserve
expand 2, gen(dupli)
replace deciles=12 if dupli==1

mat Mat_Ing_Costo= J(11,3,0)
mat  rownames Mat_Ing_Costo = 1 2 3 4 5 6 7 8 9 10 12
mat  colnames Mat_Ing_Costo = ingreso costo_rem costo_opo
local row=1
local col=1

qui foreach dec in  1 2 3 4 5 6 7 8 9 10 12 {
	qui foreach var in ing_HH CR_HH CO_HH {

		sum `var' [iw=f_exp] if deciles==`dec' & orden==1 & ing_HH>0
		mat Mat_Ing_Costo[`row',`col'] =r(mean)/1000
		local col= `col'+1
	}
	local col=1
	local row= `row'+1
}
mat list Mat_Ing_Costo

matsave Mat_Ing_Costo, p("${data_path}\matrices") dropall replace saving
xml_tab Mat_Ing_Costo, save("${table_path}\results.xml") title("ingresos y costos por decil") append sheet(Mat_Ing_Costo)

restore


*****************Matriz de pesos por miembros y tipo de familia Para Gráfica*********

preserve

expand 2, gen(dupli)
replace familia=8 if dupli==1


mat Mat_W_Miem_Fam= J(8,3,0)
mat colnames Mat_W_Miem_Fam = Man Woman Other
mat rownames Mat_W_Miem_Fam = 1_SolM_sin 2_SolW_sin 3_SolM_con 4_SolW_con 5_Par_sin 6_Par_con 7_Fam_ext 8_Tot

qui foreach miem in 1 2 3 {
	foreach fam in 1 2 3 4 5 6 7 8 {
		sum weight [iw=f_exp] if familia==`fam' &  orden==1
		scalar HH=r(sum_w)
		sum weight if familia==`fam' &  miembro==`miem' [iw=f_exp], 
		mat Mat_W_Miem_Fam[`fam',`miem'] =r(mean)*r(sum_w)/HH
	}

}

mat list Mat_W_Miem_Fam
matsave Mat_W_Miem_Fam, p("${data_path}\matrices") dropall replace saving
xml_tab Mat_W_Miem_Fam, save("${table_path}\results.xml") title("Table Matriz Pesos iniciales") append sheet(Mat_W_Miem_Fam)

restore
*****************Matriz de pesos horas dedicadas Para Gráfica*********

preserve

expand 2, gen(dupli)
replace familia=8 if dupli==1

mat Mat_h_Miem_Fam= J(8,3,0)
mat colnames Mat_h_Miem_Fam = Man Woman Other
mat rownames Mat_h_Miem_Fam = 1_SolM_sin 2_SolW_sin 3_SolM_con 4_SolW_con 5_Par_sin 6_Par_con 7_Fam_ext 8_Tot

qui foreach miem in 1 2 3 {
	foreach fam in 1 2 3 4 5 6 7 8 {
		sum weightCR [iw=f_exp] if familia==`fam' &  orden==1
		scalar HH=r(sum_w)
		sum weight_h if familia==`fam' &  miembro==`miem' [iw=f_exp], 
		mat Mat_h_Miem_Fam[`fam',`miem'] =r(mean)*r(sum_w)/HH
	}

}

mat list Mat_h_Miem_Fam
matsave Mat_h_Miem_Fam, p("${data_path}\matrices") dropall replace saving
xml_tab Mat_h_Miem_Fam, save("${table_path}\results.xml") title("Table Matriz Pesos iniciales horas") append sheet(Mat_h_Miem_Fam)

restore
*****************Matriz de pesos Costo de Reemplazo por miembros y tipo de familia Para Gráfica*********

preserve

expand 2, gen(dupli)
replace familia=8 if dupli==1

mat Mat_CR_Miem_Fam= J(8,3,0)
mat colnames Mat_CR_Miem_Fam = Man Woman Other
mat rownames Mat_CR_Miem_Fam = 1_SolM_sin 2_SolW_sin 3_SolM_con 4_SolW_con 5_Par_sin 6_Par_con 7_Fam_ext 8_Tot

qui foreach miem in 1 2 3 {
	foreach fam in 1 2 3 4 5 6 7 8 {
		sum weightCR [iw=f_exp] if familia==`fam' &  orden==1
		scalar HH=r(sum_w)
		sum weightCR if familia==`fam' &  miembro==`miem' [iw=f_exp], 
		mat Mat_CR_Miem_Fam[`fam',`miem'] =r(mean)*r(sum_w)/HH
	}

}

mat list Mat_CR_Miem_Fam
matsave Mat_CR_Miem_Fam, p("${data_path}\matrices") dropall replace saving
xml_tab Mat_CR_Miem_Fam, save("${table_path}\results.xml") title("Table Matriz Pesos sim CR") append sheet(Mat_CR_Miem_Fam)

restore

*****************Matriz de pesos Costo de Oportunidad por miembros y tipo de familia Para Gráfica*********
preserve

expand 2, gen(dupli)
replace familia=8 if dupli==1

mat Mat_CO_Miem_Fam= J(8,3,0)
mat colnames Mat_CO_Miem_Fam = Man Woman Other
mat rownames Mat_CO_Miem_Fam = 1_SolM_sin 2_SolW_sin 3_SolM_con 4_SolW_con 5_Par_sin 6_Par_con 7_Fam_ext 8_Tot

qui foreach miem in 1 2 3 {
	foreach fam in 1 2 3 4 5 6 7 8 {
		sum weightCO [iw=f_exp] if familia==`fam' &  orden==1
		scalar HH=r(sum_w)
		sum weightCO if familia==`fam' &  miembro==`miem' [iw=f_exp], 
		mat Mat_CO_Miem_Fam[`fam',`miem'] =r(mean)*r(sum_w)/HH
	}

}

mat list Mat_CO_Miem_Fam
matsave Mat_CO_Miem_Fam, p("${data_path}\matrices") dropall replace saving
xml_tab Mat_CO_Miem_Fam, save("${table_path}\results.xml") title("Table Matriz Pesos sim CO") append sheet(Mat_CO_Miem_Fam)

restore
*****************brechas de genero en ingresos baseline y simulación*********
preserve
expand 2, gen(dupli)
replace educ=5 if dupli==1

mat Mat_Gap_Educ= J(6,10,0)
mat  rownames Mat_Gap_Educ = none primary secondary tertiary postgrad total
mat  colnames Mat_Gap_Educ = ing_lab_mensual_ALL ing_lab_hora_ALL ing_total_ALL costo_reemplazo_ALL costo_oportunidad_ALL ///
							 ing_lab_mensual_COUP ing_lab_hora_COUP ing_total_COUP costo_reemplazo_COUP costo_oportunidad_COUP

local row=1
local col=1

qui foreach educ in  0 1 2 3 4 5  {
	foreach inc in ing_lab_mensual ing_lab_hora ing_total ing_total_CR2 ing_total_CO2 {

		**all members
		sum `inc' [iw=f_exp] if educ==`educ' & mujer==0 & edad>=10
		scalar male=r(mean)
		sum `inc' [iw=f_exp] if educ==`educ' & mujer==1 & edad>=10
		scalar female=r(mean)		
		mat Mat_Gap_Educ[`row',`col'] =100*(1-female/male)

		**HoH or spouse if any
		sum `inc' [iw=f_exp] if educ==`educ' & miembro<3 & familia2==2 & mujer==0 & edad>=10
		scalar male=r(mean)
		sum `inc' [iw=f_exp] if educ==`educ' & miembro<3 & familia2==2 & mujer==1 & edad>=10
		scalar female=r(mean)		
		mat Mat_Gap_Educ[`row',`col'+5] =100*(1-female/male)

		local col= `col'+1
	}
	local col=1
	local row= `row'+1
}
mat list Mat_Gap_Educ

xml_tab Mat_Gap_Educ, save("${table_path}\results.xml") title("Table Brechas de genero") append sheet(Mat_Gap_Educ)
restore

*****************Descomposición de pesos ingreso observado*********

preserve

mat Mat_W_Deco= J(3,3,0)
mat rownames Mat_W_Deco = 1_Man 2_Woman 3_Other
mat colnames Mat_W_Deco = Lab NoLab Trans 

qui foreach miem in 1 2 3 {
	local col=1
	foreach var in lab nolab trans {
		sum weight_`var'  [iw=f_exp] if orden==1
		scalar HH=r(sum_w)
		sum weight_`var' if  miembro==`miem' [iw=f_exp], 
		mat Mat_W_Deco[`miem',`col'] =r(mean)*r(sum_w)/HH
		local col= `col'+1
	}

}

mat list Mat_W_Deco
matsave Mat_W_Deco, p("${data_path}\matrices") dropall replace saving
xml_tab Mat_W_Deco, save("${table_path}\results.xml") title("Table Matriz Pesos iniciales") append sheet(Mat_W_Deco)

restore

*****************Descomposición de pesos ingreso contrafactual*********

preserve

foreach method in CR CO {
	mat Mat_W_Deco_`method'= J(3,2,0)
	mat rownames Mat_W_Deco_`method' = 1_Man 2_Woman 3_Other
	mat colnames Mat_W_Deco_`method' = RD M 

	qui foreach miem in 1 2 3 {
		local col=1
		foreach var in  RD M {
			sum weight`method'_`var'  [iw=f_exp] if orden==1
			scalar HH=r(sum_w)
			sum weight`method'_`var' if  miembro==`miem' [iw=f_exp], 
			mat Mat_W_Deco_`method'[`miem',`col'] =r(mean)*r(sum_w)/HH
			local col= `col'+1
		}

	}

	mat list Mat_W_Deco_`method'
	matsave Mat_W_Deco_`method', p("${data_path}\matrices") dropall replace saving
	xml_tab Mat_W_Deco_`method', save("${table_path}\results.xml") title("Table Matriz Pesos iniciales") append sheet(Mat_W_Deco_`method')

}

restore


