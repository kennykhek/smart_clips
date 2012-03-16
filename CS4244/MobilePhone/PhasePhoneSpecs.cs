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


            listModel = listModel.Distinct().ToList();
            listPrice = listPrice.Distinct().ToList();
            listBrand = listBrand.Distinct().ToList();
            listColor = listColor.Distinct().ToList();
            listScreen = listScreen.Distinct().ToList();
            listWeight = listWeight.Distinct().ToList();
            listMem = listMem.Distinct().ToList();
            listOS = listOS.Distinct().ToList();
            listBluetooth = listBluetooth.Distinct().ToList();
            listWifi = listWifi.Distinct().ToList();
            listFM = listFM.Distinct().ToList();
            listZoom = listZoom.Distinct().ToList();
            listFlash = listFlash.Distinct().ToList();
            listVideoHD = listVideoHD.Distinct().ToList();
            listPixel = listPixel.Distinct().ToList();

            //for (int i = 0; i < listModel.Count; i++)
              
  
            //for (int i = 0; i < listPrice.Count; i++)

            for (int i = 0; i < listColor.Count; i++)
                cbColor.Items.Add(listColor.ElementAt(i));

            for (int i = 0; i < listScreen.Count; i++)
                cbScreen.Items.Add(listScreen.ElementAt(i));

            for (int i = 0; i < listFM.Count; i++)
                cbFM.Items.Add(listFM.ElementAt(i));

            for (int i = 0; i < listVideoHD.Count; i++)
                cbVideoHD.Items.Add(listVideoHD.ElementAt(i));

            for (int i = 0; i < listFlash.Count; i++)
                cbCamFlash.Items.Add(listFlash.ElementAt(i));

            for (int i = 0; i < listMem.Count; i++)
                cbMem.Items.Add(listMem.ElementAt(i));

            for (int i = 0; i < listWeight.Count; i++)
                cbWeight.Items.Add(listWeight.ElementAt(i));

            for (int i = 0; i < listPixel.Count; i++)
                cbCamPixel.Items.Add(listPixel.ElementAt(i));

            for (int i = 0; i < listWifi.Count; i++)
                cbWifi.Items.Add(listWifi.ElementAt(i));

            for (int i = 0; i < listZoom.Count; i++)
                cbZoom.Items.Add(listZoom.ElementAt(i));

            for (int i = 0; i < listOS.Count; i++)
                cbOS.Items.Add(listOS.ElementAt(i));
        }
    }
}
