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
	(slot weightage (type FLOAT)(default 0.0))
)

(deftemplate requirement
	(slot name (type SYMBOL))
	(slot value)
	(slot weightage (type FLOAT))
)

(deftemplate feature
	(slot name (type SYMBOL))
	(slot boolean (type SYMBOL)(allowed-values TRUE FALSE))
)

(deftemplate phone-weightage
	(slot model)
	(slot weightage (type FLOAT)(default 0.0))
)

(deftemplate question
	;(slot phase (type INTEGER))
	(slot order (type SYMBOL))
	;(slot text (type STRING))
	(slot selection (type SYMBOL))
)

(deftemplate phone_plan_price
	(slot model (type SYMBOL))
	(slot phoneprice (type float))
	(slot plan (type SYMBOL))
)

(deftemplate phone_plan ; only consider plans with data bundled
	(slot plan (type SYMBOL)) ; name of plan
	(slot provider (type SYMBOL)) ; M1, Singtel, Starhub
	(slot planprice (type FLOAT) 
	(slot outgoing (type INTEGER))
	(slot sms (type INTEGER))
	(slot data (type INTEGER))
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
  (phone (model 603)(price 300.00)
         (brand nokia)(color black)(screen 3.5)(weight 109.6)(memory 32)
         (os symbian)(fm yes)
	     (zoom 4)(pixel 5.0)(flash no)(videoHD yes))
  (phone (model lumia_710)(price 380.00)
         (brand nokia)(color black)(screen 3.7)(weight 125.5)(memory 8)
         (os windows)(fm yes)
  	     (zoom 4)(pixel 5.0)(flash yes)(videoHD no))
  (phone (model lumia_800)(price 0.00)
         (brand nokia)(color black)(screen 3.7)(weight 142.0)
         (os windows)(fm no)
  	     (zoom 0)(pixel 8.0)(flash yes)(videoHD yes))
  (phone (model N9_16)(price 620.00)
         (brand nokia)(color black)(screen 3.9)(weight 135.0)(memory 16)
         (os meego)(fm no)
  	     (zoom 0)(pixel 8.0)(flash yes)(videoHD yes))
  (phone (model N9_64)(price 680.00)
         (brand nokia)(color black)(screen 3.9)(weight 135.0)(memory 64)
         (os meego)(fm no)
  		 (zoom 0)(pixel 8.0)(flash yes)(videoHD yes))	
  ;Phone and plan not available
  ;(phone (model X7)(price 430.00)
  ;       (brand nokia)(color black)(screen 4.0)(weight 149.0)(memory 32)
  ;       (os symbian)(fm no)
  ;       (zoom 2)(pixel 8.0)(flash yes)(videoHD yes))  
  ; HTC
  (phone (model Chacha)(price 280.00)
         (brand htc)(color black)(screen 2.6)(weight 120.0)(memory 32)
         (os android)(bluetooth yes)(fm yes)
	     (zoom 0)(pixel 5.0)(flash yes)(videoHD yes))
  ;(phone (model desire_s)(price 460.00)
  ;       (brand htc)(color black)(screen 3.7)(weight 130.0)(memory 32)
  ;       (os android)
  ;       (zoom 0)(pixel 5.0)(flash yes)(videoHD yes))
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
  ;(phone (model optimus_black)(price 410.00)
  ;       (brand lg)(color black)(screen 4.0)(weight 109.0)(memory 32)
  ;       (os android)(fm yes)
  ;       (pixel 5.0)(flash yes)(videoHD yes))
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
  ; Motorola
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

(deffacts user-preference
 (question (order prefer_func) (selection s1))
 (question (order user_type) (selection s1))
 (question (order user_attitude) (selection s2))
 (question (order user_saying) (selection s3))
	;(question (order watch_movie) (selection yes))
	;(question (order listen_music) (selection yes))
	;(question (order view_picture) (selection no))
	;(question (order game_internet) (selection yes))
	;(question (order use_camera) (selection no))
	;(question (order use_camera_night) (selection no)) ; can remove this question? quite redundent
)

;Phone Plans
(deffacts phone_plans
	(phone_plan (plan 3G_Flexi_Value) (provider singtel) (planprice 59.90) (outgoing 200) (sms 650) (data 12))
	(phone_plan (plan 3G_Flexi_Premium) (provider singtel) (planprice 205.00) (outgoing 2000) (sms 2000) (data 30))
	(phone_plan (plan 3G_Flexi_Plus) (provider singtel) (planprice 99.90) (outgoing 500) (sms 700) (data 12))
	(phone_plan (plan 3G_Flexi_Lite) (provider singtel) (planprice 39.90) (outgoing 100) (sms 550) (data 12))
	(phone_plan (plan iTwo_Value) (provider singtel) (planprice 48.15) (outgoing 300) (sms 500) (data 0))
	(phone_plan (plan iTwo_Plus) (provider singtel) (planprice 82.93) (outgoing 700) (sms 500) (data 0))
	(phone_plan (plan iThree_Plus) (provider singtel) (planprice 192.60) (outgoing 2000) (sms 2000) (data 0))
	(phone_plan (plan iOne_Super_Value) (provider singtel) (planprice 15.00) (outgoing 80) (sms 50) (data 0))
	(phone_plan (plan iOne_Plus) (provider singtel) (planprice 25.68) (outgoing 100) (sms 500) (data 0))

)

;Phone Plan Price
(deffacts initPhonePlanPrice
	;;NOKIA
	(phone_plan_price (model 300) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan iOne_Super_Value))
	(phone_plan_price (model 300) (phoneprice 0.00) (plan iOne_Plus))
	
	(phone_plan_price (model 603) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model 603) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model 603) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model 603) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model 603) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model 603) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model 603) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model 603) (phoneprice 148.00) (plan iOne_Super_Value))
	(phone_plan_price (model 603) (phoneprice 48.00) (plan iOne_Plus))
	
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model lumia_710) (phoneprice 198.00) (plan iOne_Super_Value))
	(phone_plan_price (model lumia_710) (phoneprice 98.00) (plan iOne_Plus))
	
	(phone_plan_price (model lumia_800) (phoneprice 98.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model lumia_800) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model lumia_800) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model lumia_800) (phoneprice 248.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model lumia_800) (phoneprice 248.00) (plan iTwo_Value))
	(phone_plan_price (model lumia_800) (phoneprice 98.00) (plan iTwo_Plus))
	(phone_plan_price (model lumia_800) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model lumia_800) (phoneprice 498.00) (plan iOne_Super_Value))
	(phone_plan_price (model lumia_800) (phoneprice 398.00) (plan iOne_Plus))
	
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model N9_16) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model N9_16) (phoneprice 198.00) (plan iOne_Super_Value))
	(phone_plan_price (model N9_16) (phoneprice 98.00) (plan iOne_Plus))
	
	(phone_plan_price (model N9_64) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model N9_64) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model N9_64) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model N9_64) (phoneprice 98.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model N9_64) (phoneprice 98.00) (plan iTwo_Value))
	(phone_plan_price (model N9_64) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model N9_64) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model N9_64) (phoneprice 298.00) (plan iOne_Super_Value))
	(phone_plan_price (model N9_64) (phoneprice 198.00) (plan iOne_Plus))
	
	;;HTC
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model Chacha) (phoneprice 100.00) (plan iOne_Super_Value))
	(phone_plan_price (model Chacha) (phoneprice 0.00) (plan iOne_Plus))
	
	(phone_plan_price (model radar) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model radar) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model radar) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model radar) (phoneprice 68.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model radar) (phoneprice 68.00) (plan iTwo_Value))
	(phone_plan_price (model radar) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model radar) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model radar) (phoneprice 268.00) (plan iOne_Super_Value))
	(phone_plan_price (model radar) (phoneprice 168.00) (plan iOne_Plus))
	
	(phone_plan_price (model rhyme) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model rhyme) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model rhyme) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model rhyme) (phoneprice 98.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model rhyme) (phoneprice 98.00) (plan iTwo_Value))
	(phone_plan_price (model rhyme) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model rhyme) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model rhyme) (phoneprice 348.00) (plan iOne_Super_Value))
	(phone_plan_price (model rhyme) (phoneprice 248.00) (plan iOne_Plus))
	
	(phone_plan_price (model sensation_xe) (phoneprice 138.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model sensation_xe) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model sensation_xe) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model sensation_xe) (phoneprice 288.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model sensation_xe) (phoneprice 288.00) (plan iTwo_Value))
	(phone_plan_price (model sensation_xe) (phoneprice 138.00) (plan iTwo_Plus))
	(phone_plan_price (model sensation_xe) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model sensation_xe) (phoneprice 538.00) (plan iOne_Super_Value))
	(phone_plan_price (model sensation_xe) (phoneprice 438.00) (plan iOne_Plus))
	
	(phone_plan_price (model sensation_x1) (phoneprice 298.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model sensation_x1) (phoneprice 198.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model sensation_x1) (phoneprice 198.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model sensation_x1) (phoneprice 398.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model sensation_x1) (phoneprice 398.00) (plan iTwo_Value))
	(phone_plan_price (model sensation_x1) (phoneprice 298.00) (plan iTwo_Plus))
	(phone_plan_price (model sensation_x1) (phoneprice 198.00) (plan iThree_Plus))
	(phone_plan_price (model sensation_x1) (phoneprice 598.00) (plan iOne_Super_Value))
	(phone_plan_price (model sensation_x1) (phoneprice 498.00) (plan iOne_Plus))
	
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model wildfire_s) (phoneprice 100.00) (plan iOne_Super_Value))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00) (plan iOne_Plus))
	
	;Samsung
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_ace) (phoneprice 148.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_ace) (phoneprice 48.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_nexus) (phoneprice 388.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_nexus) (phoneprice 288.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_nexus) (phoneprice 288.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_nexus) (phoneprice 488.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_nexus) (phoneprice 488.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_nexus) (phoneprice 388.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_nexus) (phoneprice 288.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_nexus) (phoneprice 688.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_nexus) (phoneprice 588.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_note) (phoneprice 348.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_note) (phoneprice 198.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_note) (phoneprice 198.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_note) (phoneprice 498.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_note) (phoneprice 498.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_note) (phoneprice 348.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_note) (phoneprice 198.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_note) (phoneprice 798.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_note) (phoneprice 688.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 598.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 488.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 598.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 488.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 248.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 148.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 148.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 348.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 348.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 248.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 148.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 548.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_tab_7.0_plus) (phoneprice 448.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 348.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 248.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 248.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 448.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 448.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 348.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 248.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 648.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_tab_7.7) (phoneprice 548.00) (plan iOne_Plus))
	
	(phone_plan_price (model galaxy_w) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_w) (phoneprice 98.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_w) (phoneprice 98.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_w) (phoneprice 298.00) (plan iOne_Super_Value))
	(phone_plan_price (model galaxy_w) (phoneprice 198.00) (plan iOne_Plus))
	
	(phone_plan_price (model omnia_w) (phoneprice 48.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model omnia_w) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model omnia_w) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model omnia_w) (phoneprice 148.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model omnia_w) (phoneprice 148.00) (plan iTwo_Value))
	(phone_plan_price (model omnia_w) (phoneprice 48.00) (plan iTwo_Plus))
	(phone_plan_price (model omnia_w) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model omnia_w) (phoneprice 348.00) (plan iOne_Super_Value))
	(phone_plan_price (model omnia_w) (phoneprice 248.00) (plan iOne_Plus))
			 
  ; LG
	(phone_plan_price (model optimus_3d) (phoneprice 98.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_3d) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_3d) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_3d) (phoneprice 198.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_3d) (phoneprice 198.00) (plan iTwo_Value))
	(phone_plan_price (model optimus_3d) (phoneprice 98.00) (plan iTwo_Plus))
	(phone_plan_price (model optimus_3d) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model optimus_3d) (phoneprice 398.00) (plan iOne_Super_Value))
	(phone_plan_price (model optimus_3d) (phoneprice 298.00) (plan iOne_Plus))
	
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iOne_Super_Value))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iOne_Plus))
	
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model optimus_hub) (phoneprice 100.00) (plan iOne_Super_Value))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00) (plan iOne_Plus))
	
	(phone_plan_price (model optimus_sol) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_sol) (phoneprice 38.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_sol) (phoneprice 38.00) (plan iTwo_Value))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model optimus_sol) (phoneprice 238.00) (plan iOne_Super_Value))
	(phone_plan_price (model optimus_sol) (phoneprice 138.00) (plan iOne_Plus))
	
	(phone_plan_price (model parada) (phoneprice 278.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model parada) (phoneprice 178.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model parada) (phoneprice 178.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model parada) (phoneprice 378.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model parada) (phoneprice 378.00) (plan iTwo_Value))
	(phone_plan_price (model parada) (phoneprice 278.00) (plan iTwo_Plus))
	(phone_plan_price (model parada) (phoneprice 178.00) (plan iThree_Plus))
	(phone_plan_price (model parada) (phoneprice 578.00) (plan iOne_Super_Value))
	(phone_plan_price (model parada) (phoneprice 478.00) (plan iOne_Plus))
			 
  ; Motorola
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model defy_plus) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model defy_plus) (phoneprice 198.00) (plan iOne_Super_Value))
	(phone_plan_price (model defy_plus) (phoneprice 98.00) (plan iOne_Plus))
	
	(phone_plan_price (model razr) (phoneprice 148.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model razr) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model razr) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model razr) (phoneprice 298.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model razr) (phoneprice 298.00) (plan iTwo_Value))
	(phone_plan_price (model razr) (phoneprice 148.00) (plan iTwo_Plus))
	(phone_plan_price (model razr) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model razr) (phoneprice 548.00) (plan iOne_Super_Value))
	(phone_plan_price (model razr) (phoneprice 488.00) (plan iOne_Plus))
)

