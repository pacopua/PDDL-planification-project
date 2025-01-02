(define (domain DOMAIN_NIVELBASICO)
    (:requirements :strips :typing :adl)
    (:types
        contenido dia - object
    )
    (:predicates
        (havisto ?c - contenido)                        ; Es un contenido que el usuario ha visto
        (tienequever ?c - contenido)                    ; Es un contenido pendiente por agendar. Ya sea porque el usuario queire verlo o porque pertenece a una cadena de predecesores.
        (lleno ?d)                                      ; El dia d ya ha sido llenado con contenidos
        (agendado ?c - contenido)                       ; El contenido c ha sido agendado
        (predecesor ?c1 - contenido ?c2 -  contenido)   ; El contenido c1 es predecesor al contenido c2
        (libredepredecesores ?c - contenido)            ; El contenido c no tiene predecesores o todos los predecesores de c han sido agendados
    )
    (:action reiniciardias
        :precondition
            (forall (?d - dia)
                (lleno ?d)
            )
        :effect
            (forall (?d - dia)
                (not (lleno ?d))
            )
    )
    (:action requerimiento
        :parameters (
            ?c1 - contenido
            ?c2 - contenido
        )
        :precondition
            (and
                (predecesor ?c1 ?c2)
                (tienequever ?c2)
                (not (agendado ?c1))
                (not (havisto ?c1))
                (not (tienequever ?c1))
            )
        :effect
            (and 
                (not (libredepredecesores ?c2))
                (tienequever ?c1)
            )
    )
    (:action agendar
        :parameters (
            ?c - contenido
            ?d - dia
        )
        :precondition 
            (and
                (not (agendado ?c))
                (not (lleno ?d))
                (libredepredecesores ?c)
                (tienequever ?c)
            )
        :effect
            (and
                (not (tienequever ?c))
                (agendado ?c)
                (lleno ?d)

                ; Valido porque hay maximo un predecesor por contenido
                (forall (?c2 - contenido)
                    (when
                        (predecesor ?c ?c2)
                        (libredepredecesores ?c2)
                    )
                )
            )
    )
)
