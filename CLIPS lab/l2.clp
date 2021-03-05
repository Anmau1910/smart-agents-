(deftemplate Planta
  (slot crecimiento_raíz)
  (slot color)
  (slot borde_hoja)
  (slot tallo)
  (slot maduración)
  (slot descripción_hoja)
  (slot semilla_o_fruto)
)

(deffacts Plantas
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
  ?p <- (Planta (crecimiento_raíz "atrofiado" | "Atrofiado" ) (color ~"amarillo pálido"))
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
  (Planta (color "amarillo pálido" | "Amarillo pálido" ))
  (Planta (borde_hoja "Café rojizo" | "café rojizo" ))
  ) 
  =>
  (printout t "Deficiencia de nitrógeno." crlf)
)

(defrule fósforo
  (or 
  (Planta (tallo "zanquivano" | "Zanquivano" ))
  (Planta (color "púrpura" | "Púrpura" ))
  (Planta (maduración "retardada" | "Retardada" ))
  )
  =>
  (printout t "Deficiencia de fósforo." crlf)
)

(defrule potasio
  (or
  (Planta (borde_hoja "quemado" | "Quemado" ))
  (Planta (semilla_o_fruto "semillas" | "Semillas" | "frutos secos" | "Frutos secos" ))
  )
  =>
  (printout t "Deficiencia de potasio." crlf)
)