function main()
{
  start() ;
  var file = Files.FileNameByName("driver.csv"); //choose loaded *.csv file
  Log.Message("creating driver");
  var driver = DDT.CSVDriver(file);    //set file as driver
  var i = 0;    
  while(!driver.EOF())
  { 
    
    Aliases.Sys.Orders.MainForm.OrdersView.Keys("^[Ins]");//filling order form
    Aliases.Customer.wText = driver.Value(0);
    Aliases.Street.wText = driver.Value(1);
    Aliases.City.wText = driver.Value(2);
    Aliases.State.wText = driver.Value(3);
    Aliases.Zip.wText = driver.Value(4);
    Aliases.CardNo.wText = driver.Value(5);
    Aliases.ButtonOK.Click();
    Delay(100);
     
    Log.AppendFolder("blabla" + i) ; //try to create well structured log (failed)
    
    Aliases.Sys.Orders.MainForm.OrdersView.SelectItem(i);  //verifying Customers Names
    Delay(1000); 
    if (Aliases.Sys.Orders.MainForm.OrdersView.FocusedItem.Text.OleValue != driver.Value(0)) 
      Log.Error("The property value does not equal the baseline value.");
    else
      Log.Message("OK");   
    driver.Next();   // go to next string of driver values
    i++
  } 
    for(k=0; k<i; k++)      //cycle use final value of "i" which equal to quantity of lists
  { 
    Aliases.Sys.Orders.MainForm.OrdersView.SelectItem(0); // choose 1st item in a list
    Delay(1000);
    Aliases.Sys.Orders.MainForm.OrdersView.Keys("[Del]")
    Aliases.Sys.Orders.dlgConfirmation.btnYes.Click();
    }
    
    DDT.CloseDriver(file);
    
    
    cleanup();
}



function start()
{
  TestedApps.Orders.Run();     //run app
}



function cleanup()
{  
    Aliases.Sys.Orders.Close()        //close app
    Aliases.btnNo.Click();
}
