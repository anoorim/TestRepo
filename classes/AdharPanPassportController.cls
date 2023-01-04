public class AdharPanPassportController {
    
    public String selvalue{get;set;}
    public List<SelectOption> options{get;set;}
    public String cname{get;set;}
    public String pin{get;set;}
    public Boolean showa{get;set;}
    public Boolean showb{get;set;}
    public Boolean showbank{get;set;}
    public String street{get;set;}
    public String secondstreet{get;set;}
    public String city{get;set;}
    public String country{get;set;}
    public Boolean streetval{get;set;}
    public Boolean sstreet{get;set;}
    public date dob{get;set;}
    public String mname{get;set;}
    public Boolean dvalue{get;set;}
    public Boolean mvalue{get;set;}
    public String bname{get;set;}
    public String bcity{get;set;}
    public Boolean bvalue{get;set;}
    public Boolean bcityvalue{get;set;}
    public String error1{get;set;}
    
    public AdharPanPassportController(){
        
        options=new List<SelectOption>();
        options.add(new SelectOption('None','---None---'));
        options.add(new SelectOption('Adhar','Adhar'));
        options.add(new SelectOption('PAN','PAN'));
        options.add(new SelectOption('Passport','Passport'));
        showa=false;
        showb=false;
        showbank=false;
        
    }
    public void save()
    {
        
        if(selvalue=='Adhar')
        {
            
            if(street==null)
            {
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR,'Street is required for Adhar'));
            }
        }
    }
    
    public void cmethods(){
        
        system.debug('Value---' +selvalue);
        system.debug('Options----' +options);
        
        if(selvalue=='None')
        {      
            showa=false;
            showb=false;
            showbank=false;
        }
        if(selvalue=='Adhar')
        {      
            Adhar();
        }
        if(selvalue=='PAN')
        {      
            PAN();
        }
        if(selvalue=='Passport')
        {      
            Passport();
        }
        
    }
    public void Adhar()
    {
        
        showa = true;
        streetval=true;
        showb=false;
        showbank=true;
        
    }
    public void PAN()
    {
        showa = true;
        showb = true;
        streetval=false;
        showbank=true;
        
    }
    public void Passport()
    {
        showa = true;
        showb = true;
        streetval=false;
        showbank=true;
        
    }
}