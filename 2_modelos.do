************************************************************************
* PROJECT:              Bargaining power within the household: the potential role of unpaid care work
* DO-FILE NAME:         2_modelos.do
* DESCRIPTION:          Do file que estima los modelos para Costo de Oportunidad
************************************************************************

use ENUT2.dta, clear
*****************************Estimación del costo de reemplazo********************************

gen cocina_CR = ing_lab_hora if p6370s1==53 
egen ing_cocina_CR = median (cocina_CR)


gen mantenimiento_ropa_CR = ing_lab_hora if p6370s1==56
egen ing_mantenimiento_ropa_CR = median (mantenimiento_ropa_CR)

gen limpieza_CR = ing_lab_hora if p6370s1==54
egen ing_limpieza_CR = median (limpieza_CR)

gen reparacion_CR = ing_lab_hora if p6370s1==95
egen ing_reparacion_CR = median (reparacion_CR)

gen abastecimiento_CR = ing_lab_hora if p6370s1==37
egen ing_abastecimiento_CR = median (abastecimiento_CR)

gen tramites_CR = ing_lab_hora if p6370s1==37
egen ing_tramites_CR = median (tramites_CR)

gen servicio_cuidado_CR = ing_lab_hora if p6370s1==06 | p6370s1==07
egen ing_servicio_cuidado_CR = median (servicio_cuidado_CR)

gen traslado_CR = ing_lab_hora if p6370s1==98 
egen ing_traslado_CR = median (traslado_CR)

gen cuidado_pob_especial_CR = ing_lab_hora if p6370s1==06 | p6370s1==07
egen ing_cuidado_pob_especial_CR = median (cuidado_pob_especial_CR)

gen cuidado_otrosh_CR = ing_lab_hora if p6370s1==06 | p6370s1==07
egen ing_cuidado_otrosh_CR = median (cuidado_otrosh_CR)

gen ayuda_otrosh_CR = ing_lab_hora if p6370s1==54
egen ing_ayudar_otrosh_CR = median (ayuda_otrosh_CR)

gen costo_reemplazo = ing_cocina_CR*horas_mensual_cocina+ing_mantenimiento_ropa_CR*horas_mensual_mantenin_rop+ing_limpieza_CR*horas_mensual_limpieza_hogar+ ///
ing_reparacion_CR*horas_mensual_repar_cons_hogar+ing_abastecimiento_CR*horas_mensual_abaste_hogar+ing_tramites_CR*horas_mensual_tramites_hogar+ ///
ing_servicio_cuidado_CR*horas_mensual_servcuid_miemb_h+ing_traslado_CR*horas_mensual_traslado_hogar+ing_cuidado_pob_especial_CR+horas_mensual_cuiado_pobl_espe+ ///
ing_cuidado_otrosh_CR*horas_mensual_cuidado_a_otrosh+ing_ayudar_otrosh_CR*horas_mensual_ayuda_de_otrosh


********************Heckman employment model******************
global demograficos " c.edad##c.edad i.mujer i.educ i.rural i.region i.etnia "
global instrumentos " c.horas_diarias_cocina c.horas_diarias_mantenin_rop c.horas_diarias_limpieza_hogar c.horas_diarias_repar_cons_hogar c.horas_diarias_abaste_hogar c.horas_diarias_tramites_hogar c.horas_diarias_cuid_miemb_h c.horas_diarias_cuidado_otrosh"


*Heckman command as check
heckman ln_ing_lab_hora $demograficos if trabaja!=. , select( $demograficos $instrumentos) twostep

*Manual Heckman
probit trabaja $demograficos $instrumentos 
estimates store probit


//predict for only those in probit
predict zg if e(sample)==1, xb
gen phi=normalden(zg) 
gen PHI=normal(zg)
gen lambda=phi/PHI if trabaja==1
replace lambda=-phi/(1-PHI) if trabaja==0
label var lambda "Inverse Mills Ratio"

probit trabaja $demograficos $instrumentos 
margins, dydx(_all) atmeans post
estimates store margins_probit

*OLS model including lambda 
reg ln_ing_lab_hora lambda $demograficos
estimates store mincer

predict l_ing_hora_gorro, xb 
gen ing_hora_gorro=exp(l_ing_hora_gorro)*exp(0.5*e(rmse)^2) //prediccion ingreso por hora

outreg2 [probit margins_probit mincer] using "$est_path\models.doc", replace label


*****************************Estimación del costo de oportunidad********************************
gen costo_oportunidad = ing_hora_gorro*horas_total_mensuales // cambiar nombre a horas total, agregar _diarias



save ENUT3.dta, replace
