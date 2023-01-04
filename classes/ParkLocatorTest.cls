@isTest
public class ParkLocatorTest {

    @isTest static void testPark()
    {
        Test.setMock(WebServiceMock.class,new ParkServiceMock());
        String country='Germany';
        List<String> result=ParkLocator.country(country);
    }
}