************************************************************************
* PROJECT:   Bargaining power within the household: the potential role of unpaid care work
* DO-FILE NAME:  1_variables.do
* DESCRIPTION:  Do file que crea las variables necesarias
************************************************************************


use "ENUT.dta", clear 

drop if p425>=9 //empleado(a) del servicio dom�stico u otro no pariente

*****************************Horas de trabajo de Cuidado No Remunerado********************************

*preparar y servir alimentos 
gen preparar_servir_alimentos = p1143s1a1 + p1143s1a2/60
replace preparar_servir_alimentos = 0 if preparar_servir_alimentos ==. & p6040>=10

*lavar platos 
gen lavar_platos = p1143s2a1 +p1143s2a2/60
replace lavar_platos = 0 if lavar_platos ==. & p6040>=10

*preparar conservas 
gen preparar_conservas= p1143s3a1 +p1143s3a2/60
replace preparar_conservas  = 0 if preparar_conservas ==. & p6040>=10

*llevar comida al trabajo o sitio de estudio 
gen llevar_comida = p1143s4a1 + p1143s4a2/60
replace llevar_comida = 0 if llevar_comida  ==. & p6040>=10

*lavar, planchar 
gen lavar_planchar = p1142s1a1 +p1142s1a2/60
replace lavar_planchar  = 0 if lavar_planchar  ==. & p6040>=10

*reparar ropa 
gen reparar_ropa = p1142s2a1 +p1142s2a2/60
replace reparar_ropa = 0 if reparar_ropa ==. & p6040>=10

*elaborar ropa 
gen elaborar_ropa = p1142s3a1 + p1142s3a2/60
replace elaborar_ropa = 0 if elaborar_ropa ==. & p6040>=10

*ir a la lavanderia_zapateria 
gen ir_lavanderia_zapateria = p1142s4a1 +p1142s4a2/60
replace ir_lavanderia_zapateria = 0 if ir_lavanderia_zapateria  ==. & p6040>=10

*aseo_vivienda 
gen aseo_vivienda = p1136s1a1 + p1136s1a2/60
replace aseo_vivienda = 0 if aseo_vivienda ==. & p6040>=10

*cuidar_mascotas 
gen cuidar_mascotas = p1136s2a1 + p1136s2a2/60
replace cuidar_mascotas = 0 if cuidar_mascotas ==. & p6040>=10

*cuidar_jardin 
gen cuidar_jadin = p1136s3a1 + p1136s3a2/60
replace cuidar_jadin = 0 if cuidar_jadin ==. & p6040>=10

*limpiar_vehiculos 
gen limpiar_vehiculos_hogar = p1136s4a1 + p1136s4a2/60
replace limpiar_vehiculos_hogar = 0 if limpiar_vehiculos_hogar ==. & p6040>=10

*traer agua para el hogar 
gen traer_agua_uso_hogar = p1136s5a1 + p1136s5a2/60
replace traer_agua_uso_hogar = 0 if traer_agua_uso_hogar ==. & p6040>=10

*traer combustrible para cocinar en el hogar 
gen traer_combustibles_cocinar = p1136s6a1 + p1136s6a2/60
replace traer_combustibles_cocinar  = 0 if traer_combustibles_cocinar ==. & p6040>=10

*construir o ampliar esta vivienda 
gen construir_ampliar_vivienda = p1141s1a1 + p1141s1a2/60
replace construir_ampliar_vivienda  = 0 if construir_ampliar_vivienda  ==. & p6040>=10

*reparar o hacer instalaciones esta vivienda 
gen reparar_instalaciones_vivienda = p1141s2a1 + p1141s2a2/60
replace reparar_instalaciones_vivienda  = 0 if reparar_instalaciones_vivienda ==. & p6040>=10

*reparar electrodomesticos esta vivienda 
gen reparar_electro_muebles = p1141s3a1 + p1141s3a2/60
replace reparar_electro_muebles  = 0 if reparar_electro_muebles  ==. & p6040>=10

*llevar a reparar electrodomesticos esta vivienda 
gen llevar_reparar_electro_muebles = p1141s4a1 + p1141s4a2/60
replace llevar_reparar_electro_muebles = 0 if llevar_reparar_electro_muebles ==. & p6040>=10

*compra de provisiones 
gen compra_provisiones = p1140s1a1 + p1140s1a2/60
replace compra_provisiones = 0 if compra_provisiones ==. & p6040>=10

*comprar o reclamar medicamentos 
gen comprar_reclamar_medicamentos = p1140s2a1 + p1140s2a2/60
replace comprar_reclamar_medicamentos = 0 if comprar_reclamar_medicamentos ==. & p6040>=10

*dirigir supervisar actividades de este hogar 
gen dirigir_actividades_hogar = p1140s3a1+p1140s3a2/60
replace dirigir_actividades_hogar = 0 if dirigir_actividades_hogar  ==. & p6040>=10

