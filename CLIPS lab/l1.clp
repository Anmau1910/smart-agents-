(deftemplate Planta
	(slot crecimiento_raíz (type STRING)(default "normal"))
	(slot color (type STRING) (default "verde"))
	(slot borde_hoja (type STRING) (default "verde"))
	(slot tallo (type STRING) (default "normal"))
	(slot maduración (type STRING) (default "normal"))
	(slot semilla_o_fruto (type STRING) (default "normal"))
)

(deffacts Plantas
	(Planta (color "amarillo pálido") (borde_hoja "café rojizo"))
	(Planta (crecimiento_raíz "atrofiado"))
	(Planta (color "amarillo pálido"))
	(Planta (borde_hoja "café rojizo"))
	(Planta (tallo "zanquivano"))
	(Planta (color "púrpura"))
	(Planta (maduración "retardada"))
	(Planta (borde_hoja "quemado"))
	(Planta (tallo "debilitados"))
	(Planta (semilla_o_fruto "semillas"))
	(Planta (semilla_o_fruto "frutos secos"))
)

(defrule coloracion
	?p <- (Planta (crecimiento_raíz "atrofiado" | "Atrofiado" ) (color ~"amarillo pálido" & ~"verde"))
	=>
	(modify ?p (color "amarillo pálido"))
	(printout t "Deficiencia de fósforo." crlf)
)

(defrule col-pur
	?p <-(Planta (tallo "debilitados" | "Debilitados" | "debilitado" | "Debilitado" )(color ~"púrpura"))
	=>
	(modify ?p (color "púrpura"))
)

(defrule nitrogeno
	(or 
	?p <- (Planta (color "amarillo pálido" | "Amarillo pálido" ))
	?p <- (Planta (borde_hoja "Café rojizo" | "café rojizo" ))
	) 
	=>
	(modify ?p (color "verde") (borde_hoja "verde"))
	(printout t "Deficiencia de nitrógeno." crlf)
)

(defrule fósforo
	(or 
	?p <- (Planta (tallo "zanquivano" | "Zanquivano" ))
	?p <- (Planta (color "púrpura" | "Púrpura" ))
	?p <- (Planta (maduración "retardada" | "Retardada" ))
	)
	=>
	(modify ?p (color "verde") (tallo "normal") (maduración "normal"))
	(printout t "Deficiencia de fósforo." crlf)
)

(defrule potasio
	(or
	?p <- (Planta (borde_hoja "quemado" | "Quemado" ))
	?p <- (Planta (semilla_o_fruto "semillas" | "Semillas" | "frutos secos" | "Frutos secos" ))
	)
	=>
	(modify ?p (borde_hoja "verde") (semilla_o_fruto "none"))
	(printout t "Deficiencia de potasio." crlf)
)
