;;*************
;;* TEMPLATES *
;;*************
(deftemplate phone
	(slot model)
	(slot price     (type FLOAT))
	;spec
	(slot brand  (type SYMBOL))
	(slot color  (type SYMBOL)(default black))
	(slot screen (type FLOAT))
	(slot weight (type FLOAT))
	(slot memory (type INTEGER))
	;features
	(slot os        (type SYMBOL))
	(slot bluetooth (type SYMBOL)(allowed-values yes no)(default yes))
	(slot wifi      (type SYMBOL)(allowed-values yes no)(default yes))
	(slot fm        (type SYMBOL)(allowed-values yes no)(default no))
    ;camera
	(slot zoom      (type INTEGER)(default 0))
	(slot pixel     (type FLOAT))
	(slot flash     (type SYMBOL)  (allowed-values yes no)(default no))
	(slot videoHD   (type SYMBOL)  (allowed-values yes no)(default no))
	;weightage
	(slot weightage (type FLOAT)(default 100.0))
)

(deftemplate requirement
	(slot name (type SYMBOL))
	(slot value)
	(slot weightage (type FLOAT))
)

(deftemplate question
	;(slot phase (type INTEGER))
	(slot order (type SYMBOL))
	;(slot text (type STRING))
	(slot selection (type SYMBOL)(allowed-values yes no))
)
	
