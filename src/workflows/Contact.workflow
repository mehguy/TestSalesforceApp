<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Order_Note</fullName>
        <description>Order Note</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/SupportCaseCreatedWebInquiries</template>
    </alerts>
    <rules>
        <fullName>Sending Email</fullName>
        <actions>
            <name>Order_Note</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Sends an email.</description>
        <formula>Email != &apos;&apos;</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
