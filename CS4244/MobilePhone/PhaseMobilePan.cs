using Mommosoft.ExpertSystem;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace MobilePhone
{
    public partial class MainForm : Form
    {
        List<String> listPlan;
        List<String> listProvider;
        List<float> listPlanprice;
        List<int> listOutgoing;
        List<int> listData;
        List<int> listSMS;

        public void ProcessMobilePlan()
        {
        }

        public void OnChangePlan(object sender, EventArgs e)
        {

        }

        public void LoadPhasePlanDropdown()
        {
            String sSelectedProvider = null;
            String sSelectedSMS = null;
            String sSelectedData = null;
            String sSelectedOutgoing = null;
            String sSelectedBudget = null;

            listPlan = new List<String>();
            listProvider = new List<String>();
            listPlanprice = new List<float>();
            listOutgoing = new List<int>();
            listData = new List<int>();
            listSMS = new List<int>();

            string evalStr = "(get_mobileplan_list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);

            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];

                String sProvider = (String)(SymbolValue)fv.GetFactSlot("provider");
                listProvider.Add(sProvider);

                float fPlanprice = (float)(FloatValue)fv.GetFactSlot("planprice");
                listPlanprice.Add(fPlanprice);

                int iOutgoing = (int)(IntegerValue)fv.GetFactSlot("outgoing");
                listOutgoing.Add(iOutgoing);

                int iSMS = (int)(IntegerValue)fv.GetFactSlot("sms");
                listSMS.Add(iSMS); 

                int iData = (int)(IntegerValue)fv.GetFactSlot("data");
                listData.Add(iData);

            }

            listProvider = listProvider.Distinct().ToList();
            listProvider.Sort();

            listPlanprice = listPlanprice.Distinct().ToList();
            listPlanprice.Sort();

            listOutgoing = listOutgoing.Distinct().ToList();
            listOutgoing.Sort();

            listData = listData.Distinct().ToList();
            listData.Sort();

            listSMS = listSMS.Distinct().ToList();
            listSMS.Sort();

            for (int i = 0; i < listProvider.Count; i++)
                cbProvider.Items.Add(UpperCaseFirstChar(listProvider.ElementAt(i)));

            for (int i = 0; i < listOutgoing.Count; i++)
                cbOutgoing.Items.Add(listOutgoing.ElementAt(i)+ " mins");

            for(int i=0;i<listSMS.Count;i++)
                cbSMS.Items.Add(listSMS.ElementAt(i));

            for (int i = 0; i < listData.Count; i++)
                cbData.Items.Add(listData.ElementAt(i) + " gb");


            //add empty option to all the dropdown boxes
            cbProvider.Items.Insert(0, "");
            cbOutgoing.Items.Insert(0, "");
            cbSMS.Items.Insert(0, "");
            cbData.Items.Insert(0, "");

        }
    }
}
