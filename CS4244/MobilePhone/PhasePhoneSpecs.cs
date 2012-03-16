using Mommosoft.ExpertSystem;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Xml;
using System.Xml.XPath;

namespace MobilePhone
{
    public partial class MainForm : Form
    {
        List<String> listModel;
        List<float> listPrice;
        List<String> listBrand;
        List<String> listColor;
        List<float> listScreen;
        List<float> listWeight;
        List<int> listMem;
        List<String> listOS;
        List<String> listBluetooth;
        List<String> listWifi;
        List<String> listFM;
        List<int> listZoom;
        List<String> listFlash;
        List<String> listVideoHD;
        List<float> listPixel;

        public void ProcessPhoneSpecs()
        {
        }

        public void LoadPhaseDetailsDropdown()
        {
            //Collects a list of attributes from the phone fact list
            listModel = new List<String>();
            listPrice = new List<float>();
            listBrand = new List<String>();
            listColor = new List<String>();
            listScreen = new List<float>();
            listWeight = new List<float>();
            listMem = new List<int>();
            listOS = new List<String>();
            listBluetooth = new List<String>();
            listWifi = new List<String>();
            listFM = new List<String>();
            listZoom = new List<int>();
            listFlash = new List<String>();
            listVideoHD = new List<String>();
            listPixel = new List<float>();

            //Evaluate each fact and input the corresponding attributes for each phone
            string evalStr = "(get-mobilephone-list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);
            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];

                String sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                listModel.Add(sModel);

                float fPrice = (float)(FloatValue)fv.GetFactSlot("price");
                listPrice.Add(fPrice);

                String sBrand = (String)(SymbolValue)fv.GetFactSlot("brand");
                listBrand.Add(sBrand);

                String sColor = (String)(SymbolValue)fv.GetFactSlot("color");
                listColor.Add(sColor);

                float fScreen = (float)(FloatValue)fv.GetFactSlot("screen");
                listScreen.Add(fScreen);

                float fWeight = (float)(FloatValue)fv.GetFactSlot("weight");
                listWeight.Add(fWeight);

                int iMem = (int)(IntegerValue)fv.GetFactSlot("memory");
                listMem.Add(iMem);

                String sOS = (String)(SymbolValue)fv.GetFactSlot("os");
                listOS.Add(sOS);

                String sBluetooth = (String)(SymbolValue)fv.GetFactSlot("bluetooth");
                listBluetooth.Add(sBluetooth);

                String sWifi = (String)(SymbolValue)fv.GetFactSlot("wifi");
                listWifi.Add(sWifi);

                String sFM = (String)(SymbolValue)fv.GetFactSlot("fm");
                listFM.Add(sFM);

                int iCameraZoom = (int)(IntegerValue)fv.GetFactSlot("zoom");
                listZoom.Add(iCameraZoom);

                float fCameraPixel = (float)(FloatValue)fv.GetFactSlot("pixel");
                listPixel.Add(fCameraPixel);

                String sFlash = (String)(SymbolValue)fv.GetFactSlot("flash");
                listFlash.Add(sFlash);

                String sVideoHD = (String)(SymbolValue)fv.GetFactSlot("videoHD");
                listVideoHD.Add(sVideoHD);
            }

            /*.Distinct().ToList() remove duplicates. sort() sorts the float and int
            values in descending order @kwanghock 17March2012*/

            listModel = listModel.Distinct().ToList();

            listPrice = listPrice.Distinct().ToList();
            listPrice.Sort();

            listBrand = listBrand.Distinct().ToList();
            
            listColor = listColor.Distinct().ToList();
            
            listScreen = listScreen.Distinct().ToList();
            listScreen.Sort();

            listWeight = listWeight.Distinct().ToList();
            listWeight.Sort();

            listMem = listMem.Distinct().ToList();
            
            listOS = listOS.Distinct().ToList();
            
            listBluetooth = listBluetooth.Distinct().ToList();
            
            listWifi = listWifi.Distinct().ToList();
            
            listFM = listFM.Distinct().ToList();
            
            listZoom = listZoom.Distinct().ToList();
            listZoom.Sort();
            
            listFlash = listFlash.Distinct().ToList();
            
            listVideoHD = listVideoHD.Distinct().ToList();
            
            listPixel = listPixel.Distinct().ToList();
            listPixel.Sort();

            /*
             *  for all the attributes gathered, add them to the dropdown box to be
             *  chosen. those attributes that are of value type string. first letter
             *  is convert to uppercase. @kwanghock 17march2012
             */

            for (int i = 0; i < listColor.Count; i++)
                cbColor.Items.Add(UpperCaseFirstChar(listColor.ElementAt(i)));

            for (int i = 0; i < listScreen.Count; i++)
                cbScreen.Items.Add(listScreen.ElementAt(i));

            for (int i = 0; i < listFM.Count; i++)
                cbFM.Items.Add(UpperCaseFirstChar(listFM.ElementAt(i)));

            for (int i = 0; i < listVideoHD.Count; i++)
                cbVideoHD.Items.Add(UpperCaseFirstChar(listVideoHD.ElementAt(i)));

            for (int i = 0; i < listFlash.Count; i++)
                cbCamFlash.Items.Add(UpperCaseFirstChar(listFlash.ElementAt(i)));

            for (int i = 0; i < listMem.Count; i++)
                cbMem.Items.Add(listMem.ElementAt(i) + " gb");

            for (int i = 0; i < listWeight.Count; i++)
                cbWeight.Items.Add(listWeight.ElementAt(i) + " g");

            for (int i = 0; i < listPixel.Count; i++)
                cbCamPixel.Items.Add(listPixel.ElementAt(i)+" px");

            for (int i = 0; i < listWifi.Count; i++)
                cbWifi.Items.Add(UpperCaseFirstChar(listWifi.ElementAt(i)));

            for (int i = 0; i < listZoom.Count; i++)
                cbZoom.Items.Add("x"+listZoom.ElementAt(i));

            for (int i = 0; i < listOS.Count; i++)
                cbOS.Items.Add(UpperCaseFirstChar(listOS.ElementAt(i)));
            

        }
       
        //Convert the first letter of the string arugment to be of uppercase
        public String UpperCaseFirstChar(String sConvert)
        {
            //Set first letter to caps
           char[] letters = sConvert.ToCharArray();
           letters[0] = char.ToUpper(letters[0]);
           return new String(letters);
        }
   
    }

 
}
