************************************************************************
* PROJECT:              Bargaining power within the household: the potential role of unpaid care work
* DO-FILE NAME:         3_simulacion.do
* DESCRIPTION:          Do file que hace simulaciones
************************************************************************

use ENUT3.dta, clear

*****************************Ingreso inicial***********************************

bys directorio secuencia_p: egen ing_HH=total(ing_total)
gen weight=ing_total/ing_HH
*ajustar pesos identicos si ing_HH es cero
bys directorio secuencia_p: egen n_miembros=count(orden)
replace weight=1/n_miembros if weight==.
**Check Weights
bys directorio secuencia_p: egen sum_W=sum(weight)
tab sum_W

foreach var in tot_inglabo ing_nolab transferencias {
	if ("`var'"=="tot_inglabo") 	local var2 "lab"
	if ("`var'"=="ing_nolab") 		local var2 "nolab"
	if ("`var'"=="transferencias") 	local var2 "trans"
	gen weight_`var2'=`var'/ing_HH
	replace weight_`var2'=(1/n_miembros)/3 if weight_`var2'==. 
}

bys directorio secuencia_p: egen sum_W_=sum(weight_lab+weight_nolab+weight_trans)
tab sum_W_
drop sum_W_
********************Horas de trabajo de cuidado no remunerado********************************

bys directorio secuencia_p: egen horas_HH=total(horas_total_mensuales)
gen weight_h=horas_total_mensuales/horas_HH
*ajustar pesos identicos si horas es cero
replace weight_h=1/n_miembros if weight_h==.
**Check Weights
bys directorio secuencia_p: egen sum_W_h=sum(weight_h)
tab sum_W_h

*****************************Simulación del costo de reemplazo********************************
bys directorio secuencia_p: egen CR_HH=total(costo_reemplazo)
*replace costo_reemplazo=costo_reemplazo*ing_HH/CR_HH if CR_HH>ing_HH
gen CR_HH_adj=min(CR_HH,ing_HH)
gen ing_total_CR=ing_total-weight*CR_HH_adj+costo_reemplazo
gen ing_total_CR1=max(ing_total_CR,0)
gen ing_total_CR2=min(ing_total_CR1,ing_HH)

bys directorio secuencia_p: egen ing_HH_CR=total(ing_total_CR2)

gen weightCR=ing_total_CR2/ing_HH_CR
*ajustar pesos identicos si ing_HH es cero

replace weightCR=1/n_miembros if weightCR==.
**Check Weights
bys directorio secuencia_p: egen sum_W_CR=sum(weightCR)
tab sum_W_CR

gen change_CR=max(ing_total_CR2-ing_total,0)
gen weightCR_RD=change_CR/ing_HH_CR
replace weightCR_RD=(1/n_miembros)/2 if weightCR_RD==.
gen weightCR_M=weightCR-weightCR_RD

bys directorio secuencia_p: egen sum_W_=sum(weightCR_RD+weightCR_M)
tab sum_W_
drop sum_W_
*****************************Simulación del costo de oportunidad********************************
bys directorio secuencia_p: egen CO_HH=total(costo_oportunidad)
*replace costo_oportunidad=costo_oportunidad*ing_HH/CO_HH if CO_HH>ing_HH
gen CO_HH_adj=min(CO_HH,ing_HH)
gen ing_total_CO=ing_total-weight*CO_HH_adj+costo_oportunidad
gen ing_total_CO1=max(ing_total_CO,0)
gen ing_total_CO2=min(ing_total_CO1,ing_HH)

bys directorio secuencia_p: egen ing_HH_CO=total(ing_total_CO2)

gen weightCO=ing_total_CO2/ing_HH_CO
*ajustar pesos identicos si ing_HH es cero

replace weightCO=1/n_miembros if weightCO==.
**Check Weights
bys directorio secuencia_p: egen sum_W_CO=sum(weightCO)
tab sum_W_CO

gen change_CO=max(ing_total_CO2-ing_total,0)
gen weightCO_RD=change_CO/ing_HH_CO
replace weightCO_RD=(1/n_miembros)/2 if weightCO_RD==.
gen weightCO_M=weightCO-weightCO_RD

bys directorio secuencia_p: egen sum_W_=sum(weightCO_RD+weightCO_M)
tab sum_W_
drop sum_W_

save ENUT4.dta, replace


