@RestResource(urlMapping='/studentsInfo/*')
global class RestExample {

    global class StudentInfo{
        String studentName{get;set;}
        String studentAddress{get;set;}
        String studentPhoneNumber{get;set;}
        String schoolName{get;set;}
    }

    @HttpGet
    global static StudentInfo getStudent(){

        RestRequest request = RestContext.Request;
        String studentId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
        Student__c student = [SELECT Id,Name,Address__c,Phone_Number__c,School__r.Name,Student_Name__c 
                                FROM Student__c WHERE Id = :studentId];
        StudentInfo stdInfo = new StudentInfo();
        stdInfo.studentName = student.Student_Name__c;
        stdInfo.studentAddress = student.Address__c;
        stdInfo.studentPhoneNumber = student.Phone_Number__c;
        stdInfo.schoolName = student.School__r.Name;

        return stdInfo;
    }
}