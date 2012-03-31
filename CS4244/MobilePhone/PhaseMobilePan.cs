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
            String sSelectedProvider = "";
            String sSelectedOutgoing = "";
            String sSelectedSMS = "";
            String sSelectedData = "";

            if (cbProvider.SelectedItem != null && cbProvider.SelectedItem != "")
            {
                sSelectedProvider = LowerCaseFirstChar(cbProvider.SelectedItem.ToString());
            }
            else sSelectedProvider = "nil";

            if (cbOutgoing.SelectedItem != null && cbOutgoing.SelectedItem != "")
            {
                sSelectedOutgoing = cbOutgoing.SelectedItem.ToString().Substring(0,cbOutgoing.SelectedItem.ToString().IndexOf(" "));
            }
            else sSelectedOutgoing = "nil";


            if (cbSMS.SelectedItem != null && cbSMS.SelectedItem != "")
            {
                sSelectedSMS = cbSMS.SelectedItem.ToString();
            }
            else sSelectedSMS = "nil";

            if (cbData.SelectedItem != null && cbData.SelectedItem != "")
            {
                sSelectedData = cbData.SelectedItem.ToString();
            }
            else sSelectedData = "nil";

            environment.Run();

            UpdatePlanGrid(sSelectedProvider + " " + sSelectedOutgoing + " " + sSelectedSMS + " " + sSelectedData);
        }

        public void UpdatePlanGrid(String attribute)
        {
            //Filter phone_plan_price 
            //       weightage_phone_plan 
            //       phone_plan
            //string evalStr = "(update_phoneplan_list " + attribute + ")";
            string evalStr = "(get_weightage_phone_plan_list)";
            MultifieldValue mv = (MultifieldValue)environment.Eval(evalStr);
            environment.Run();

            for (int i = 0; i < mv.Count; i++)
            {
                FactAddressValue fv = (FactAddressValue)mv[i];
                PlanResultDisplay display = new PlanResultDisplay();
                String sModel = "";
                try
                {
                    float fphoneprice = (float)(FloatValue)fv.GetFactSlot("phoneprice");
                    String sProvider = (String)(SymbolValue)fv.GetFactSlot("provider");

                }
                catch (Exception exception)
                {
                    if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.SymbolValue"))
                        sModel = (String)(SymbolValue)fv.GetFactSlot("model");
                    else if ((fv.GetFactSlot("model").GetType().ToString()).Equals("Mommosoft.ExpertSystem.IntegerValue"))
                        sModel = ((int)(IntegerValue)fv.GetFactSlot("model")).ToString();
                    float fweightage = (float)(FloatValue)fv.GetFactSlot("normalizedWeightage");
                    String sPlan = (String)(SymbolValue)fv.GetFactSlot("plan");

                    display.fWeightage = fweightage;
                    display.sModel = sModel;
                    display.sPlan = sPlan;

                    phase4Results.Add(display);
                }
            }

            List<PlanResultDisplay> listConvert = phase4Results.ToList();
            listConvert = listConvert.OrderByDescending(x => x.fWeightage).ToList();
            phase4Results.Clear();
            for (int i = 0; i < listConvert.Count; i++)
            {
                phase4Results.Add(listConvert.ElementAt(i));
            }
            dataGridView1.DataSource = phase4Results;
        }

        public void LoadPhasePlanDropdown()
        {

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