;;*********************
;;* PERSONALITY RULES *
;;*********************
(defrule func_or_design
  (question (order prefer_func) (selection ?sel))
  =>
  (switch ?sel 
   (case s1 then ;android more functionality
    (assert (requirement (name os)(value android)(weightage 100.0))))
	  (case s2 then ; assuming lg has nicer designs
    (assert (requirement (name brand)(value lg)(weightage 100.0))))
	  (case s3 then 
    (assert (requirement (name brand)(value lg)(weightage 100.0)))
    (assert (requirement (name os)(value android)(weightage 100.0))))
  )
)
  
(defrule user_types
  (question (order user_type) (selection ?sel))
  =>
  (switch ?sel 
   (case s1 then ); uninvolved users, do nothing   
	  (case s2 then ; basic usage
    (assert (requirement (name os)(value windows)(weightage 100.0)))
    (assert (requirement (name brand)(value samsung)(weightage 100.0))))
	  (case s3 then ; intense usage
    (assert (requirement (name memory)(value 32)(weightage 100.0)))
    (assert (requirement (name screen)(value 3.2)(weightage 100.0)))
    (assert (requirement (name weight)(value 30.0)(weightage 100.0))))
   (case s4 then ; fore runners
    (assert (requirement (name os)(value android)(weightage 100.0)))
    (assert (requirement (name memory)(value 64)(weightage 100.0)))
    (assert (requirement (name screen)(value 3.7)(weightage 100.0)))
    (assert (requirement (name videoHD)(value yes)(weightage 100.0))))
  )
)

