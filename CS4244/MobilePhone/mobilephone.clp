;;*************
;;* TEMPLATES *
;;*************
(deftemplate phase
	(slot stage (type INTEGER)(default 0))
)

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

(deftemplate phone_plan ; only consider plans with data bundled
	(slot plan (type SYMBOL)) ; name of plan
	(slot provider (type SYMBOL)) ; M1, Singtel, Starhub
	(slot planprice (type FLOAT))
	(slot outgoing (type INTEGER))
	(slot sms (type INTEGER))
	(slot data (type INTEGER))
)

(deftemplate requirement_phone
	(slot attribute (type SYMBOL))
	(slot value)
	(slot weightage (type FLOAT)(default 0.0))
	(slot phase     (type INTEGER)(default 0))
)

(deftemplate requirement_plan
	(slot attribute (type SYMBOL))
	(slot value)
	(slot weightage (type FLOAT)(default 0.0))
	(slot phase     (type INTEGER)(default 0))	
)

(deftemplate weightage_phone
	(slot model)
	(slot weightage (type FLOAT)(default 0.0))
)

(deftemplate weightage_plan
	(slot plan (type SYMBOL))
	(slot weightage (type FLOAT)(default 0.0))
)

(deftemplate weightage_phone_plan
	(slot model)
	(slot plan (type SYMBOL))
	(slot weightage (type FLOAT)(default 0.0))
)

(deftemplate question
	(slot order (type SYMBOL))
	(slot selection (type SYMBOL))
	(slot phase (type INTEGER)(default 0))
)

(deftemplate phone_plan_price
	(slot model)
	(slot phoneprice (type FLOAT))
	(slot plan (type SYMBOL))
)

;;*********
;;* FACTS *
;;*********

(deffacts init_phase_facts
	(phase(stage 0))
)


