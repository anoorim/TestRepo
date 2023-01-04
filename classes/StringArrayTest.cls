public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer n){
        
       List<String> str=new List<String>();       
        for (integer i=0;i<n;i++)
        {
           str.add('Test '+i);
            System.debug(str[i]);
        }
       return str;        
    }
  
   
}