(defrule user-sayings
  (question (order user_saying) (selection ?sel))
  =>
  (switch ?sel 
   (case s1 then ; moderation in all things 
    (assert (requirement (name os)(value windows)(weightage 100.0))))
	  (case s2 then ; time is money
    (assert (requirement (name os)(value android)(weightage 100.0))))
	  (case s3 then ; viva la difference, celebrate diversity
    (assert (requirement (name os)(value meego)(weightage 100.0))))
   (case s4 then ; you only live once
    (assert (requirement (name os)(value symbian)(weightage 100.0))))
  )
)

(defrule user-attitudes
  (question (order user_attitude) (selection ?sel))
  =>
  (switch ?sel
   (case s1 then ; live, laugh, love
    (assert (requirement (name brand)(value samsung)(weightage 100.0))))
	  (case s2 then ; enduring and constant 
    (assert (requirement (name brand)(value nokia)(weightage 100.0))))
	  (case s3 then ; fashions fade, but style is eternal
    (assert (requirement (name brand)(value lg)(weightage 100.0))))
   (case s4 then ; dare to be different
    (assert (requirement (name brand)(value motorola)(weightage 100.0))))
   (case 5 then ; better quality, better product
    (assert (requirement (name brand)(value htc)(weightage 100.0))))
  )
)


