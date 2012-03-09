;;*************
;;* TEMPLATES *
;;*************
(deftemplate phone
	(slot model     (type SYMBOL) (default NIL))
	(slot zoom      (type INTEGER)(default 0))
	(slot pixel     (type INTEGER)(default 0))
	(slot color     (type SYMBOL) (default NIL))
	(slot weight    (type INTEGER)(default 0))
	(slot weightage (type INTEGER)(default 0))
)

(deftemplate requirement
	(slot name (type SYMBOL))
	(slot value)
	(slot weightage (type INTEGER)(default 0))
)

;;*********
;;* FACTS *
;;*********
(deffacts init-phone-facts
  (phone (model iphone)(zoom 4)(pixel 1)(color red)  (weight 100))
  (phone (model N3310) (zoom 3)(pixel 2)(color blue) (weight 150))
  (phone (model E330i) (zoom 2)(pixel 3)(color green)(weight 110))
  (phone (model S3310) (zoom 1)(pixel 4)(color black)(weight 130))
)

(deffacts user-phone-preference
  (requirement (name up-zoom)  (value 4)    (weightage 100))
  (requirement (name up-pixel) (value 4)    (weightage 100))
  (requirement (name up-color) (value green)(weightage 100))
  (requirement (name up-weight)(value 110)  (weightage 100))
)

;;*********
;;* RULES *
;;*********
(defrule combine-weightage
  ?rem1 <- (requirement (name ?attribute)(value ?val)(weightage ?weightage1))
  ?rem2 <- (requirement (name ?attribute)(value ?val)(weightage ?weightage2))
  (test (neq ?rem1 ?rem2))
  =>
  (retract ?rem1)
  (modify ?rem2 (weightage (round (/ (+ ?weightage1 ?weightage2) 2))))
)

(defrule calculate-weightage
  ?phone <- (phone (model ?name)(zoom ?best-cz)(pixel ?best-cp)(color ?best-cc)(weight ?best-cw)(weightage ?weightage))
  (requirement (name zoom)  (value ?best-cz)(weightage ?weightage-cz))
  (requirement (name pixel) (value ?best-cp)(weightage ?weightage-cp))
  (requirement (name color) (value ?best-cc)(weightage ?weightage-cc))
  (requirement (name weight)(value ?best-cw)(weightage ?weightage-cw))
  =>
  (bind ?new-weightage (min ?weightage-cz ?weightage-cp ?weightage-cc ?weightage-cw))
  (modify ?phone (weightage ?new-weightage))
)

;;*************
;;* FUNCTIONS *
;;*************
(deffunction get-mobilephone-list ()
  (bind ?facts (find-all-facts((?p phone)) TRUE))
)
 
(deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
)
