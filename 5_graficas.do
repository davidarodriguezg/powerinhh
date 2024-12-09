************************************************************************
* PROJECT:              Bargaining power within the household: the potential role of unpaid care work
* DO-FILE NAME:         5_grafica.do
* DESCRIPTION:          Do file que prepara las gráficas
************************************************************************


******************Gráfica 1 Hrs of unpaid work*********
use ENUT4.dta, clear

expand 2, gen(dupli)
replace familia=8 if dupli==1

label define familia 8 "Total", modify

*Keep the varlabels
foreach v in cocina mantenin_rop limpieza_hogar repar_cons_hogar abaste_hogar tramites_hogar cuid_miemb_h cuidado_otrosh  {
            local `v'_label: var label horas_diarias_`v'
}

*Collapse
collapse    (mean) horas_diarias_cocina horas_diarias_mantenin_rop horas_diarias_limpieza_hogar horas_diarias_repar_cons_hogar ///
				horas_diarias_abaste_hogar horas_diarias_tramites_hogar horas_diarias_cuid_miemb_h horas_diarias_cuidado_otrosh [aw=f_exp],  ///
				by(miembro familia) 

*Restore labels
foreach v in  cocina mantenin_rop limpieza_hogar repar_cons_hogar abaste_hogar tramites_hogar cuid_miemb_h cuidado_otrosh  {
    label var horas_diarias_`v' `"``v'_label'"'
}

*Graph
graph hbar (asis) horas_diarias_cocina horas_diarias_mantenin_rop horas_diarias_limpieza_hogar ///
		horas_diarias_repar_cons_hogar horas_diarias_abaste_hogar horas_diarias_tramites_hogar ///
		horas_diarias_cuid_miemb_h horas_diarias_cuidado_otrosh  ,  over(miembro, label(labsize(vsmall))) stack asyvars over(familia)  ///
		plotregion(fcolor(white)) graphregion(color(white)) bar(1,color("45 82 119")) bar(2,color("102 178 255")) ///
		legend(cols(3) region(lcolor(white))   )  scale(*.6) ///
		ytitle("Daily Hours") b1title(" ") nofill 
graph export "${graph_path}\Fig_1_Hours.png", replace height(7000) width(10000) 
capture graph close

******************Gráfica 2 Costos relativos al ingreso*********
use "${data_path}\matrices\Mat_Ing_Costo.dta",clear 

capture destring _rowname, gen(deciles)
label define deciles 12 "Total"  //etiquetas
label values deciles deciles

mylabels 0 10 100 1000 , myscale(log(@)) local(labels)

gen share_CR=100*costo_rem/ingreso  
gen share_CO=100*costo_opo/ingreso

list

gen l_share_CR=ln(share_CR)
gen l_share_CO=ln(share_CO)