;;*********
;;* FACTS *
;;*********
(deffacts init-phone-facts
  ; non plan phone prices are from www.subarumobile.com
  ; nokia
  (phone (model 300)(price 155.00)
         (brand nokia)(color silver)(screen 2.4)(weight 100.0)(memory 32)
         (bluetooth no)(wifi no)(fm yes)
	     (zoom 0)(pixel 5.0)(flash no)(videoHD no))
  (phone (model 600)(price 300.00)
         (brand nokia)(color black)(screen 3.5)(weight 109.6)(memory 32)
         (os symbian)(fm yes)
	     (zoom 4)(pixel 5.0)(flash no)(videoHD yes))
  (phone (model lumia_710)(price 380.00)
         (brand nokia)(color black)(screen 3.7)(weight 125.5)(memory 8)
         (os windows)(fm yes)
  	     (zoom 4)(pixel 5.0)(flash yes)(videoHD no))
  (phone (model lumia800)(price 0.00)
         (brand nokia)(color black)(screen 3.7)(weight 142.0)
         (os windows)(fm no)
  	     (zoom 0)(pixel 8.0)(flash yes)(videoHD yes))
  (phone (model N9)(price 620.00)
         (brand nokia)(color black)(screen 3.9)(weight 135.0)(memory 16)
         (os meego)(fm no)
  	     (zoom 0)(pixel 8.0)(flash yes)(videoHD yes))
  (phone (model N9)(price 680.00)
         (brand nokia)(color black)(screen 3.9)(weight 135.0)(memory 64)
         (os meego)(fm no)
  	     (zoom 0)(pixel 8.0)(flash yes)(videoHD yes))		 
  (phone (model X7)(price 430.00)
         (brand nokia)(color black)(screen 4.0)(weight 149.0)(memory 32)
         (os symbian)(fm no)
         (zoom 2)(pixel 8.0)(flash yes)(videoHD yes))  
  ; HTC
  (phone (model Chacha)(price 280.00)
         (brand htc)(color black)(screen 2.6)(weight 120.0)(memory 32)
         (os android)(bluetooth yes)(fm yes)
	     (zoom 0)(pixel 5.0)(flash yes)(videoHD yes))
  (phone (model desire_s)(price 460.00)
         (brand htc)(color black)(screen 3.7)(weight 130.0)(memory 32)
         (os android)
         (zoom 0)(pixel 5.0)(flash yes)(videoHD yes))
  (phone (model radar)(price 510.00)
         (brand htc)(color black)(screen 3.8)(weight 137.0)(memory 8)
         (os windows)
         (pixel 5.0))
  (phone (model rhyme)(price 550.00)
         (brand htc)(color black)(screen 3.7)(weight 130.0)(memory 32)
         (os android)
         (pixel 5.0)(flash yes)(videoHD yes))  
  (phone (model sensation_xe)(price 655.00)
         (brand htc)(color black)(screen 4.3)(weight 151.0)(memory 32)
         (os android)(fm yes)
  	     (pixel 8.0)(flash yes)(videoHD yes))
  (phone (model sensation_xl)(price 680.00)
         (brand htc)(screen 4.7)(weight 162.5)(memory 16)
         (os android)(fm yes)
  	     (pixel 8.0)(flash yes)(videoHD yes))
  (phone (model wildfire_s)(price 285.00)
         (brand htc)(screen 3.2)(weight 105.0)(memory 32)
         (os android)(fm yes)
  	     (pixel 5.0)(flash yes)(videoHD yes))  
  ; Samsung
  (phone (model galaxy_ace)(price 310.00)
         (brand samsung)(color silver)(screen 3.5)(weight 113.0)(memory 32)
         (os android)(fm yes)
	     (pixel 5.0)(flash yes)(videoHD yes))
  (phone (model galaxy_nexus)(price 805.00)
         (brand samsung)(color black)(screen 4.65)(weight 137.9)(memory 16)
         (os android)(fm yes)
         (pixel 5.0))		
  (phone (model galaxy_note)(price 860.00)
         (brand samsung)(screen 5.3)(weight 178.0)(memory 16)
         (os android)(fm yes)
         (zoom 4)(pixel 8.0)(flash yes))	
  (phone (model galaxy_s_ii)(price 710.00)
         (brand samsung)(color black)(screen 4.27)(weight 116.0)(memory 32)
         (os android)(fm yes)
         (zoom 4)(pixel 8.0)(videoHD yes))
  (phone (model galaxy_s_ii)(price 720.00)
         (brand samsung)(color white)(screen 4.27)(weight 116.0)(memory 32)
         (os android)(fm yes)
         (zoom 4)(pixel 8.0)(videoHD yes))
  (phone (model galaxy_s_ii)(price 730.00)
         (brand samsung)(color pink)(screen 4.27)(weight 116.0)(memory 32)
         (os android)(fm yes)
         (zoom 4)(pixel 8.0)(videoHD yes))
  (phone (model galaxy_tab_7.0_plus)(price 650.00)
         (brand samsung)(color black)(screen 7.0)(weight 345.0)(memory 32)
         (os android)(fm no)
         (zoom 0)(pixel 3.2)(flash yes))	
  (phone (model galaxy_tab_7.7)(price 750.00)
         (brand samsung)(color black)(screen 7.7)(weight 340.0)(memory 32)
         (os android)(fm no)
         (pixel 3.2)(flash yes))	
  (phone (model galaxy_w)(price 395.00)
         (brand samsung)(color black)(screen 3.7)(weight 114.7)(memory 32)
         (os android)(fm yes)
         (pixel 5.0)(flash yes))	
  (phone (model omnia_w)(price 465.00)
         (brand samsung)(screen 3.7)(weight 115.0)(memory 8)
         (os windows)(fm yes)
         (pixel 5.0)(flash yes))			 
  ; LG
  (phone (model optimus_3d)(price 650.00)
         (brand lg)(color black)(screen 4.3)(weight 168.0)(memory 32)
         (os android)(fm yes)
         (pixel 5.0)(flash yes))
  (phone (model optimus_black)(price 410.00)
         (brand lg)(color black)(screen 4.0)(weight 109.0)(memory 32)
         (os android)(fm yes)
         (pixel 5.0)(flash yes)(videoHD yes))
  (phone (model optimus_chic)(price 400.00)
         (brand lg)(color black)(screen 3.2)(weight 127.0)(memory 32)
         (os android)(fm yes)
         (pixel 5.0))
  (phone (model optimus_hub)(price 405.00) ; price from http://www.sgphonedeals.com
         (brand lg)(color black)(screen 3.5)(weight 120.0)(memory 32)
         (os android)(fm yes)
         (pixel 5.0))
  (phone (model optimus_sol)(price 299.00) ; price from www.sgbest.com
         (brand lg)(screen 3.8)(weight 107.0)(memory 32)
         (os android)(bluetooth yes)(wifi yes)(fm yes)
         (pixel 5.0))		
  (phone (model parada)(price 789.00) ; price from www.sgbest.com
         (brand lg)(color black)(screen 4.3)(weight 138.0)(memory 32)
         (os android)(bluetooth yes)(wifi yes)(fm yes)
         (pixel 8.0)(flash yes))			 
  ; Motorla
  (phone (model defy_plus)(price 380.00) ; price from www.sgbest.com
         (brand motorola)(screen 3.7)(weight 118.0)(memory 32)
         (os android)(bluetooth yes)(wifi yes)(fm yes)
  	     (pixel 5.0)(flash yes))  
  (phone (model razr)(price 650.00)
         (brand motorola)(screen 4.3)(weight 127.0)(memory 32)
         (os android)(fm no)
         (pixel 8.0)(flash yes))
  ;(phone (model iphone)(price 400)
  ;       (brand apple)(color white)(screen 2.4)(weight 600.0)(memory 32)
  ;       (os ios)(bluetooth yes)(wifi yes)(fm yes)
  ;	      (zoom 3)(pixel 1.0)(flash yes)(videoHD yes))
)

