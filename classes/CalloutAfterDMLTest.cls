public class CalloutAfterDMLTest {

    public static void createAccount(){
        
        Account acc = new Account(name = 'SevenX',Rating = 'Hot');
        Insert acc;
        AnimalsCallouts.makeGetCallout();
    }
}