*pagar facturas, realizar tramites para este hogar 
gen realizar_tramites_hogar= p1140s4a1+p1140s4a2/60
replace realizar_tramites_hogar  = 0 if realizar_tramites_hogar ==. & p6040>=10

*buscar vivienda para este hogar 
gen buscar_vivienda = p1140s5a1+p1140s5a2/60
replace buscar_vivienda  = 0 if buscar_vivienda ==. & p6040>=10

*cobrar subsidios para este hogar 
gen cobrar_subsidios_hogar = p1140s6a1 + p1140s6a2/60
replace cobrar_subsidios_hogar = 0 if cobrar_subsidios_hogar ==. & p6040>=10

*traslado compras o encomiendas 
gen traslado_compras_encomiendas = p1140s7a1+p1140s7a2/60
replace traslado_compras_encomiendas = 0 if traslado_compras_encomiendas  ==. & p6040>=10

*br p1139s1*
*estar pendiente de personas para la persona 1 
gen p1_estar_pendiente_de_personas=p1139s1a1+p1139s1a2/60
replace p1_estar_pendiente_de_personas = 0 if p1_estar_pendiente_de_personas  ==. & p6040>=10

*estar pendiente de personas para la persona 2 
gen p2_estar_pendiente_de_personas=p1139s2a1+p1139s2a2/60
replace p2_estar_pendiente_de_personas = 0 if p2_estar_pendiente_de_personas  ==. & p6040>=10

*estar pendiente de personas para la persona 3 
gen p3_estar_pendiente_de_personas=p1139s3a1+p1139s3a2/60
replace p3_estar_pendiente_de_personas = 0 if p3_estar_pendiente_de_personas  ==. & p6040>=10

*jugar con niños 
gen jugar_con_niños = p1137s1a1+p1137s1a2/60
replace jugar_con_niños = 0 if jugar_con_niños ==. & p6040>=10

*contar cuentos 
gen contar_cuentos = p1137s2a1+p1137s2a2/60
replace contar_cuentos = 0 if contar_cuentos ==. & p6040>=10

*llevar al parque 
gen llevar_parque = p1137s3a1 + p1137s3a2/60
replace llevar_parque = 0 if llevar_parque ==. & p6040>=10

*alimentar personas para la persona 1 
gen p1_alimentar_personas = p1135s1a1+p1135s1a2/60
replace p1_alimentar_personas = 0 if p1_alimentar_personas ==. & p6040>=10

*alimentar personas para la persona 2 
gen p2_alimentar_personas = p1135s2a1+p1135s2a2/60
replace p2_alimentar_personas = 0 if p2_alimentar_personas ==. & p6040>=10

*alimentar personas para la persona 3 
gen p3_alimentar_personas = p1135s3a1+p1135s3a2/60
replace p3_alimentar_personas = 0 if p3_alimentar_personas ==. & p6040>=10

*bañar personas para la persona 1 
gen p1_bañar_personas = p1134s1a1+p1134s1a2/60
replace p1_bañar_personas = 0 if p1_bañar_personas ==. & p6040>=10

*bañar personas para la persona 2 
gen p2_bañar_personas = p1134s2a1+p1134s2a2/60
replace p2_bañar_personas = 0 if p2_bañar_personas ==. & p6040>=10

*bañar personas para la persona 3 
gen p3_bañar_personas = p1134s3a1+p1134s3a2/60
replace p3_bañar_personas = 0 if p3_bañar_personas ==. & p6040>=10

*suministrar medicamentos a personas para la persona 1 
gen p1_suministrar_medicamentos = p1133s1a1+p1133s1a2/60
replace p1_suministrar_medicamentos = 0 if p1_suministrar_medicamentos ==. & p6040>=10

*suministrar medicamentos a personas para la persona 2 
gen p2_suministrar_medicamentos = p1133s2a1+p1133s2a2/60
replace p2_suministrar_medicamentos = 0 if p2_suministrar_medicamentos ==. & p6040>=10

*suministrar medicamentos a personas para la persona 3 
gen p3_suministrar_medicamentos = p1133s3a1+p1133s3a2/60
replace p3_suministrar_medicamentos = 0 if p3_suministrar_medicamentos ==. & p6040>=10

*ayudar en tareas_escolares para la persona 1 
gen p1_ayuda_tareas_escuelas= p1132s1a1+p1132s1a2/60
replace p1_ayuda_tareas_escuelas = 0 if p1_ayuda_tareas_escuelas ==. & p6040>=10

*ayudar en tareas_escolares para la persona 2 
gen p2_ayuda_tareas_escuelas= p1132s2a1+p1132s2a2/60
replace p2_ayuda_tareas_escuelas = 0 if p2_ayuda_tareas_escuelas ==. & p6040>=10

*ayudar en tareas_escolares para la persona 3 
gen p3_ayuda_tareas_escuelas= p1132s3a1+p1132s3a2/60
replace p3_ayuda_tareas_escuelas = 0 if p3_ayuda_tareas_escuelas ==. & p6040>=10

