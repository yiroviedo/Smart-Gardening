(define (domain smart-garden)
    (:requirements :strips :typing :fluents)
    (:predicates (water ?w) 
	             (plant ?p) 
				 (free ?m)  
				 (motor ?m)
				 (sufficientmoisturelevel ?p)
	)
    (:action watering
          :parameters (?m1 ?p1)
           :precondition(and (motor ?m1) 
                        (free ?m1) 
                        (not(water ?p1))
                        (not(sufficientmoisturelevel ?p1))
                        )
           :effect  (and (water ?p1) 
                    (not (free ?m1))
                    (sufficientmoisturelevel ?p1)
                    )
    )
    (:action afterwatering
           :parameters (?m1 ?p1)
           :precondition (and (not(free ?m1)) (water ?p1))
           :effect (free ?m1)
	)
)