graph bar l_share_CR l_share_CO , over(deciles, label(labsize(small)))  ylabel(`labels', labsize(small)) ///
		plotregion(fcolor(white)) graphregion(color(white)) bar(1,color("45 82 119")) bar(2,color("102 178 255")) ///
		legend(rows(1) region(lcolor(white)) size(*.8) label(1 "Replacement Cost") label(2 "Opportunity Cost") ) ///
		ytitle("Percentage of HH income (log scale)",size(*.8)) b1title("Deciles",size(*.8))
graph export "${graph_path}\Fig_2_Costs.png", replace height(7000) width(10000) 
capture graph close

******************Gráfica 3 Pesos por miembros y tipo de familia*********
clear
local graphs 
foreach graph in Mat_W_Miem_Fam Mat_h_Miem_Fam Mat_CR_Miem_Fam Mat_CO_Miem_Fam {
	if("`graph'"=="Mat_W_Miem_Fam")  local title "a) Original Income Weights"
	if("`graph'"=="Mat_h_Miem_Fam")  local title "b) Hours of Care Weights"
	if("`graph'"=="Mat_CR_Miem_Fam") local title "c) Simulated Income Weights"   
	if("`graph'"=="Mat_CO_Miem_Fam") local title "d) Simulated Income Weights"   

	if("`graph'"=="Mat_W_Miem_Fam")  local subtitle 
	if("`graph'"=="Mat_h_Miem_Fam")  local subtitle 
	if("`graph'"=="Mat_CR_Miem_Fam") local subtitle "(Replacement Cost) "   
	if("`graph'"=="Mat_CO_Miem_Fam") local subtitle "(Opportunity Cost) " 
	
	use "${data_path}\matrices\\`graph'.dta",clear 
	egen familia=group(_rowname)	
	label define familia2  1 "single man no kids" 2 "single woman no kids" 3 "single man with kids" 4 "single woman with kids" ///
	5 "couple no kids" 6 "couple with kids" 7 "extended family" 8 "Total" //etiquetas
	label values familia familia2

	drop if familia==1 | familia==2 
	expand 3
	bys familia: egen miembro=seq()
	gen     weight=Man   if miembro==1
	replace weight=Woman if miembro==2
	replace weight=Other if miembro==3 

	label define miembro 1 "Man" 2 "Woman" 3 "Other" //etiquetas
	label values miembro miembro

	graph hbar weight, over(miembro) asyvars stack  over(familia, label(labsize(small))) ///
			ylabel(, labsize(medsmall)) plotregion(fcolor(white)) graphregion(color(white)) ytitle(" ") ///
			title("`title'",size(medsmall)) subtitle("`subtitle'",size(small))  bar(1,color(black)) bar(2,color("102 178 255")) bar(3,color("45 82 119")) ///
			legend(rows(1) region(lcolor(white)) size(*.6) )	 saving("${graph_path}\\`graph'.gph", replace) 
			local graphs = `"`graphs'  "${graph_path}\\`graph'.gph""'

}

grc1leg `graphs', imargin(small)  cols(2)  graphregion(color(white)) 
graph export "${graph_path}\Fig_3_Weights.png", replace height(7000) width(10000) 
capture graph close


******************Gráfica 4 Descomposición de Pesos*********

use "${data_path}\matrices\Mat_W_Deco.dta",clear 
egen miembro=group(_rowname)

label define miembro 1 "Man" 2 "Woman" 3 "Other" //etiquetas
label values miembro miembro

graph bar Lab NoLab Trans , over(miembro) stack 								///
		legend(rows(1) region(lcolor(white)) size(*.8) 							///
			label(1 "Labour") label(2 "Non Labour") label(3 "Govt. Trans.")) 	///								
			plotregion(fcolor(white)) graphregion(color(white)) ytitle(" ") 	///	
			saving("${graph_path}\original.gph", replace) title("a) Original Income Weights") 	///			
			bar(1,color(gs12)) bar(2,color("102 178 255")) bar(3,color("45 82 119"))



foreach method in CR CO {

	if("`method'"=="CR") local title "b) Simulated Income Weights"   
	if("`method'"=="CO") local title "c) Simulated Income Weights"   
	if("`method'"=="CR") local subtitle "(Replacement Cost) "   
	if("`method'"=="CO") local subtitle "(Opportunity Cost) " 
	if("`method'"=="CR") local legend 	"off"
	if("`method'"=="CO") local legend `"label(1 "Redistribution") label(2 "Market")"' 
	use "${data_path}\matrices\Mat_W_Deco_`method'.dta",clear 
	egen miembro=group(_rowname)

	label define miembro 1 "Man" 2 "Woman" 3 "Other" //etiquetas
	label values miembro miembro

	graph bar RD M , over(miembro) stack 											///
			legend(rows(1) region(lcolor(white)) size(*.8) 							///
				`legend') 						///								
				plotregion(fcolor(white)) graphregion(color(white)) ytitle(" ") 	///			
				saving("${graph_path}\sim_`method'.gph", replace) 					///
				title("`title'") subtitle("`subtitle'",size(medsmall))				///
				bar(1,color("45 82 119")) bar(2,color("gs14")) 

}
graph combine "${graph_path}\original.gph" "${graph_path}\sim_CR.gph" 				///
				"${graph_path}\sim_CO.gph", imargin(small)  cols(1)  				///
				graphregion(color(white)) xsize(7) ysize(10)
graph export "${graph_path}\Fig_4_Decomposition.png", replace 
capture graph close

