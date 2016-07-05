/* This is controller for the NewOrder vf-page.
 * @author Pavel Trusov
 */
public class NewOrderCtrl {

  public Contact newContact {get; set;}  
  public Line_Item__c newLineItem {get; set;}   
  public Order__c newOrder {get; set;} 
  public Id recordId {get; set;}
  public Merchandise__c selectedProduct {get; set;}

  /* Save button. Inserts data from variables into the sObjects.
   * Returns the user to the ClientSheet page upon completion. */
  public PageReference save() {
    insert this.newContact;
    this.newLineItem.Merchandise__c = this.selectedProduct.Id;
    insert this.newLineItem;
    this.newOrder.Contact__c = this.newContact.Id;
    this.newOrder.Line_Item__c = this.newLineItem.Id;
    insert this.newOrder;
    return Page.ClientSheet;
  }

  /* NewOrderCtrl constructor. */     
  public NewOrderCtrl() {
    /* Gets recordId from vf-page URL.*/
    this.recordId = ApexPages.currentPage().getParameters().get(CountSheetCtrl.PARAMETER_ID);
    /* Selects a record with current recordId. */
    this.selectedProduct = [SELECT Id, Name FROM Merchandise__c 
                                  WHERE Id = :this.recordId LIMIT 1];
    this.newOrder = new Order__c();
    this.newLineItem = new Line_Item__c();
    this.newContact = new Contact();
  }
}