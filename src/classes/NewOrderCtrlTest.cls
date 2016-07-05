/* Test unit to cover NewOrderCtrl
 * @author Pavel Trusov
 */
@isTest
public class NewOrderCtrlTest {
	static testMethod void orderTest() {
		Test.setCurrentPage(Page.NewOrder);
		Merchandise__c testProduct = new Merchandise__c(Name = 'Test', 
											Quantity__c = 100, Price__c = 100);
		insert testProduct;
		ApexPages.currentPage().getParameters().put(CountSheetCtrl.PARAMETER_ID, testProduct.Id);
		Test.startTest();
		NewOrderCtrl controller = new NewOrderCtrl();
		controller.newContact.FirstName = 'Test';
		controller.newContact.LastName = 'Test'; 
		controller.newContact.Email = 'Test@test.com';
		controller.newLineItem.Quantity__c = 100;
		controller.save();
		Test.stopTest();
		System.assert([SELECT Id FROM Order__c].size() > 0);
	}
}