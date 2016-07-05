/* This is NewProduct vf-page controller.
 * @author Pavel Trusov
 */
public with sharing class NewProductCtrl {

    public Merchandise__c newRecord {get; set;}

    /* Adds a new product. */
    public PageReference save() {
        List<Merchandise__c> nameCheck = [SELECT Name FROM Merchandise__c
											WHERE Name = :newRecord.Name LIMIT 1];
        /* Product name must be unique. */
        if ( nameCheck != null && !nameCheck.isEmpty() ) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 
                             Label.Record_Add_Error) );   // "Cannot add new record."
            return null;
        } else {
            Database.insert(newRecord);
            return Page.CountSheet;
        }
    }

    /* NewProductCtrl constructor. */
    public NewProductCtrl() {
        this.newRecord = new Merchandise__c();
    }
}