(deffacts init_phone_facts
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
  ; HTC
  (phone (model Chacha)(price 280.00)
         (brand htc)(color black)(screen 2.6)(weight 120.0)(memory 32)
         (os android)(bluetooth yes)(fm yes)
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
)

;Phone Plans
(deffacts init_phone_plans_facts
;SINGTEL
	(phone_plan (plan 3G_Flexi_Value)  (provider singtel) (planprice 59.90) (outgoing 200) (sms 650) (data 12))
	(phone_plan (plan 3G_Flexi_Premium)(provider singtel) (planprice 205.00)(outgoing 2000)(sms 2000)(data 30))
	(phone_plan (plan 3G_Flexi_Plus)   (provider singtel) (planprice 99.90) (outgoing 500) (sms 700) (data 12))
	(phone_plan (plan 3G_Flexi_Lite)   (provider singtel) (planprice 39.90) (outgoing 100) (sms 550) (data 12))
;STARHUB
	(phone_plan (plan SmartSurf_100)       (provider starhub) (planprice 38.00) (outgoing 100) (sms 500) (data 12))
	(phone_plan (plan SmartSurf_300)       (provider starhub) (planprice 58.00) (outgoing 300) (sms 500) (data 12))
	(phone_plan (plan SmartSurf_700)       (provider starhub) (planprice 98.00) (outgoing 700) (sms 500) (data 12))
	(phone_plan (plan SmartSurf_unlimited) (provider starhub) (planprice 205.00)(outgoing 2000)(sms 2000)(data 100))
	(phone_plan (plan i2Surf_100)          (provider starhub) (planprice 38.00) (outgoing 100) (sms 500) (data 1))
	(phone_plan (plan i2Surf_300)          (provider starhub) (planprice 58.00) (outgoing 300) (sms 500) (data 2))
	(phone_plan (plan i2Surf_700)          (provider starhub) (planprice 98.00) (outgoing 700) (sms 500) (data 5))
;M1
	(phone_plan (plan ValueSurf)  (provider m1)(planprice 39.00) (outgoing 100) (sms 500) (data 12))
	(phone_plan (plan LiteSurf)   (provider m1)(planprice 55.00) (outgoing 250) (sms 500) (data 12))
	(phone_plan (plan ExtremeSurf)(provider m1)(planprice 95.00) (outgoing 600) (sms 500) (data 12))
	
	;;(phone_plan (plan iTwo_Value) (provider singtel) (planprice 48.15) (outgoing 300) (sms 500) (data 0))
	;;(phone_plan (plan iTwo_Plus) (provider singtel) (planprice 82.93) (outgoing 700) (sms 500) (data 0))
	;;(phone_plan (plan iThree_Plus) (provider singtel) (planprice 192.60) (outgoing 2000) (sms 2000) (data 0))
	;;(phone_plan (plan iOne_Super_Value) (provider singtel) (planprice 15.00) (outgoing 80) (sms 50) (data 0))
	;;(phone_plan (plan iOne_Plus) (provider singtel) (planprice 25.68) (outgoing 100) (sms 500) (data 0))
)

;Phone Plan Price
(deffacts init_phone_plan_price-facts
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
	
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model 603) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model 603) (phoneprice 148.00)(plan iOne_Super_Value))
	(phone_plan_price (model 603) (phoneprice 48.00) (plan iOne_Plus))
	
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model lumia_710) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model lumia_710) (phoneprice 198.00)(plan iOne_Super_Value))
	(phone_plan_price (model lumia_710) (phoneprice 98.00) (plan iOne_Plus))
	
	(phone_plan_price (model lumia_800) (phoneprice 98.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model lumia_800) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model lumia_800) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model lumia_800) (phoneprice 248.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model lumia_800) (phoneprice 248.00)(plan iTwo_Value))
	(phone_plan_price (model lumia_800) (phoneprice 98.00) (plan iTwo_Plus))
	(phone_plan_price (model lumia_800) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model lumia_800) (phoneprice 498.00)(plan iOne_Super_Value))
	(phone_plan_price (model lumia_800) (phoneprice 398.00)(plan iOne_Plus))
	
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model N9_16) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model N9_16) (phoneprice 198.00)(plan iOne_Super_Value))
	(phone_plan_price (model N9_16) (phoneprice 98.00) (plan iOne_Plus))
	
	(phone_plan_price (model N9_64) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model N9_64) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model N9_64) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model N9_64) (phoneprice 98.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model N9_64) (phoneprice 98.00) (plan iTwo_Value))
	(phone_plan_price (model N9_64) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model N9_64) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model N9_64) (phoneprice 298.00)(plan iOne_Super_Value))
	(phone_plan_price (model N9_64) (phoneprice 198.00)(plan iOne_Plus))
	
	;;HTC
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model Chacha) (phoneprice 100.00)(plan iOne_Super_Value))
	(phone_plan_price (model Chacha) (phoneprice 0.00)  (plan iOne_Plus))
	
	(phone_plan_price (model radar) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model radar) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model radar) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model radar) (phoneprice 68.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model radar) (phoneprice 68.00) (plan iTwo_Value))
	(phone_plan_price (model radar) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model radar) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model radar) (phoneprice 268.00)(plan iOne_Super_Value))
	(phone_plan_price (model radar) (phoneprice 168.00)(plan iOne_Plus))
	
	(phone_plan_price (model rhyme) (phoneprice 0.00)   (plan 3G_Flexi_Value))
	(phone_plan_price (model rhyme) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model rhyme) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model rhyme) (phoneprice 98.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model rhyme) (phoneprice 98.00) (plan iTwo_Value))
	(phone_plan_price (model rhyme) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model rhyme) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model rhyme) (phoneprice 348.00)(plan iOne_Super_Value))
	(phone_plan_price (model rhyme) (phoneprice 248.00)(plan iOne_Plus))
	
	(phone_plan_price (model sensation_xe) (phoneprice 138.00)(plan 3G_Flexi_Value))
	(phone_plan_price (model sensation_xe) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model sensation_xe) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model sensation_xe) (phoneprice 288.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model sensation_xe) (phoneprice 288.00)(plan iTwo_Value))
	(phone_plan_price (model sensation_xe) (phoneprice 138.00)(plan iTwo_Plus))
	(phone_plan_price (model sensation_xe) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model sensation_xe) (phoneprice 538.00)(plan iOne_Super_Value))
	(phone_plan_price (model sensation_xe) (phoneprice 438.00)(plan iOne_Plus))
	
	(phone_plan_price (model sensation_x1) (phoneprice 298.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model sensation_x1) (phoneprice 198.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model sensation_x1) (phoneprice 198.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model sensation_x1) (phoneprice 398.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model sensation_x1) (phoneprice 398.00) (plan iTwo_Value))
	(phone_plan_price (model sensation_x1) (phoneprice 298.00) (plan iTwo_Plus))
	(phone_plan_price (model sensation_x1) (phoneprice 198.00) (plan iThree_Plus))
	(phone_plan_price (model sensation_x1) (phoneprice 598.00) (plan iOne_Super_Value))
	(phone_plan_price (model sensation_x1) (phoneprice 498.00) (plan iOne_Plus))
	
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model wildfire_s) (phoneprice 100.00)(plan iOne_Super_Value))
	(phone_plan_price (model wildfire_s) (phoneprice 0.00)  (plan iOne_Plus))
	
	;Samsung
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model galaxy_ace) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model galaxy_ace) (phoneprice 148.00)(plan iOne_Super_Value))
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
	
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00)(plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00)(plan iTwo_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00)(plan iTwo_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 598.00)(plan iOne_Super_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 488.00)(plan iOne_Plus))
	
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00)(plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 348.00)(plan iTwo_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 198.00)(plan iTwo_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 48.00) (plan iThree_Plus))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 598.00)(plan iOne_Super_Value))
	(phone_plan_price (model galaxy_s_ii) (phoneprice 488.00)(plan iOne_Plus))
	
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
	
	(phone_plan_price (model galaxy_w) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model galaxy_w) (phoneprice 98.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model galaxy_w) (phoneprice 98.00) (plan iTwo_Value))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model galaxy_w) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model galaxy_w) (phoneprice 298.00)(plan iOne_Super_Value))
	(phone_plan_price (model galaxy_w) (phoneprice 198.00)(plan iOne_Plus))
	
	(phone_plan_price (model omnia_w) (phoneprice 48.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model omnia_w) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model omnia_w) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model omnia_w) (phoneprice 148.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model omnia_w) (phoneprice 148.00)(plan iTwo_Value))
	(phone_plan_price (model omnia_w) (phoneprice 48.00) (plan iTwo_Plus))
	(phone_plan_price (model omnia_w) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model omnia_w) (phoneprice 348.00)(plan iOne_Super_Value))
	(phone_plan_price (model omnia_w) (phoneprice 248.00)(plan iOne_Plus))
			 
  ; LG
	(phone_plan_price (model optimus_3d) (phoneprice 98.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_3d) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_3d) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_3d) (phoneprice 198.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_3d) (phoneprice 198.00)(plan iTwo_Value))
	(phone_plan_price (model optimus_3d) (phoneprice 98.00) (plan iTwo_Plus))
	(phone_plan_price (model optimus_3d) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model optimus_3d) (phoneprice 398.00)(plan iOne_Super_Value))
	(phone_plan_price (model optimus_3d) (phoneprice 298.00)(plan iOne_Plus))
	
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iTwo_Value))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iTwo_Plus))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iThree_Plus))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iOne_Super_Value))
	(phone_plan_price (model optimus_chic) (phoneprice 0.00) (plan iOne_Plus))
	
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model optimus_hub) (phoneprice 100.00)(plan iOne_Super_Value))
	(phone_plan_price (model optimus_hub) (phoneprice 0.00)  (plan iOne_Plus))
	
	(phone_plan_price (model optimus_sol) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model optimus_sol) (phoneprice 38.00) (plan 3G_Flexi_Lite))
	(phone_plan_price (model optimus_sol) (phoneprice 38.00) (plan iTwo_Value))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model optimus_sol) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model optimus_sol) (phoneprice 238.00)(plan iOne_Super_Value))
	(phone_plan_price (model optimus_sol) (phoneprice 138.00)(plan iOne_Plus))
	
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
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan 3G_Flexi_Value))
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan 3G_Flexi_Lite))
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan iTwo_Value))
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan iTwo_Plus))
	(phone_plan_price (model defy_plus) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model defy_plus) (phoneprice 198.00)(plan iOne_Super_Value))
	(phone_plan_price (model defy_plus) (phoneprice 98.00) (plan iOne_Plus))
	
	(phone_plan_price (model razr) (phoneprice 148.00)(plan 3G_Flexi_Value))
	(phone_plan_price (model razr) (phoneprice 0.00)  (plan 3G_Flexi_Premium))
	(phone_plan_price (model razr) (phoneprice 0.00)  (plan 3G_Flexi_Plus))
	(phone_plan_price (model razr) (phoneprice 298.00)(plan 3G_Flexi_Lite))
	(phone_plan_price (model razr) (phoneprice 298.00)(plan iTwo_Value))
	(phone_plan_price (model razr) (phoneprice 148.00)(plan iTwo_Plus))
	(phone_plan_price (model razr) (phoneprice 0.00)  (plan iThree_Plus))
	(phone_plan_price (model razr) (phoneprice 548.00)(plan iOne_Super_Value))
	(phone_plan_price (model razr) (phoneprice 488.00)(plan iOne_Plus))
	
	
	;;M1
	;Nokia
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan ValueSurf_100))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan ValueSurf_300))
	(phone_plan_price (model lumia_710) (phoneprice 0.00) (plan ValueSurf_700))
	
	(phone_plan_price (model lumia_800) (phoneprice 248.00)(plan ValueSurf_100))
	(phone_plan_price (model lumia_800) (phoneprice 148.00)(plan ValueSurf_300))
	(phone_plan_price (model lumia_800) (phoneprice 0.00)  (plan ValueSurf_700))
	
	
)

