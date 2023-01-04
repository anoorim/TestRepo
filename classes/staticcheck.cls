public class staticcheck {

    public integer var = 0;
    public static integer statvar = 0;
    
    public void increment(){
        var ++;
        statvar++;
    }
}
/****Exceute the below code in anonymous window to check
 * 
 * 
 * 
    staticcheck st = new staticcheck();
    st.increment();
    system.debug('non static var' +st.var);
    system.debug('static var' +staticcheck.statvar);
    staticcheck st1 = new staticcheck();
    st1.increment();
    system.debug('non static var' +st1.var);
    system.debug('static var' +staticcheck.statvar);

A static variable is static only in the scope of the apex transaction. 
The static variable resets after a transaction is finished. *************/