;;********************
;;* PREFERENCE RULES *
;;********************
(defrule use_camera
  (question (order use_camera)(selection ?sel))
  
  =>
  (if (eq ?sel yes) then
	(assert (requirement (name pixel)(value 5.0)(weightage 100.0)))
	(assert (requirement (name flash)(value yes)(weightage 100.0)))
	(assert (requirement (name flash)(value no)(weightage 0.0)))
	(assert (requirement (name videoHD)(value yes)(weightage 100.0)))
	(assert (requirement (name videoHD)(value no)(weightage 0.0))))
)

(defrule game_internet
  (question (order game_internet)(selection ?sel))
  =>
  (if (eq ?sel yes) then
    (assert (requirement (name screen)(value 4.3)(weightage 100.0)))
	(assert (requirement (name screen)(value 3.7)(weightage 75.0)))
	(assert (requirement (name screen)(value 3.5)(weightage 50.0)))
	(assert (requirement (name screen)(value 2.6)(weightage 25.0)))
	(assert (requirement (name screen)(value 2.4)(weightage 0.0)))
	(assert (requirement (name wifi)(value yes)(weightage 100.0)))
	(assert (requirement (name wifi)(value no)(weightage 0.0))))
)

(defrule view_picture
  (question (order view_picture)(selection ?sel))
  =>
  (if (eq ?sel yes) then
    (assert (requirement (name screen)(value 4.3)(weightage 100.0)))
	(assert (requirement (name screen)(value 3.7)(weightage 75.0)))
	(assert (requirement (name screen)(value 3.5)(weightage 50.0)))
	(assert (requirement (name screen)(value 2.6)(weightage 25.0)))
	(assert (requirement (name screen)(value 2.4)(weightage 0.0)))
	(assert (requirement (name memory)(value 32)(weightage 100.0))))
)