;;*********************
;;* PERSONALITY RULES *
;;*********************
(defrule functional_or_design
  (question (order prefer_func) (selection ?sel))
  =>
  (switch ?sel 
    (case s1 then ;android more functionality
      (assert (requirement_phone (attribute os)(value android)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)(value windows)(weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value symbian)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value meego)  (weightage 20.0) (phase 1)))
    )
    (case s2 then ; assuming lg has nicer designs
      (assert (requirement_phone (attribute brand)(value LG)      (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value samsung) (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value motorola)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 20.0) (phase 1)))
	)
    (case s3 then 
      (assert (requirement_phone (attribute os)   (value android) (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)   (value windows) (weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)   (value symbian) (weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)   (value meego)   (weightage 20.0) (phase 1)))   
      (assert (requirement_phone (attribute brand)(value lg)      (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value samsung) (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value motorola)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 20.0) (phase 1)))
	)
  )
)
  
(defrule user_types
  (question (order user_type) (selection ?sel))
  =>
  (switch ?sel 
    (case s1 then 
      ; uninvolved users, do nothing
    )   
    (case s2 then ; basic usage
      (assert (requirement_phone (attribute os)   (value meego)   (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)   (value symbian) (weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)   (value windows) (weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)   (value android) (weightage 20.0) (phase 1)))   
      (assert (requirement_phone (attribute brand)(value motorola)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value lg)      (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value samsung) (weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 20.0) (phase 1)))
	)
    (case s3 then ; intense usage
      (assert (requirement_phone (attribute memory)(value large)(phase 1)))
      (assert (requirement_phone (attribute screen)(value large)(phase 1)))
      (assert (requirement_phone (attribute weight)(value light)(phase 1)))
	)
    (case s4 then ; fore runners
      (assert (requirement_phone (attribute os)     (value android)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)     (value windows)(weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)     (value symbian)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)     (value meego)  (weightage 20.0) (phase 1))) 
      (assert (requirement_phone (attribute memory) (value large)                   (phase 1)))
      (assert (requirement_phone (attribute screen) (value large)                   (phase 1)))
      (assert (requirement_phone (attribute videoHD)(value yes)                     (phase 1)))
	)
  )
)

