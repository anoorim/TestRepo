public class CalculatorController {
    
    public integer x{get;set;}
    public integer y{get;set;}
    public integer z{get;set;}
    public boolean show{get;set;}
    
    public void add()
    {
              show = true;
        z=x+y;
    }
}