*acompañar citas medicas para la persona 1 
gen p1_acompañar_citas_medicas = p1131s1a1 + p1131s1a2/60 + p1131s1a3 + p1131s1a4/60
replace p1_acompañar_citas_medicas = 0 if p1_acompañar_citas_medicas  ==. & p6040>=10

*acompañar citas medicas para la persona 2 
gen p2_acompañar_citas_medicas = p1131s2a1 + p1131s2a2/60 + p1131s2a3 + p1131s2a4/60
replace p2_acompañar_citas_medicas = 0 if p2_acompañar_citas_medicas  ==. & p6040>=10

*acompañar citas medicas para la persona 3 
gen p3_acompañar_citas_medicas = p1131s3a1 + p1131s3a2/60 + p1131s3a3 + p1131s3a4/60
replace p3_acompañar_citas_medicas = 0 if p3_acompañar_citas_medicas  ==. & p6040>=10

*acosejar personas del hogar 
gen aconsejar_personas_hogar = p1114s1a1 + p1114s1a2/60
replace aconsejar_personas_hogar = 0 if aconsejar_personas_hogar ==. & p6040>=10

*llevar menor de 12 a sitio de estudio 
gen llevar_menor12_sitioest = p1114s2a1 + p1114s2a2/60
replace llevar_menor12_sitioest = 0 if llevar_menor12_sitioest ==. & p6040>=10

*llevar mayor de 12 a sitio de estudio 
gen llevar_mayor12_sitioest = p1114s3a1 + p1114s3a2/60
replace llevar_mayor12_sitioest = 0 if llevar_mayor12_sitioest ==. & p6040>=10

*llevar llevar persona a eventos 
gen llevar_persona_hogar_eventos = p1114s4a1+p1114s4a2/60
replace llevar_persona_hogar_eventos = 0 if llevar_persona_hogar_eventos ==. & p6040>=10

*oficios del hogar 
gen oficios_hogar = p1128s1a1+p1128s1a2/60
replace oficios_hogar = 0 if oficios_hogar ==. & p6040>=10

*reparaciones menores de un hogar 
gen reparaciones_menores_vivienda = p1128s2a1+p1128s2a2/60
replace reparaciones_menores_vivienda = 0 if reparaciones_menores_vivienda  ==. & p6040>=10

*construir en una vivienda 
gen construir_en_una_vivienda = p1128s3a1+p1128s3a2/60
replace construir_en_una_vivienda = 0 if construir_en_una_vivienda  ==. & p6040>=10

*cuidar persones menores de 12 
gen cuidar_personas_menores12= p1128s4a1+p1128s4a2/60
replace cuidar_personas_menores12 = 0 if cuidar_personas_menores12 ==. & p6040>=10

*cuidar persones mayores de 60 
gen cuidar_personas_mayores60 = p1128s5a1+p1128s5a2/60
replace cuidar_personas_mayores60 = 0 if cuidar_personas_mayores60 ==. & p6040>=10

*cuidar personas enfermas 
gen cuidar_personas_enfermas = p1128s6a1+p1128s6a2/60
replace cuidar_personas_enfermas = 0 if cuidar_personas_enfermas ==. & p6040>=10

*cuidar personas con discapacidad 
gen cuidar_personas_discapacidad = p1128s7a1+p1128s7a2/60
replace cuidar_personas_discapacidad = 0 if cuidar_personas_discapacidad ==. & p6040>=10

*traslado para realizar actividades de cuidado 
gen traslado_actividades_cuidado = p1128s8a1+p1128s8a2/60
replace traslado_actividades_cuidado  = 0 if traslado_actividades_cuidado ==. & p6040>=10

*actividades beneficio del barrio 
gen labores_benef_barrio = p1127s1a1+p1127s1a2/60
replace labores_benef_barrio = 0 if labores_benef_barrio ==. & p6040>=10

*actividades voluntariado del barrio 
gen actividades_voluntariado = p1127s2a1+p1127s2a2/60
replace actividades_voluntariado = 0 if actividades_voluntariado ==. & p6040>=10

*actividades otras actividades de voluntariado o comunitarias del barrio 
gen otra_comunitarias = p1127s4a1+p1127s4a2/60
replace otra_comunitarias = 0 if otra_comunitarias ==. & p6040>=10

*cuidados de la huerta casera para el consumo del hogar 
gen cuidar_huerta_casera = p1126s1a1+p1126s1a2/60
replace cuidar_huerta_casera = 0 if cuidar_huerta_casera  ==. & p6040>=10

*criar animales para el consumo del hogar 
gen criar_animales_cons_hogar = p1126s2a1+p1126s2a2/60
replace criar_animales_cons_hogar = 0 if criar_animales_cons_hogar ==. & p6040>=10

*extracción de minerales para el consumo del hogar 
gen extraccion_minerales_cons_hogar = p1126s5a1+p1126s5a2/60
replace extraccion_minerales_cons_hogar = 0 if extraccion_minerales_cons_hogar ==. & p6040>=10