(defrule user_attitudes
  (question (order user_attitude) (selection ?sel))
  =>
  (switch ?sel 
    (case s1 then ; moderation in all things 
      (assert (requirement_phone (attribute os)(value windows)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)(value android)(weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value symbian)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value meego)  (weightage 20.0) (phase 1))) 
	)
    (case s2 then ; time is money
      (assert (requirement_phone (attribute os)(value android)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)(value windows)(weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value symbian)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value meego)  (weightage 20.0) (phase 1))) 
	)
    (case s3 then ; viva la difference, celebrate diversity
      (assert (requirement_phone (attribute os)(value symbian)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)(value android)(weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value windows)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value meego)  (weightage 20.0) (phase 1))) 
	)
    (case s4 then ; you only live once
      (assert (requirement_phone (attribute os)(value meego)  (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute os)(value symbian)(weightage 70.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value windows)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute os)(value android)(weightage 20.0) (phase 1))) 
	)
  )
)

(defrule user_sayings
  (question (order user_saying) (selection ?sel))
  =>
  (switch ?sel
    (case s1 then ; live, laugh, love
      (assert (requirement_phone (attribute brand)(value lg)      (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value motorola)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value sumsang) (weightage 20.0) (phase 1)))
    )
    (case s2 then ; enduring and constant 
      (assert (requirement_phone (attribute brand)(value nokia)   (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value motorola)(weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value lg)      (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value samsung) (weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 20.0) (phase 1)))
	)
    (case s3 then ; fashions fade, but style is eternal
      (assert (requirement_phone (attribute brand)(value htc)     (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value motorola)(weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value lg)      (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value samsung) (weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 20.0) (phase 1)))
	)
    (case s4 then ; dare to be different
      (assert (requirement_phone (attribute brand)(value motorola)(weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value samsung) (weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value lg)      (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 20.0) (phase 1)))
    )
    (case s5 then ; better quality, better product
      (assert (requirement_phone (attribute brand)(value samsung) (weightage 100.0)(phase 1)))
	  (assert (requirement_phone (attribute brand)(value nokia)   (weightage 80.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value lg)      (weightage 60.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value motorola)(weightage 40.0) (phase 1)))
	  (assert (requirement_phone (attribute brand)(value htc)     (weightage 20.0) (phase 1)))
    )
  )
)
(defrule student_nsf
  (question (order is_student) (selection ?sel))
  =>
  (switch ?sel 
   (case s1 then ; yes
	(assert (requirement_plan (attribute fee)(value 40.0)(weightage 100.0)(phase 1)))
    	(assert (requirement_plan (attribute sms)(value 600)(weightage 100.0)(phase 1))))
   (case s2 then ; no
    	(assert (requirement_plan (attribute fee)(value 80.0)(weightage 100.0)(phase 1)))
    	(assert (requirement_plan (attribute sms)(value 300)(weightage 100.0)(phase 1))))
  )
)

