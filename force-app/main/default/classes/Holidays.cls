/**
 * @File Name          : Holidays.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 15/12/2019 à 21:17:42
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    15/12/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public with sharing class Holidays {
  public static void verifyDeliveries(List<Delivery__c> deliveries){
      //a list of holiday
        List<Holiday> holidays = [SELECT activityDate FROM Holiday];
        //a list of date 
        List<Date> holidaysDate = new List<Date>();
        //iteration to the sobject holidays
        for(Holiday holiday : holidays){
            holidaysDate.add(holiday.activityDate);
        }
          //iteration to the delivery object 
        for(Delivery__c delivery : deliveries){
            //test if date in the list contains delivery start date
            if(holidaysDate.contains(delivery.Start_Date__c)){
                delivery.addError('The start date coincide with a holiday');
            }
             //test if user add a delivery then  delivery start date is after today
            if(delivery.Status__c == 'Delivered' && delivery.Start_Date__c > Date.today()){
                delivery.addError('The status "Delivered" cannot be associated to a coming date');
            }
        }   
        
    }
}