(defrule listen_music
  (question (order listen_music)(selection ?sel))
  =>
  (if (eq ?sel yes) then
	(assert (requirement (name memory)(value 32)(weightage 100.0)))
	(assert (requirement (name fm)(value yes)(weightage 100.0)))
	(assert (requirement (name fm)(value no)(weightage 0.0))))
)

(defrule watch_movie
  (question (order watch_movie)(selection ?sel))
  =>
  (if (eq ?sel yes) then
    (assert (requirement (name screen)(value 4.3)(weightage 100.0)))
	(assert (requirement (name screen)(value 3.7)(weightage 75.0)))
	(assert (requirement (name screen)(value 3.5)(weightage 50.0)))
	(assert (requirement (name screen)(value 2.6)(weightage 25.0)))
	(assert (requirement (name screen)(value 2.4)(weightage 0.0)))
	(assert (requirement (name memory)(value 32) (weightage 100.0))))
)

;;****************************
;;* INITIALIZE RREQUIREMENTS *
;;****************************
(defrule initi-requirement-brands
  (phone (brand ?brVal))
  (not (exists(requirement (name brand)(value ?brVal))))
  =>
  (assert (requirement (name brand)(value ?brVal)(weightage 0.0)))
)

(defrule initi-requirement-os
  (phone (os ?osVal))
  (not (exists(requirement (name os)(value ?osVal))))
  =>
  (assert (requirement (name os)(value ?osVal)(weightage 0.0)))
)

(defrule initi-requirement-pixel
  (phone (pixel ?piVal))
  (not (exists(requirement (name pixel)(value ?piVal))))
  =>
  (assert (requirement (name pixel)(value ?piVal)(weightage 0.0)))
)

(defrule initi-requirement-flash
  (phone (flash ?flVal))
  (not (exists(requirement (name flash)(value ?flVal))))
  =>
  (assert (requirement (name flash)(value ?flVal)(weightage 0.0)))
)


(defrule initi-requirement-videoHD
  (phone (videoHD ?viVal))
  (not (exists(requirement (name videoHD)(value ?viVal))))
  =>
  (assert (requirement (name videoHD)(value ?viVal)(weightage 0.0)))
)

(defrule initi-requirement-screen
  (phone (screen ?scVal))
  (not (exists(requirement (name screen)(value ?scVal))))
  =>
  (assert (requirement (name screen)(value ?scVal)(weightage 0.0)))
)

(defrule initi-requirement-weight
  (phone (weight ?weVal))
  (not (exists(requirement (name weight)(value ?weVal))))
  =>
  (assert (requirement (name weight)(value ?weVal)(weightage 0.0)))
)

(defrule initi-requirement-memory
  (phone (memory ?meVal))
  (not (exists(requirement (name memory)(value ?meVal))))  
  =>
  (assert (requirement (name memory)(value ?meVal)(weightage 0.0)))
)

(defrule initi-requirement-wifi
  (phone (wifi ?wiVal))
  (not (exists(requirement (name wifi)(value ?wiVal))))
  =>
  (assert (requirement (name wifi)(value ?wiVal)(weightage 0.0)))
)

