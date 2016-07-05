<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Copy_Unit_Price</fullName>
        <field>Unit_Price__c</field>
        <formula>Merchandise__r.Price__c</formula>
        <name>Copy Unit Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Price_After_Discount</fullName>
        <field>Unit_Price__c</field>
        <formula>Unit_Price__c  - Unit_Price__c * (  Discount__c / 100 )</formula>
        <name>Price After Discount</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Stock_Inventory</fullName>
        <field>Quantity__c</field>
        <formula>Merchandise__r.Quantity__c  -  Quantity__c</formula>
        <name>Update Stock Inventory</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Merchandise__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Unit_Price</fullName>
        <field>Unit_Price__c</field>
        <formula>Merchandise__r.Price__c   - Merchandise__r.Price__c * (  Discount__c / 100 )</formula>
        <name>Update Unit Price</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Discounted Price</fullName>
        <actions>
            <name>Update_Unit_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Line_Item__c.Discount__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Line Item Updated</fullName>
        <actions>
            <name>Update_Stock_Inventory</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Invoice__c.Status__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Populate Unit Price</fullName>
        <actions>
            <name>Copy_Unit_Price</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Line_Item__c.Quantity__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Line_Item__c.Discount__c</field>
            <operation>equals</operation>
            <value>0</value>
        </criteriaItems>
        <description>Populates the Line Item object’s Unit Price field with the value of the Merchandise object’s Price field.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
