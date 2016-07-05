/* Test unit to cover NewProductCtrl
 * @author Pavel Trusov
 */
@isTest
private class NewProductCtrlTest {
	static testMethod void productTest() {
		Test.startTest();
		NewProductCtrl controller = new NewProductCtrl();
		controller.newRecord.Name = 'Test';
		controller.newRecord.Quantity__c = 100;
		controller.newRecord.Price__c = 100;
		controller.save();
		System.assert([SELECT Id FROM Merchandise__c].size() > 0);
		System.assert(controller.save() == null);
		Test.stopTest();
	}
}