*recoger leña el consumo del hogar 
gen recoger_leña_uso_hogar = p1126s6a1+p1126s6a2/60
replace recoger_leña_uso_hogar = 0 if recoger_leña_uso_hogar  ==. & p6040>=10

*cuidar huerta casera consumo otros hogares 
gen cuidar_huerta_consumo_otrosh = p1125s1a1+p1125s1a2/60
replace cuidar_huerta_consumo_otrosh = 0 if cuidar_huerta_consumo_otrosh ==. & p6040>=10

*criar animales para el consumo otros hogares 
gen criar_animales_cons_otroshogares = p1125s2a1+p1125s2a2/60
replace criar_animales_cons_otroshogares = 0 if criar_animales_cons_otroshogares ==. & p6040>=10

*recoger leña para el consumo otros hogares 
gen recoger_leña_cons_otroshogares = p1125s6a1+p1125s6a2/60
replace recoger_leña_cons_otroshogares = 0 if recoger_leña_cons_otroshogares ==. & p6040>=10

*ayuda de hombres de otros hogares en oficios hogar
gen oficios_hogar_ayudadehombres= p1175s1a2+p1175s1a3/60
replace oficios_hogar_ayudadehombres = 0 if oficios_hogar_ayudadehombres  ==. & p6040>=10

*ayuda de mujeres de otros en oficios hogar
gen oficios_hogar_ayudamujeres= p1175s1a6+p1175s1a7/60
replace oficios_hogar_ayudamujeres  = 0 if oficios_hogar_ayudamujeres  ==. & p6040>=10

*ayuda en ofcios hogar de personas de otros hogares total*
gen ayuda_de_otroshogares= oficios_hogar_ayudadehombres+ oficios_hogar_ayudamujeres

*ayuda de hombres de otros h reparaciones
gen ayudareparacion_hombres_otrosH=p1175s2a2+p1175s2a3/60
replace ayudareparacion_hombres_otrosH = 0 if ayudareparacion_hombres_otrosH ==. & p6040>=10

*ayuda de mujeres de otros h reparaciones
gen ayudareparacion_mujeres_otrosH= p1175s2a6 + p1175s2a7/60
replace ayudareparacion_mujeres_otrosH = 0 if ayudareparacion_mujeres_otrosH ==. & p6040>=10
*total reparacion
gen ayudareparacion_otrosH= ayudareparacion_mujeres_otrosH+ayudareparacion_hombres_otrosH

*ayuda de mujeres de otros h construcción
gen construir_otrosH_hombres = p1175s3a2+p1175s3a3/60
replace construir_otrosH_hombres  = 0 if construir_otrosH_hombres ==. & p6040>=10

*ayuda de mujeres de otros h construcción
gen construir_otrosH_mujeres = p1175s3a6+p1175s3a7/60
replace construir_otrosH_mujeres = 0 if construir_otrosH_mujeres ==. & p6040>=10

*ayuda total de otros h construcción
gen ayudaconstruccion_otrosH= construir_otrosH_mujeres + construir_otrosH_hombres 

*ayuda de hombres de otros h cuidar menores 12
gen otrosh_cuidarmenores12_hombres=p1175s4a2+p1175s4a3/60
replace otrosh_cuidarmenores12_hombres = 0 if otrosh_cuidarmenores12_hombres  ==.  & p6040>=10

*ayuda de mujeres de otros h cuidar menores 12
gen otrosh_cuidarmenores12_mujeres=p1175s4a6+p1175s4a7/60
replace otrosh_cuidarmenores12_mujeres = 0 if otrosh_cuidarmenores12_mujeres  ==. & p6040>=10

*ayuda de otros h cuidar menores 12 total
gen otrosh_cuidarmenores12_total = otrosh_cuidarmenores12_mujeres+otrosh_cuidarmenores12_hombres

*ayuda de hombres de otros h cuidar personas de 60 o más 
gen otrosh_cuidar60omas_hombres = p1175s5a2 + p1175s5a3/60
replace otrosh_cuidar60omas_hombres = 0 if otrosh_cuidar60omas_hombres ==. & p6040>=10

*ayuda de mujeres de otros h cuidar personas de 60 o más 
gen otrosh_cuidar60omas_mujeres = p1175s5a6 + p1175s5a7/60
replace otrosh_cuidar60omas_mujeres = 0 if otrosh_cuidar60omas_mujeres  ==. & p6040>=10

*ayuda de otros h personas de 60 0 más total 
gen otrosh_cuidar60omas_total = otrosh_cuidar60omas_mujeres+otrosh_cuidar60omas_hombres

*ayuda de hombres de otros h cuidar personas enfermas
gen otrosh_cuidarenfermos_hombres = p1175s6a2 + p1175s6a3/60
replace otrosh_cuidarenfermos_hombres = 0 if otrosh_cuidarenfermos_hombres ==. & p6040>=10