(defrule introvert_extrovert
  (question (order intro_extro) (selection ?sel))
  =>
  (switch ?sel 
   (case s1 then ; introvert
	(assert (requirement_plan (attribute data)(value 12)(weightage 100.0)(phase 1))))
   (case s2 then ; extrovert
    	(assert (requirement_plan (attribute outgoing)(value 400)(weightage 100.0)(phase 1)))
    	(assert (requirement_plan (attribute sms)(value 300)(weightage 100.0)(phase 1))))
  )
)

(defrule talk_sms
  (question (order talk_or_sms) (selection ?sel))
  =>
  (switch ?sel 
   (case s1 then ; prefer talking
	(assert (requirement_plan (attribute outgoing)(value 700)(weightage 100.0)(phase 1))))
   (case s2 then ; prefer sms-ing
    	(assert (requirement_plan (attribute sms)(value 600)(weightage 100.0)(phase 1))))
  )
)

(defrule check_age
(question (order user_age) (selection ?sel))
=>
(switch ?sel 
  (case s1 then ; < 18
		   (assert (requirement_plan (attribute fee)(value 20.0)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute sms)(value 600)(weightage 100.0)(phase 1))))
  (case s2 then ; 18-29
           (assert (requirement_plan (attribute fee)(value 35.0)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute sms)(value 800)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute data)(value 4)(weightage 100.0)(phase 1))))

  (case s3 then ; 30 - 49
           (assert (requirement_plan (attribute fee)(value 60.0)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute sms)(value 300)(weightage 100.0)(phase 1))))
  (case s4 then ; > 49
           (assert (requirement_plan (attribute fee)(value 90.0)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute outgoing)(value 400)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute brand)(value motorola)(weightage 100.0)(phase 1))))
 )
)

(defrule check_gender
 (question (order user_gender) (selection ?sel))
 =>
 (switch ?sel 
  (case s1 then ; Male
       (assert (requirement_plan (attribute os )(value android)(weightage 100.0)(phase 1))))
  (case s2 then ; Female
           (assert (requirement_plan (attribute brand)(value lg)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute outgoing)(value 300)(weightage 100.0)(phase 1)))
           (assert (requirement_plan (attribute pixel)(value 5.0)(weightage 100.0)(phase 1))))
 )
)


;;********************
;;* PREFERENCE RULES *
;;********************
(defrule use_camera
  (question (order use_camera)(selection ?sel))
  =>
  (if (eq ?sel yes) then
	(assert (requirement_phone (attribute pixel)  (value high)(phase 3)))
	(assert (requirement_phone (attribute flash)  (value yes) (phase 3)))
	(assert (requirement_phone (attribute videoHD)(value yes) (phase 3)))
   )
  (if (eq ?sel no) then
	(assert (requirement_phone (attribute pixel)  (value not_impt)(phase 3)))
	(assert (requirement_phone (attribute flash)  (value not_impt)(phase 3)))
	(assert (requirement_phone (attribute videoHD)(value not_impt)(phase 3)))
   )
)

