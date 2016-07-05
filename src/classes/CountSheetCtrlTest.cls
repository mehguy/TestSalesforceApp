/* Test unit to cover CountSheetCtrl
 * @author Pavel Trusov
 */
@isTest
public class CountSheetCtrlTest {
	static testMethod void productsTest() {
		Merchandise__c testProduct = new Merchandise__c(Name = 'Test', 
											Quantity__c = 100, Price__c = 100);
		insert testProduct;
		Test.startTest();
		CountSheetCtrl prods = new CountSheetCtrl();
		System.assert(prods != null);
    	System.assert(prods.products.size() > 0);
    	prods.recordId = testProduct.Id;
    	System.assert(prods.newRecord() != null);
    	System.assert(prods.newOrder().getParameters().get(CountSheetCtrl.PARAMETER_ID) == testProduct.Id);
    	prods.deleteRecord();
    	System.assert([SELECT Id FROM Merchandise__c].size() == 0);
    	Test.stopTest();
	}
}