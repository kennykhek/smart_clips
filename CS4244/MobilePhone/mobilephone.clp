;;*************
;;* TEMPLATES *
;;*************
(deftemplate phone
	(slot model     (type SYMBOL))
	(slot price     (type INTEGER))
	;spec
	(slot brand  (type SYMBOL))
	(slot color  (type SYMBOL))
	(slot weight (type INTEGER))
	(slot memory (type INTEGER))
	;features
	(slot os        (type SYMBOL))
	(slot bluetooth (type SYMBOL)(allow-values yes no))
	(slot wifi      (type SYMBOL)(allow-values yes no))
	(slot fm        (type SYMBOL)(allow-values yes no))
        ;camera
	(slot zoom      (type INTEGER))
	(slot pixel     (type INTEGER))
	(slot flash     (type SYMBOL)  (allowed-values yes no))
	(slot videoHD   (type INTERGER))
	;weightage
	(slot weightage (type FLOAT)(default 100.0))
)

(deftemplate requirement
	(slot name (type SYMBOL))
	(slot value)
	(slot weightage (type FLOAT))
)

;;*********
;;* FACTS *
;;*********
(deffacts init-phone-facts
  (phone (model N4350)(price 400)
         (brand nokia)(color grey)(weight 100)(memory 32)
         (os symbian)(bluetooth yes)(wifi yes)(fm yes)
	 (zoom 3)(pixel 1)(flash yes)(videoHD 4))
  (phone (model K421)(price 400)
         (brand sonyericsson)(color black)(weight 100)(memory 32)
         (os javaME)(bluetooth yes)(wifi no)(fm yes)
	 (zoom 1)(pixel 2)(flash yes)(videoHD 4))
  (phone (model N1032)(price 400)
         (brand nokia)(color red)(weight 100)(memory 32)
         (os symbian)(bluetooth yes)(wifi yes)(fm yes)
	 (zoom 2)(pixel 2)(flash no)(videoHD 4))
  (phone (model iphone)(price 400)
         (brand apple)(color white)(weight 600)(memory 32)
         (os ios)(bluetooth yes)(wifi yes)(fm yes)
	 (zoom 3)(pixel 1)(flash yes)(videoHD 4))
)

(deffacts user-phone-preference
  ;zoom (testing, user prefer 3)
  (requirement (name zoom)  (value 3)    (weightage 100))
  (requirement (name zoom)  (value 2)    (weightage 50))  
  (requirement (name zoom)  (value 1)    (weightage 0))
  ;pixel (testing, user prefer 2)
  (requirement (name pixel) (value 2)    (weightage 100))
  (requirement (name pixel) (value 1)    (weightage 0))
  ;color (testing, user prefer white)
  (requirement (name color) (value white)(weightage 100))
  (requirement (name color) (value black)(weightage 66))
  (requirement (name color) (value grey) (weightage 33))
  (requirement (name color) (value red)  (weightage 0))
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