*ayuda de mujeres de otros h cuidar personas enfermas
gen otrosh_cuidarenfermos_mujeres = p1175s6a6 + p1175s6a7/60
replace otrosh_cuidarenfermos_mujeres = 0 if otrosh_cuidarenfermos_mujeres ==. & p6040>=10

*ayuda de personas de otros h cuidar personas enfermas total 
gen otrosh_cuidarenfermos_total = otrosh_cuidarenfermos_mujeres+otrosh_cuidarenfermos_hombres

*ayuda de hombres de otros h cuidar discapacitados 
gen otrosh_cuidardisc_hombres= p1175s7a2+p1175s7a3/60
replace otrosh_cuidardisc_hombres = 0 if otrosh_cuidardisc_hombres ==. & p6040>=10

*ayuda de mujeres de otros h cuidar discapacitados 
gen otrosh_cuidardisc_mujeres= p1175s7a6+p1175s7a7/60
replace otrosh_cuidardisc_mujeres = 0 if otrosh_cuidardisc_mujeres ==. & p6040>=10

*ayuda de personas de otros h cuidar discapacitados total 
gen otrosh_cuidardisc_total = otrosh_cuidardisc_mujeres + otrosh_cuidardisc_hombres 

*-------------------------------------------------------------------------------------------------------------------------
sum preparar_servir_alimentos lavar_platos preparar_conservas ///
llevar_comida lavar_planchar reparar_ropa elaborar_ropa ir_lavanderia_zapateria aseo_vivienda /// 
cuidar_mascotas cuidar_jadin limpiar_vehiculos_hogar traer_agua_uso_hogar traer_combustibles_cocinar ///
construir_ampliar_vivienda reparar_instalaciones_vivienda reparar_electro_muebles ///
llevar_reparar_electro_muebles compra_provisiones comprar_reclamar_medicamentos ///
realizar_tramites_hogar buscar_vivienda cobrar_subsidios_hogar traslado_compras_encomiendas p1_estar_pendiente_de_personas ///
p2_estar_pendiente_de_personas p3_estar_pendiente_de_personas jugar_con_niños contar_cuentos llevar_parque p1_alimentar_personas p2_alimentar_personas /// 
p3_alimentar_personas p1_bañar_personas p2_bañar_personas p3_bañar_personas p1_suministrar_medicamentos p2_suministrar_medicamentos /// 
p3_suministrar_medicamentos p1_ayuda_tareas_escuelas p2_ayuda_tareas_escuelas p3_ayuda_tareas_escuelas p1_acompañar_citas_medicas ///
p2_acompañar_citas_medicas p3_acompañar_citas_medicas aconsejar_personas_hogar llevar_menor12_sitioest llevar_mayor12_sitioest ///
llevar_persona_hogar_eventos oficios_hogar reparaciones_menores_vivienda construir_en_una_vivienda ///
cuidar_personas_menores12 cuidar_personas_mayores60 cuidar_personas_enfermas cuidar_personas_discapacidad ///
traslado_actividades_cuidado cuidar_huerta_casera criar_animales_cons_hogar extraccion_minerales_cons_hogar recoger_leña_uso_hogar ///
cuidar_huerta_consumo_otrosh criar_animales_cons_otroshogares recoger_leña_cons_otroshogares ayuda_de_otroshogares ayudareparacion_otrosH ///
ayudaconstruccion_otrosH otrosh_cuidarmenores12_total otrosh_cuidar60omas_total otrosh_cuidardisc_total

egen horas_total_diarias = rowtotal ( preparar_servir_alimentos lavar_platos preparar_conservas ///
llevar_comida lavar_planchar reparar_ropa elaborar_ropa ir_lavanderia_zapateria aseo_vivienda /// 
cuidar_mascotas cuidar_jadin limpiar_vehiculos_hogar traer_agua_uso_hogar traer_combustibles_cocinar ///
construir_ampliar_vivienda reparar_instalaciones_vivienda reparar_electro_muebles ///
llevar_reparar_electro_muebles compra_provisiones comprar_reclamar_medicamentos ///
realizar_tramites_hogar buscar_vivienda cobrar_subsidios_hogar traslado_compras_encomiendas p1_estar_pendiente_de_personas ///
p2_estar_pendiente_de_personas p3_estar_pendiente_de_personas jugar_con_niños contar_cuentos llevar_parque p1_alimentar_personas p2_alimentar_personas /// 
p3_alimentar_personas p1_bañar_personas p2_bañar_personas p3_bañar_personas p1_suministrar_medicamentos p2_suministrar_medicamentos /// 
p3_suministrar_medicamentos p1_ayuda_tareas_escuelas p2_ayuda_tareas_escuelas p3_ayuda_tareas_escuelas p1_acompañar_citas_medicas ///
p2_acompañar_citas_medicas p3_acompañar_citas_medicas aconsejar_personas_hogar llevar_menor12_sitioest llevar_mayor12_sitioest ///
llevar_persona_hogar_eventos oficios_hogar reparaciones_menores_vivienda construir_en_una_vivienda ///
cuidar_personas_menores12 cuidar_personas_mayores60 cuidar_personas_enfermas cuidar_personas_discapacidad ///
traslado_actividades_cuidado cuidar_huerta_casera criar_animales_cons_hogar extraccion_minerales_cons_hogar recoger_leña_uso_hogar ///
cuidar_huerta_consumo_otrosh criar_animales_cons_otroshogares recoger_leña_cons_otroshogares ayuda_de_otroshogares ayudareparacion_otrosH ///
ayudaconstruccion_otrosH otrosh_cuidarmenores12_total otrosh_cuidar60omas_total otrosh_cuidardisc_total ) 