(defrule game_internet
  (question (order game_internet)(selection ?sel))
  =>
  (if (eq ?sel yes) then
    (assert (requirement_phone (attribute screen)(value large)(phase 3)))
	(assert (requirement_phone (attribute wifi)  (value yes)  (phase 3)))
  )
  (if (eq ?sel no) then
    (assert (requirement_phone (attribute screen)(value not_impt)(phase 3)))
	(assert (requirement_phone (attribute wifi)  (value not_impt)(phase 3)))
   )  
)

(defrule view_picture
  (question (order view_picture)(selection ?sel))
  =>
  (if (eq ?sel yes) then
    (assert (requirement_phone (attribute screen)(value large)(phase 3)))
  ) 
  (if (eq ?sel no) then
    (assert (requirement_phone (attribute screen)(value not_impt)(phase 3)))
  )   
)

(defrule listen_music
  (question (order listen_music)(selection ?sel))
  =>
  (if (eq ?sel yes) then
	(assert (requirement_phone (attribute memory)(value large)(phase 3)))
	(assert (requirement_phone (attribute fm)    (value yes)  (phase 3)))
  )
  (if (eq ?sel no) then
	(assert (requirement_phone (attribute memory)(value not_impt)(phase 3)))
	(assert (requirement_phone (attribute fm)    (value not_impt)(phase 3)))
  )  
)

(defrule watch_movie
  (question (order watch_movie)(selection ?sel))
  =>
  (if (eq ?sel yes) then
    (assert (requirement_phone (attribute screen)(value large)(phase 3)))
	(assert (requirement_phone (attribute memory)(value large)(phase 3)))
	(assert (requirement_phone (attribute weight)(value light)(phase 3)))
  )
  (if (eq ?sel no) then
    (assert (requirement_phone (attribute screen)(value not_impt)(phase 3)))
	(assert (requirement_phone (attribute memory)(value not_impt)(phase 3)))
	(assert (requirement_phone (attribute weight)(value not_impt)(phase 3)))
  )  
)

;;**********************
;;* TRIAL RULES STAGES *
;;**********************
;; TO BE DELETED BEFORE HANDING IN
;(defrule user_personality
 ; (phase (stage 1))
 ; =>
 ;(assert (question (order prefer_func)  (selection s1)(phase 1)))
 ;(assert (question (order user_type)    (selection s1)(phase 1)))
 ;(assert (question (order user_attitude)(selection s2)(phase 1)))
 ;(assert (question (order user_saying)  (selection s3)(phase 1)))
;)

;(defrules user_personality
;  (phase (stage 3))
;  =>
;  (requirement_phone (attribute pixel)  (value large)(phase 3))
;  (requirement_phone (attribute flash)  (value yes)  (phase 3))
;  (requirement_phone (attribute videoHD)(value no)   (phase 3))
;  (requirement_phone (attribute screen) (value large)(phase 3))
;  (requirement_phone (attribute weight) (value light)(phase 3))
;  (requirement_phone (attribute memory) (value large)(phase 3))
;  (requirement_phone (attribute wifi)   (value yes)  (phase 3))
;  (requirement_phone (attribute fm)     (value yes)  (phase 3))
;)