;(deffacts user-phone-preference
  ;zoom (testing, user prefer 3)
;  (requirement (name zoom)  (value 3)    (weightage 100.0))
;  (requirement (name zoom)  (value 2)    (weightage 50.0))  
;  (requirement (name zoom)  (value 1)    (weightage 0.0))
  ;pixel (testing, user prefer 2)
;  (requirement (name pixel) (value 2)    (weightage 100.0))
;  (requirement (name pixel) (value 1)    (weightage 0.0))
  ;color (testing, user prefer white)
;  (requirement (name color) (value white)(weightage 100.0))
;  (requirement (name color) (value black)(weightage 66.0))
;  (requirement (name color) (value grey) (weightage 33.0))
;  (requirement (name color) (value red)  (weightage 0.0))
;)

;(deffacts user-preference
	;(question (order watch_movie) (selection yes))
	;(question (order listen_music) (selection yes))
	;(question (order view_picture) (selection no))
	;(question (order game_internet) (selection yes))
	;(question (order use_camera) (selection no))
	;(question (order use_camera_night) (selection no)) ; can remove this question? quite redundent
;)

;;*********
;;* RULES *
;;*********
(defrule use_camera
  (question (order use_camera)(selection ?sel))
  =>
  if (eq ?sel yes) then
	(assert (requirement (name pixel)(value 5)(weightage 100.0)))
	(assert (requirement (name flash)(value yes)(weightage 100.0)))
	(assert (requirement (name flash)(value no)(weightage 0.0)))
	(assert (requirement (name videoHD)(value yes)(weightage 100.0)))
	(assert (requirement (name videoHD)(value no)(weightage 0.0)))
)

(defrule game_internet
  (question (order game_internet)(selection ?sel))
  =>
  if (eq ?sel yes) then
    (assert (requirement (name screen)(value 4.3)(weightage 100.0)))
	(assert (requirement (name screen)(value 3.7)(weightage 75.0)))
	(assert (requirement (name screen)(value 3.5)(weightage 50.0)))
	(assert (requirement (name screen)(value 2.6)(weightage 25.0)))
	(assert (requirement (name screen)(value 2.4)(weightage 0.0)))
	(assert (requirement (name wifi)(value yes)(weightage 100.0)))
	(assert (requirement (name wifi)(value no)(weightage 0.0)))
)

(defrule view_picture
  (question (order view_picture)(selection ?sel))
  =>
  if (eq ?sel yes) then
    (assert (requirement (name screen)(value 4.3)(weightage 100.0)))
	(assert (requirement (name screen)(value 3.7)(weightage 75.0)))
	(assert (requirement (name screen)(value 3.5)(weightage 50.0)))
	(assert (requirement (name screen)(value 2.6)(weightage 25.0)))
	(assert (requirement (name screen)(value 2.4)(weightage 0.0)))
	(assert (requirement (name memory)(value 32)(weightage 100.0))))

(defrule listen_music
  (question (order listen_music)(selection ?sel))
  =>
  if (eq ?sel yes) then
	(assert (requirement (name memory)(value 32)(weightage 100.0)))
	(assert (requirement (name fm)(value yes)(weightage 100.0)))
	(assert (requirement (name fm)(value no)(weightage 0.0)))
)

(defrule watch_movie
  (question (order watch_movie)(selection ?sel))
  =>
  if (eq ?sel yes) then
    (assert (requirement (name screen)(value 4.3)(weightage 100.0)))
	(assert (requirement (name screen)(value 3.7)(weightage 75.0)))
	(assert (requirement (name screen)(value 3.5)(weightage 50.0)))
	(assert (requirement (name screen)(value 2.6)(weightage 25.0)))
	(assert (requirement (name screen)(value 2.4)(weightage 0.0)))
	(assert (requirement (name memory)(value 32)(weightage 100.0)))
)

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

(deffunction update-mobilephone-list (?os ?screen ?fm ?video ?camflash ?mem ?weight ?campixel ?color ?wifi ?camzoom)
  (bind ?facts (find-all-facts((?p phone)) 
		(and
			(eq ?p:os ?os)
			(eq ?p:screen ?screen)
			(eq ?p:fm ?fm)
			(eq ?p:videoHD ?video)
			(eq ?p:flash ?camflash)
			(eq ?p:memory ?mem)
			(eq ?p:weight ?weight)
			(eq ?p:pixel ?campixel)
			(eq ?p:color ?color)
			(eq ?p:wifi ?wifi)
			(eq ?p:zoom ?camzoom)
		)
  ))
)
 
(deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
)