*horas total mensuales
gen horas_total_mensuales = horas_total_diarias*30

*Grupos de variables de cuidado

egen horas_diarias_cocina = rowtotal (preparar_servir_alimentos preparar_conservas llevar_comida) if p6040>=10 
gen horas_mensual_cocina = horas_diarias_cocina*30 

egen horas_diarias_mantenin_rop = rowtotal(lavar_planchar reparar_ropa elaborar_ropa ir_lavanderia_zapateria) if p6040>=10 
gen horas_mensual_mantenin_rop = horas_diarias_mantenin_rop*30

egen horas_diarias_limpieza_hogar =rowtotal (lavar_platos aseo_vivienda cuidar_jadin limpiar_vehiculos_hogar oficios_hogar) if p6040>=10 
gen horas_mensual_limpieza_hogar = horas_diarias_limpieza_hogar*30

egen horas_diarias_repar_cons_hogar = rowtotal (construir_ampliar_vivienda reparar_instalaciones_vivienda reparar_electro_muebles llevar_reparar_electro_muebles reparaciones_menores_vivienda construir_en_una_vivienda) if p6040>=10 
gen horas_mensual_repar_cons_hogar = horas_diarias_repar_cons_hogar*30

egen horas_diarias_abaste_hogar = rowtotal (traer_agua_uso_hogar traer_combustibles_cocinar compra_provisiones comprar_reclamar_medicamentos cuidar_huerta_casera criar_animales_cons_hogar extraccion_minerales_cons_hogar recoger_leña_uso_hogar) if p6040>=10 
gen horas_mensual_abaste_hogar = horas_diarias_abaste_hogar*30

egen horas_diarias_tramites_hogar = rowtotal (realizar_tramites_hogar buscar_vivienda cobrar_subsidios_hogar traslado_compras_encomiendas) if p6040>=10 
gen horas_mensual_tramites_hogar = horas_diarias_tramites_hogar*30

egen horas_diarias_servcuid_miemb_h = rowtotal(cuidar_mascotas p1_estar_pendiente_de_personas p2_estar_pendiente_de_personas p3_estar_pendiente_de_personas ///
 jugar_con_niños contar_cuentos llevar_parque p1_alimentar_personas p2_alimentar_personas p3_alimentar_personas p1_bañar_personas ///
 p2_bañar_personas p3_bañar_personas p1_suministrar_medicamentos p2_suministrar_medicamentos p3_suministrar_medicamentos p1_ayuda_tareas_escuelas /// 
 p2_ayuda_tareas_escuelas p3_ayuda_tareas_escuelas p1_acompañar_citas_medicas p2_acompañar_citas_medicas p3_acompañar_citas_medicas aconsejar_personas_hogar) if p6040>=10 

gen horas_mensual_servcuid_miemb_h = horas_diarias_servcuid_miemb_h*30

egen horas_diarias_traslado_hogar = rowtotal(llevar_menor12_sitioest llevar_mayor12_sitioest traslado_actividades_cuidado llevar_persona_hogar_eventos) if p6040>=10 
gen horas_mensual_traslado_hogar = horas_diarias_traslado_hogar*30

egen horas_diarias_cuiado_pobl_espe =rowtotal (cuidar_personas_menores12 cuidar_personas_mayores60 cuidar_personas_enfermas cuidar_personas_discapacidad) if p6040>=10 
gen horas_mensual_cuiado_pobl_espe=horas_diarias_cuiado_pobl_espe*30
gen horas_diarias_cuid_miemb_h=horas_diarias_traslado_hogar+horas_diarias_servcuid_miemb_h+horas_diarias_cuiado_pobl_espe
gen horas_mensual_cuid_miemb_h=horas_mensual_traslado_hogar+horas_mensual_servcuid_miemb_h+horas_mensual_cuiado_pobl_espe

egen horas_diarias_cuidado_a_otrosh = rowtotal (cuidar_huerta_consumo_otrosh criar_animales_cons_otroshogares recoger_leña_cons_otroshogares) if p6040>=10 
gen horas_mensual_cuidado_a_otrosh = horas_diarias_cuidado_a_otrosh*30