;;*********************
;;* CALCULATION RULES *
;;*********************
(defrule calculate_weightage_phone
	(declare (salience 50))
  (phase (stage 4))
  (requirement_phone (attribute pixel)  (value ?pixel))
  (requirement_phone (attribute flash)  (value ?flash))
  (requirement_phone (attribute videoHD)(value ?videoHD))
  (requirement_phone (attribute screen) (value ?screen))
  (requirement_phone (attribute weight) (value ?weight))
  (requirement_phone (attribute memory) (value ?memory))
  (requirement_phone (attribute wifi)   (value ?wifi))
  (requirement_phone (attribute fm)     (value ?fm))  
  (requirement_phone (attribute os)     (value ?osVal)(weightage ?weightage-os))
  (requirement_phone (attribute brand)  (value ?brVal)(weightage ?weightage-br))
  (phone (model ?moVal)(brand ?brVal)(os ?osVal)(pixel ?piVal)
         (flash ?flVal)(videoHD ?viVal)(screen ?scVal)(weight ?weVal)
         (memory ?meVal)(wifi ?wiVal)(fm ?fmVal))
  =>
  (bind ?weightage-pi 100.0)
  (if (eq ?pixel large) then
    (if (< ?piVal 6.0) then 
	  (bind ?weightage-pi 50.0)
	)
	(if (< ?piVal 3.0) then 
	  (bind ?weightage-pi 20.0)
	)
  )
  (bind ?weightage-fl 100.0)
  (if (eq ?flash yes) then
	(if (eq ?flVal no) then 
	  (bind ?weightage-fl 0.0)
	)
  )
  (bind ?weightage-vi 100.0)
  (if (eq ?videoHD yes) then
	(if (eq ?viVal no) then 
	  (bind ?weightage-fl 0.0)
	)
  )
  (bind ?weightage-sc 100.0)
  (if (eq ?screen large) then
    (if (< ?scVal 4.0) then 
	  (bind ?weightage-sc 50.0)
	)
	(if (< ?scVal 3.0) then 
	  (bind ?weightage-sc 20.0)
	)
  )  
  (bind ?weightage-we 100.0)
  (if (eq ?weight light) then
    (if (> ?weVal 150.0) then 
	  (bind ?weightage-we 50.0)
	)
	(if (> ?weVal 200.0) then 
	  (bind ?weightage-we 20.0)
	)
  )
  (bind ?weightage-me 100.0)
  (if (eq ?memory large) then
	(if (< ?meVal 32) then 
	  (bind ?weightage-me 80.0)
	)
	(if (< ?meVal 24) then 
	  (bind ?weightage-me 60.0)
	)	
    (if (< ?meVal 16) then 
	  (bind ?weightage-me 40.0)
	)
	(if (< ?meVal 8) then 
	  (bind ?weightage-me 20.0)
	)
  ) 
  (bind ?weightage-wi 100.0)
  (if (eq ?wifi yes) then
	(if (eq ?wiVal no) then 
	  (bind ?weightage-wi 0.0)
	)
  )
  (bind ?weightage-fm 100.0)
  (if (eq ?fm yes) then
	(if (eq ?fmVal no) then 
	  (bind ?weightage-fm 0.0)
	)
  )  
  (bind ?new-weightage (/ (+ ?weightage-br (+ ?weightage-os 
                          (+ ?weightage-pi (+ ?weightage-fl 
						  (+ ?weightage-vi (+ ?weightage-sc 
                          (+ ?weightage-we (+ ?weightage-me 
						  (+ ?weightage-wi ?weightage-fm))))))))) 10))
  (assert (weightage_phone (model ?moVal)(weightage ?new-weightage)))
)

(defrule combine_weightage_A
  ; take average of two weightage if there is two rule with similar attribute and value
  (declare (salience 100))
  (phase (stage 4))  
  ?rem1 <- (requirement_phone (attribute ?attribute)(value ?val)(weightage ?weightage1))
  ?rem2 <- (requirement_phone (attribute ?attribute)(value ?val)(weightage ?weightage2))
  (test (neq ?rem1 ?rem2))
  =>
  (retract ?rem1)
  (if (eq (or ?weightage1 ?weightage2) 0) then
    (modify ?rem2 (weightage (max ?weightage1 ?weightage2)))
  else
    (modify ?rem2 (weightage (/ (+ ?weightage1 ?weightage2) 2)))
  )
)

(defrule combine_weightage_B
  ; take average of two weightage if there is two rule with similar attribute and value
  (declare (salience 100))
  (phase (stage 4))  
  ?rem1 <- (requirement_phone (attribute ?attribute)(value ?val1)(phase 3))
  ?rem2 <- (requirement_phone (attribute ?attribute)(value ?val2)(phase 3))
  (test (neq ?rem1 ?rem2))
  =>
  ;(retract ?rem1)
  (if (eq ?val1 not_impt) then
    (retract ?rem1)
  )
  (if (eq ?val2 not_impt) then
    (retract ?rem2)
  )
)

;;***************
;;* RESET RULES *
;;***************
(defrule reset_stage_one_requirement_phone
  (phase (stage 0))
  ?req <- (requirement_phone (phase ?stage))
  =>
  (if (eq ?stage 1) then
    (retract ?req)
  )
  (if (eq ?stage 3) then
    (retract ?req)
  )
)

(defrule reset_stage_one_requirement_plan
  ?phase <- (phase (stage 0))
  ?req <- (requirement_plan (phase ?stage))
  =>
  (if (eq ?stage 1) then
    (retract ?req)
  )
  (if (eq ?stage 3) then
    (retract ?req)
  )
)

