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
	(slot bluetooth (type SYMBOL)(allowed-values yes no))
	(slot wifi      (type SYMBOL)(allowed-values yes no))
	(slot fm        (type SYMBOL)(allowed-values yes no))
    ;camera
	(slot zoom      (type INTEGER))
	(slot pixel     (type INTEGER))
	(slot flash     (type SYMBOL)  (allowed-values yes no))
	(slot videoHD   (type INTEGER))
	;weightage
	(slot weightage (type FLOAT)(default 100.0))
)

(deftemplate requirement
	(slot name (type SYMBOL))
	(slot value)
	(slot weightage (type FLOAT))
)

(deftemplate question
	(slot phase (type INTEGER))
	(slot order (type SYMBOL))
	(slot text (type STRING))
	(slot selection (type SYMBOL)(allowed-values yes no))
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
  (requirement (name zoom)  (value 3)    (weightage 100.0))
  (requirement (name zoom)  (value 2)    (weightage 50.0))  
  (requirement (name zoom)  (value 1)    (weightage 0.0))
  ;pixel (testing, user prefer 2)
  (requirement (name pixel) (value 2)    (weightage 100.0))
  (requirement (name pixel) (value 1)    (weightage 0.0))
  ;color (testing, user prefer white)
  (requirement (name color) (value white)(weightage 100.0))
  (requirement (name color) (value black)(weightage 66.0))
  (requirement (name color) (value grey) (weightage 33.0))
  (requirement (name color) (value red)  (weightage 0.0))
)

(deffacts user-preference
	(question (order watch_movie) (selection yes))
	(question (order listen_music) (selection yes))
	(question (order view_picture) (selection no))
	(question (order game_internet) (selection yes))
	(question (order use_camera) (selection no))
	(question (order use_camera_night) (selection no))
)

;;*********
;;* RULES *
;;*********
(defrule combine-weightage
  ; take average of two weightage if there is two rule with similar attribute and value
  ?rem1 <- (requirement (name ?attribute)(value ?val)(weightage ?weightage1))
  ?rem2 <- (requirement (name ?attribute)(value ?val)(weightage ?weightage2))
  (test (neq ?rem1 ?rem2))
  =>
  (retract ?rem1)
  (modify ?rem2 (weightage (/ (+ ?weightage1 ?weightage2) 2)))
)

(defrule calculate-weightage
  ; calculate weight of phone by taking average
  ?phone <- (phone (model ?moVal)(price ?prVal)
            (brand ?brVal)(color ?coVal)(weight ?weVal)(memory ?meVal)
            (os ?osVal)(bluetooth ?blVal)(wifi ?wiVal)(fm ?fmVal)
	        (zoom ?zoVal)(pixel ?piVal)(flash ?flVal)(videoHD ?viVal)
		    (weightage ?weightage))
  (requirement (name zoom) (value ?zoVal)(weightage ?weightage-zo))
  (requirement (name pixel)(value ?piVal)(weightage ?weightage-pi))
  (requirement (name color)(value ?coVal)(weightage ?weightage-co))
  =>
  (bind ?new-weightage (/ 3 (+ ?weightage-zo (+ ?weightage-pi ?weightage-co))))
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
