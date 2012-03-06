;;*************
;;* TEMPLATES *
;;*************
(deftemplate phone
	(slot camera-zoom (type INTEGER))
	(slot camera-pixel (type INTEGER))
	(slot color (type SYMBOL) (default NIL))
	(slot weight (type INTEGER) (default 0))
	(slot weightage (type INTEGER) (default 1))
)

(deftemplate requirement
	(slot requirement-name (type SYMBOL))
	(slot requirement-value (type INTEGER))
	(slot requirement-weightage (type INTEGER)(default 1))
)

;;*********
;;* FACTS *
;;*********
(deffacts init-facts
  (requirement (requirement-name test)(requirement-value 100)(requirement-weightage 1))
  (phone (camera-zoom 4)(camera-pixel 1)(color red)  (weight 10))
  (phone (camera-zoom 3)(camera-pixel 2)(color blue) (weight 150)(weightage 20))
  (phone (camera-zoom 2)(camera-pixel 3)(color green)(weight 110)(weightage 10))
  (phone (camera-zoom 1)(camera-pixel 4)(color black)(weight 130)(weightage 5))
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
 
(deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
)

 