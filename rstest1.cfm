

<cfset st = createObject("component", "org.camden.ups.rateservice").init(application.key, application.username, application.password)>

<!--- Use this to show package types
<cfdump var="#st.getValidPackageTypes()#">
--->

<cfset packages = arrayNew(1)>

<cfset arrayAppend(packages, st.getPackageStruct(weight=40,width=20,length=40,height=10,packagetype="02", declaredvalue=20000))>
<cfset arrayAppend(packages, st.getPackageStruct(weight=10,width=20,length=40,height=10,packagetype="03"))>
<cfset arrayAppend(packages, st.getPackageStruct(weight=10,packagetype="03"))>

<cfset rates = st.getRateInformation(shipperpostalcode=70508,packages=packages,shiptopostalcode=90210)>
<cfdump var="#rates#" label="Rates">

<!--- package types
Valid values: 00 = UNKNOWN; 01 = UPS Letter;
02 = Package; 03 = Tube; 04 = Pak; 21 =
Express Box; 24 = 25KG Box; 25 = 10KG Box;
30 = Pallet; 2a = Small Express Box; 2b =
Medium Express Box; 2c = Large Express Box
--->