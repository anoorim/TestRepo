@isTest
public class AnimalLocatorTest {

    @isTest public static void testLocator()
    {
       
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String response=AnimalLocator.getAnimalNameById(1);
    }
}