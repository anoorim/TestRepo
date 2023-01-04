public class ShowABController {
    
    public String A{get;set;}
    public String B{get;set;}
    public String AB{get;set;}
    public String ValueA{get;set;}
    public String ValueB{get;set;}
    public String ValueAB{get;set;}
    public boolean ShowA{get;set;}
    public boolean ShowAB{get;set;}
    public boolean ShowB{get;set;}
    public boolean ButtonA{get;set;}
    public boolean ButtonB{get;set;}
    public boolean ButtonAB{get;set;}
    
    public ShowABController()
    {
        ButtonA=false;
        ButtonB=false;
        ButtonAB=false;
        ValueA='Show A';
        ValueB='Show B';
        ValueAB='Show AB';
    }
   
    public void methodA(){
        
        if(ValueA =='Show A'){
            
            showa();
        }
        else{
            
            hidea();
        }
    }
    
    public void methodB()
    {
        if(ValueB =='Show B'){
            
            showb();
        }
        else{
            
            hideb();
        }        
    }   
    
    public void methodAB()
    {
        if(ValueAB =='Show AB'){
            
            showab();
        }
        else{
            
            hideab();
        }        
    }   
    
    	public void showa(){
        
        A = 'I am object A';
        ShowA = true;
        ButtonA =  true;//used by ShowABPage.vfp
        ValueA='Hide A';//used by ShowSingleButtonAB.vfp
        
    }
    public void hidea(){
        
        
        ShowA = false;
        ButtonA =  false;//used by ShowABPage.vfp
        ValueA='Show A';//used by ShowSingleButtonAB.vfp
        
    }
    
    public void showb(){
        
        B= 'I am object B';
        ShowB = true;
        ButtonB =  true;//used by ShowABPage.vfp
        ValueB='Hide B';//used by ShowSingleButtonAB.vfp
        
    }
    public void hideb(){
        
        
        ShowB = false;
        ButtonB =  false;//used by ShowABPage.vfp
        ValueB='Show B';//used by ShowSingleButtonAB.vfp
        
    }
    
    public void showab(){
        
        AB= 'I am objects A&B';
        ShowAB = true;
        ButtonAB =  true;//used by ShowABPage.vfp
        ValueAB='Hide AB';//used by ShowSingleButtonAB.vfp
        
    }
    public void hideab(){
        
        
        ShowAB = false;
        ButtonAB =  false;//used by ShowABPage.vfp
        ValueAB='Show AB';//used by ShowSingleButtonAB.vfp
        
    }
}