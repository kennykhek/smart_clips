;;*****************
;;* INITIAL STATE *
;;*****************

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


(deffunction get-mobilephone-list ()
  (bind ?facts (find-all-facts((?p phone)) TRUE))
 )
 
 (deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
 )
 
 (deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
 )
 
 
 