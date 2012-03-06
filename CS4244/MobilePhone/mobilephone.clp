;;*************
;;* TEMPLATES *
;;*************
(deftemplate phone
	(slot model (type SYMBOL))
	(slot zoom (type INTEGER))
	(slot pixel (type INTEGER))
	(slot color (type SYMBOL) (default NIL))
	(slot weight (type INTEGER) (default 0))
	(slot weightage (type INTEGER) (default 1))
)

(deftemplate requirement
	(slot name (type SYMBOL))
	(slot value (type INTEGER))
	(slot weightage (type INTEGER)(default 1))
)

;;*************
;;* FUNCTIONS *
;;*************
;; Not calculating the correct value weight. Still changing in progress @kenny
(defrule calculate-weightage
  ?phone <- (phone (model ?name)(zoom ?zoom)(pixel ?pixel)(color ?color)(weight ?weight)(weightage ?weightage))
  (requirement (name zoom)  (value ?best-cz) (weightage ?weightage-cz))
  (requirement (name pixel) (value ?best-cp) (weightage ?weightage-cp))
  (requirement (name color) (value ?best-cc) (weightage ?weightage-cc))
  (requirement (name weight)(value ?best-cw) (weightage ?weightage-cw))
  =>
  (bind ?new-cz-weightage (round (* (* (/ (abs (- ?zoom ?best-cz)) ?best-cz) 100) ?weightage-cz)))
  (bind ?new-cp-weightage (round (* (* (/ (abs (- ?zoom ?best-cp)) ?best-cz) 100) ?weightage-cp)))
  (bind ?new-cc-weightage (round (* (* (/ (abs (- ?zoom ?best-cc)) ?best-cz) 100) ?weightage-cc)))
  (bind ?new-cw-weightage (round (* (* (/ (abs (- ?zoom ?best-cw)) ?best-cz) 100) ?weightage-cw)))
;; Method A of calculation
;;(bind ?new-weightage (/ (+ (+ ?new-cz-weightage ?new-cp-weightage) (+ ?new-cc-weightage ?new-cw-weightage)) 4)
;; Method B of calculation
  (bind ?new-weightage (integer (min ?new-cz-weightage ?new-cp-weightage ?new-cc-weightage ?new-cw-weightage)))
  (modify ?phone (weightage ?new-weightage))
)

(deffunction get-mobilephone-list ()
  (bind ?facts (find-all-facts((?p phone)) TRUE))
)
 
(deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
)

;;*********
;;* FACTS *
;;*********
(deffacts init-facts
  (requirement (name test)(value 100)(weightage 1))
  (phone (model iphone)	(zoom 4) (pixel 1) (color red)   (weight 10)  (weightage 20))
  (phone (model N3310)	(zoom 3) (pixel 2) (color blue)  (weight 150) (weightage 20))
  (phone (model E330i)	(zoom 2) (pixel 3) (color green) (weight 110) (weightage 10))
  (phone (model S3310)	(zoom 1) (pixel 4) (color black) (weight 130) (weightage 5))
)

 