(defrule reset_stage_one_questions
  (phase (stage 0))
  ?req <- (question (phase ?stage))
  =>
  (if (eq ?stage 1) then
    (retract ?req)
  )
  (if (eq ?stage 3) then
    (retract ?req)
  )
)

(defrule reset_stage_one_change_stage
  (declare (salience -10))
  ?phase <- (phase (stage 0))
  =>
  (modify ?phase (stage 1))
)

(defrule reset_stage_two_requirement_phone
  (declare (salience 100))
  (phase (stage 2))
  ?req <- (requirement_phone (phase 3))
  =>
  (retract ?req)  
)

(defrule reset_stage_two_requirement_plan
  (declare (salience 100))
  (phase (stage 2))
  ?req <- (requirement_plan (phase 3))
  =>
  (retract ?req)
)

(defrule reset_stage_two_question
  (declare (salience 100))
  (phase (stage 2))
  ?req <- (question (phase 3))
  =>
  (retract ?req)
)

(defrule reset_stage_two_change_stage
  (declare (salience -10))
  ?phase <- (phase (stage 2))
  =>
  (modify ?phase (stage 3))
)

(defrule remove_weightage_phone_for_recalculate
  ?weightage <- (weightage_phone(model ?moVal))
  (phase (stage ?stage))
  =>
  (if (< ?stage 4) then
    (retract ?weightage)
  )
)

(defrule remove_weightage_plan_for_recalculate
  ?weightage <- (weightage_plan(plan ?plVal))
  (phase (stage ?stage))
  =>
  (if (< ?stage 4) then
    (retract ?weightage)
  )
)

(defrule stage_four_change_stage
  (declare (salience -10))
  ?phase <- (phase (stage 4))
  =>
  (modify ?phase (stage 5))
)

;;*************
;;* FUNCTIONS *
;;*************
(deffunction get_mobilephone_list ()
  (bind ?facts (find-all-facts((?p phone)) TRUE))
)


(deffunction get_weightagephone_list ()
  (bind ?facts (find-all-facts((?p weightage_phone)) TRUE))
)

(deffunction get_mobileplan_list ()
  (bind ?facts (find-all-facts((?p phone_plan)) TRUE))
)

;;Not yet finished
(deffunction get_weightage_phone_plan_list ()
  (bind ?facts (find-all-facts((?p weightage_phone_plan)) 
  TRUE
  ))
)

(deffunction next_phase (?changephase)
	(find-all-facts((?p phase)) 
	  (switch ?changephase
		(case 1 then 
		  (modify ?p (stage 2))
		)  
		(case 3 then 
		  (modify ?p (stage 4))
		) 
		(case 5 then 
		  (modify ?p (stage 6))
		)
	   )
	)
)

(deffunction prev_phase (?changephase)
	(find-all-facts((?p phase)) 
	  (switch ?changephase
		(case 6 then 
		  (modify ?p (stage 5))
		)  
		(case 5 then 
		  (modify ?p (stage 2))
		) 
		(case 3 then 
		  (modify ?p (stage 0))
		)
	   )
	)
)


(deffunction update_phoneplan_list (?provider ?outgoing ?sms ?data)
	(bind ?facts(find-all-facts((?p phone_plan))
		(and
			(if (eq ?p:provider nil)
				then
				(eq ?p:provider ?p:provider)
				else
				(eq ?p:provider ?provider))
			(if (eq ?p:outgoing nil)
				then
				(eq ?p:outgoing ?p:outgoing)
				else
				(eq ?p:outgoing ?outgoing))
			(if (eq ?p:sms nil)
				then
				(eq ?p:sms ?p:sms)
				else
				(eq ?p:sms ?sms))
			(if (eq ?p:data nil)
				then
				(eq ?p:data ?p:data)
				else
				(eq ?p:data ?data))
		)
)))


(deffunction update_mobilephone_list (?os ?screen ?fm ?video ?camflash ?mem ?weight ?campixel ?color ?wifi ?camzoom)
  (bind ?facts(find-all-facts((?wp weightage_phone)(?p phone))
		(and
			(eq ?p:model ?wp:model)
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
	)
  )
)
 
(deffunction get_requirement_list ()
  (bind ?facts (find-all-facts((?p requirement_phone)) TRUE))
)