(defrule initi-requirement-fm
  (phone (fm ?fmVal))
  (not (exists(requirement (name fm)(value ?fmVal))))
  =>
  (assert (requirement (name fm)(value ?fmVal)(weightage 0.0)))
)


(defrule calculate-weightage
  ; calculate weight of phone by taking average
  (requirement (name brand)  (value ?brVal)(weightage ?weightage-br))
  (requirement (name os)     (value ?osVal)(weightage ?weightage-os))
  (requirement (name pixel)  (value ?piVal)(weightage ?weightage-pi))
  (requirement (name flash)  (value ?flVal)(weightage ?weightage-fl))
  (requirement (name videoHD)(value ?viVal)(weightage ?weightage-vi))
  (requirement (name screen) (value ?scVal)(weightage ?weightage-sc))
  (requirement (name weight) (value ?weVal)(weightage ?weightage-we))
  (requirement (name memory) (value ?meVal)(weightage ?weightage-me))
  (requirement (name wifi)   (value ?wiVal)(weightage ?weightage-wi))
  (requirement (name fm)     (value ?fmVal)(weightage ?weightage-fm))
  (phone (model ?moVal)(brand ?brVal)
					   (os ?osVal)
					   (pixel ?piVal)
					   (flash ?flVal)
					   (videoHD ?viVal)
					   (screen ?scVal)
					   (weight ?weVal)
					   (memory ?meVal)
					   (wifi ?wiVal)
					   (fm ?fmVal))
  ?phone-weightage <-(phone-weightage(model ?moVal))
  =>
  (bind ?new-weightage (/ (+ ?weightage-br
						  (+ ?weightage-os
						  (+ ?weightage-pi 
						  (+ ?weightage-fl 
						  (+ ?weightage-vi 
						  (+ ?weightage-sc 
						  (+ ?weightage-we
						  (+ ?weightage-me
						  (+ ?weightage-wi 
						     ?weightage-fm))))))))) 10))
  (modify ?phone-weightage (weightage ?new-weightage))
)

(defrule combine-weightage
  ; take average of two weightage if there is two rule with similar attribute and value
  ?rem1 <- (requirement (name ?attribute)(value ?val)(weightage ?weightage1))
  ?rem2 <- (requirement (name ?attribute)(value ?val)(weightage ?weightage2))
  (test (neq ?rem1 ?rem2))
  =>
  (retract ?rem1)
  (if (eq (or ?weightage1 ?weightage2) 0) then
  (modify ?rem2 (weightage (max ?weightage1 ?weightage2)))
  else
  (modify ?rem2 (weightage (/ (+ ?weightage1 ?weightage2) 2))))
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
		(if (eq ?os nil)
			then
			(eq ?p:os ?p:os)
			else
			(eq ?p:os ?os))
		(if (eq ?screen nil)
			then
			(eq ?p:screen ?p:screen)
			else
			(eq ?p:screen ?screen))
		(if (eq ?fm nil)
			then
			(eq ?p:fm ?p:fm)
			else
			(eq ?p:fm ?fm))
		(if (eq ?video nil)
			then
			(eq ?p:videoHD ?p:videoHD)
			else
			(eq ?p:videoHD ?video))
		(if (eq ?camflash nil)
			then
			(eq ?p:flash ?p:flash)
			else
			(eq ?p:flash ?camflash))
		(if (eq ?mem nil)
			then
			(eq ?p:memory ?p:memory)
			else
			(eq ?p:memory ?mem))
		(if (eq ?weight nil)
			then
			(eq ?p:weight ?p:weight)
			else
			(eq ?p:weight ?weight))
		(if (eq ?campixel nil)
			then
			(eq ?p:pixel ?p:pixel)
			else
			(eq ?p:pixel ?campixel))
		(if (eq ?color nil)
			then
			(eq ?p:color ?p:color)
			else
			(eq ?p:color ?color))
		(if (eq ?wifi nil)
			then
			(eq ?p:wifi ?p:wifi)
			else
			(eq ?p:wifi ?wifi))
		(if (eq ?camzoom nil)
			then
			(eq ?p:zoom ?p:zoom)
			else
			(eq ?p:zoom ?camzoom))
	)
  ))
)
 
(deffunction get-requirement-list ()
  (bind ?facts (find-all-facts((?p requirement)) TRUE))
)
