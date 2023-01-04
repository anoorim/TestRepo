public class SelectOptionSample {
    
    public string selectedcountries{get;set;}
    public string selectedvalue{get;set;}
    public List<SelectOption> clist{get;set;}
    public boolean show{get;set;}
    
    public SelectOptionSample()
    {
        show=false;
        clist=new List<SelectOption>();
        clist.add(new SelectOption('None','---None---'));
        clist.add(new SelectOption('India','India'));
        clist.add(new SelectOption('Sweden','Sweden'));
		
    }
    public void show()
    {
        show=true;
        selectedvalue='Selected Country:' +selectedcountries;
    }
}