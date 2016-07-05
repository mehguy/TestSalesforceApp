/* This is controller for CountSheet and ClientSheet vf-pages.
 * fills the output fields with List<Merchandise__c> data
 * @author: Pavel Trusov
 */
public with sharing class CountSheetCtrl {

    public static final String PARAMETER_ID = 'Id';

    public Id recordId {get;set;}

    public List<Merchandise__c> products { get { 
        return [SELECT Id, Name, Quantity__c, Price__c FROM Merchandise__c 
                         ORDER BY Name LIMIT 10000];
        }
        set;
    }

    /* CountSheetCtrl constructor. */
    public CountSheetCtrl() {
        
    }

    /* Deletes record if it's Id isn't empty. */
    public void deleteRecord() {
        if (recordId != null) { 
            Database.delete(recordId);
        }
    }

    /* Goes to the NewProduct vf-page. */
    public PageReference newRecord() {
        return Page.NewProduct;  
    }

    /* Sets a record Id to the NewOrder vf-page URL. */
    public PageReference newOrder() {
        PageReference result = Page.NewOrder;
        result.getParameters().put(PARAMETER_ID, recordId);
        return result;
    }
}