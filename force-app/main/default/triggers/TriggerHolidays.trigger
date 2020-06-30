/**
 * @File Name          : TriggerHolidays.trigger
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 15/12/2019 à 21:21:11
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    03/12/2019   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
 trigger TriggerHolidays on delivery__c (before insert, before update) {
 
  Holidays.verifyDeliveries(Trigger.new);
 
}