egen horas_diarias_ayuda_de_otrosh = rowtotal (ayuda_de_otroshogares ayudareparacion_otrosH ayudaconstruccion_otrosH otrosh_cuidarmenores12_total otrosh_cuidar60omas_total otrosh_cuidardisc_total) if p6040>=10 
gen horas_mensual_ayuda_de_otrosh = horas_diarias_ayuda_de_otrosh*30

gen horas_diarias_cuidado_otrosh=horas_diarias_ayuda_de_otrosh+horas_diarias_cuidado_a_otrosh
gen horas_mensual_cuidado_otrosh=horas_mensual_ayuda_de_otrosh+horas_mensual_cuidado_a_otrosh

label var horas_diarias_cocina "Food and drink prep."
label var horas_diarias_mantenin_rop "Laundry, care of textiles"
label var horas_diarias_limpieza_hogar "Cleaning"
label var horas_diarias_repar_cons_hogar "Home maintenance, repairs"
label var horas_diarias_abaste_hogar "Purchasing goods"
label var horas_diarias_tramites_hogar "Household management"
label var horas_diarias_cuid_miemb_h "Care for members of the hh"
label var horas_diarias_cuidado_otrosh "Care for other households"

*****************************Regresores Modelos********************************

*Mujer 
gen mujer = (p6020 ==2)
label define mujer 0 "man" 1 "woman" //etiquetas
label values mujer mujer

*de edad*
gen edad = p6040

*etnia
label var p1173 //to drop var label
recode p1173 (6=0 "none") (1=1 "indigenous") (2=2 "rom") (3=3 "raizal") (4 5 =4 "afro-colombian"), gen(etnia)

*rural 1 si es rural, 0 si es urbano
gen rural = (clase ==2)
label define rural 0 "urban" 1 "rural" //etiquetas
label values rural rural

label var p6210 //to drop var label
recode p6210 ( 1/2 = 0 "none")( 3=1 "primary") (4 5 7 9 = 2 " secondary") (6 8 10 11 = 3 "tertiary") (12 = 4 "postgrad"), gen (educ)
replace educ = 0 if educ ==. & (p1158 == 1 | p1158 == 2) 
replace educ = 1 if educ ==. & p1158 == 3 
replace educ = 2 if educ ==. & (p1158 == 4 | p1158 == 5 | p1158 == 6) 
replace educ = 3 if educ ==. & (p1158 == 7 | p1158 == 8)
replace educ = 4 if educ ==. & p1158 == 9 

tab educ if p6040>10, missing



*****************************Ingresos********************************
local income p1103s2a2 p1103s1a2 p1103s3a2 p6500 p6541 p6510s1 p6545as1 ///
p6545bs1 p6545cs1 p6545ds1 p6545es1 p6545fs1 p6542s1a1 p6542s2a1 p6542s3a1 p6542s4a1 ///
p6542s5a1 p6541 p6533 p6531 p1119s1a1 p1119s2a1 p1119s3a1 p1117s2 p1118s2 p1116s1a1 ///
p1116s2a1 p1116s3a1 p6531s1

**
qui foreach var of local income {
	foreach i in 98 99 999 9999 {
		replace `var'=. if `var'==`i'
	}
}

*Ingreso laboral
**Asalariados
*salarios 
gen salarios = p6500

*mensuales
gen pag_ex=p6510s1 	if p6510s2==2
gen pag_al=p6545as1 if p6545as2==2
gen pag_tr=p6545bs1 if p6545bs2==2
gen pag_sf=p6545cs1 if p6545cs2==2
gen pag_se=p6545ds1 if p6545ds2==2
gen pag_pr=p6545es1 if p6545es2==2
gen pag_bo=p6545fs1 if p6545fs2==2

*anuales
gen pag_ps=p6542s1a1/12
gen pag_pn=p6542s2a1/12
gen pag_pv=p6542s3a1/12
gen pag_vi=p6542s4a1/12
gen pag_ac=p6542s5a1/12

**Independientes
* ganancia 
replace p6540=1 if p6540==0
gen ganancias = p6541/p6540

*suma de ingresos + ganancias -- ingreso laboral* 
egen ing_lab_mensual = rowtotal (ganancias salarios pag*)
replace ing_lab_mensual=. if ing_lab_mensual==0
*Segundo empleo
gen ing_lab_men2=p6533
*trabajos previos
gen ing_lab_men3=p6531s1

egen tot_inglabo=rowtotal(ing_lab_mensual ing_lab_men2 ing_lab_men3)


**Transferencias subsidios, pensión
egen temp_bsach=rowtotal(p1103s1a2 p1103s2a2 p1103s3a2) if p425==1 //transferencias al hogar jefe
replace temp_bsach=0 if p425==2 //conyugue
bys directorio secuencia_p: egen temp_bsach2=mean(temp_bsach) if p425==1 | p425==2 //repartir entre jefe y conyugue

egen trasgobierno=rowtotal(temp_bsach2 p1119s2a1)  //p1119s2a1=pensiones
replace trasgobierno=trasgobierno*12 		//mes a año
egen transferencias=rowtotal(p1117s2 p1118s2 trasgobierno) 
replace transferencias=transferencias/12				//ayudas año a mes

egen arriendo_tr_pr=rowtotal(p1119s1a1  p1119s3a1)
replace arriendo_tr_pr=arriendo_tr_pr
egen financiero=rowtotal(p1116s1a1 p1116s2a1 p1116s3a1)
replace financiero=financiero/12		//financiero año a mes

egen ing_nolab=rowtotal(financiero arriendo_tr_pr)


*Ing total
egen ing_total=rowtotal(tot_inglabo ing_nolab transferencias)

*Ing per-cápita
bysort directorio secuencia_p: egen ingpc=mean(ing_total)

*deciles
xtile deciles=ingpc+runiform() [aw=f_exp], nq(10)
xtile percentiles=ingpc+runiform() [aw=f_exp], nq(100)

*horas trabajadas semana 

gen horas_trabajadas_mes =p1151*4.3
replace horas_trabajadas_mes = 0 if horas_trabajadas_mes ==.


*logaritmo de ingreso laboral
gen ing_lab_hora = ing_lab_mensual/horas_trabajadas_mes
gen ln_ing_lab_hora = log(ing_lab_hora)


*dummy trabaja
gen trabaja=(ing_lab_hora>0 & ing_lab_hora!=.) if edad>=10
label define trabaja 0 "not working" 1 "working" //etiquetas
label values trabaja trabaja




*****************************Variables para descriptivos********************************

** Clasificación por familia
gen no_jefe=(p425!=1)
bysort directorio secuencia_p: egen miembros_no_jefe=total(no_jefe)
gen soltero_sin_hijos=(miembros_no_jefe==0 & mujer==0 )
gen soltera_sin_hijos=(miembros_no_jefe==0 & mujer==1 )

gen no_jefe_no_hijos=(p425!=1 & p425!=3)
bysort directorio secuencia_p: egen miembros_no_jefe_no_hijos=total(no_jefe_no_hijos)
bysort directorio secuencia_p: egen jefe_hombre=total((orden==1)*(mujer==0))
bysort directorio secuencia_p: egen jefe_mujer=total((orden==1)*(mujer==1))
gen soltero_con_hijos=(soltero_sin_hijos==0 & soltera_sin_hijos==0 & miembros_no_jefe_no_hijos==0 & jefe_hombre==1)
gen soltera_con_hijos=(soltero_sin_hijos==0 & soltera_sin_hijos==0 & miembros_no_jefe_no_hijos==0 & jefe_mujer==1)

gen no_pareja=(p425!=2)
bysort directorio secuencia_p: egen miembros_no_pareja=total(no_pareja)
gen pareja_sin_hijos=(soltero_sin_hijos==0 & soltera_sin_hijos==0 & soltero_con_hijos==0 & soltera_con_hijos==0 & miembros_no_pareja==1)

gen no_pareja_no_hijos=(p425!=2 & p425!=3)
bysort directorio secuencia_p: egen miembros_no_pareja_no_hijos=total(no_pareja_no_hijos)
gen pareja_con_hijos=(soltero_sin_hijos==0 & soltera_sin_hijos==0 & soltero_con_hijos==0 & soltera_con_hijos==0 & pareja_sin_hijos==0 & miembros_no_pareja_no_hijos==1)

gen familia_extendida=(soltero_sin_hijos==0 & soltera_sin_hijos==0 & soltero_con_hijos==0 & soltera_con_hijos==0 & pareja_sin_hijos==0 & pareja_con_hijos==0)

gen familia=1 if soltero_sin_hijos==1
replace familia=2 if soltera_sin_hijos==1 
replace familia=3 if soltero_con_hijos==1 
replace familia=4 if soltera_con_hijos==1
replace familia=5 if pareja_sin_hijos==1
replace familia=6 if pareja_con_hijos==1
replace familia=7 if familia_extendida==1


label define familia 1 "single man no kids" 2 "single woman no kids" 3 "single man with kids" 4 "single woman with kids" ///
5 "couple no kids" 6 "couple with kids" 7 "extended family" //etiquetas
label values familia familia
tab familia, missing

gen familia2=1 if soltero_sin_hijos==1 | soltera_sin_hijos==1 | soltero_con_hijos==1 | soltera_con_hijos==1 
replace familia2=2 if pareja_sin_hijos==1 | pareja_con_hijos==1 | familia_extendida==1 


label define familia2 1 "single" 2 "couple" //etiquetas
label values familia2 familia2
tab familia2, missing

**miembro del hogar
gen miembro=1 	 if (p425==1 | p425==2 ) & mujer==0
replace miembro=2 if (p425==1 | p425==2 ) & mujer==1
replace miembro=3 if miembro==.

label define miembro 1 "Man" 2 "Woman" 3 "Other" //etiquetas
label values miembro miembro

save ENUT2.dta, replace
