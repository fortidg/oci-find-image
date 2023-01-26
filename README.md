# oci-find-image
##This was copied from  I dit not fork it because I wanted to add a README file.
    https://gist.github.com/mattiarossi/a7e5ceff8de0da0a12393a27ffc5c6e8
    https://foggykitchen.com/2020/05/19/how-to-retrieve-an-oci-marketplace-image-id-using-advanced-functionality-in-the-oci-cli-utility/
    
### I ran the below command to get Display names in order to populate the script.

* oci raw-request --target-uri https://iaas.us-ashburn-1.oraclecloud.com/20160918/appCatalogListings --http-method GET
 
### The above command gave me all marketplace images available in the region, but I wanted to pull out only Fortinet information.

* Sample output

...sh
    {
      "displayName": "FortiAnalyzer Centralized Logging/Reporting (BYOL)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaa4ehcyncbbmuotd6ede2lengq7uoash27s4hgwpzexsktsxanp6oa",
      "publisherName": "Fortinet, Inc.",
      "summary": "Instant visibility, situation awareness, real-time threat intelligence and actionable analytics"
    },
    {
      "displayName": "FortiAuthenticator (BYOL)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaape2ouptkrowrsw22rqfkeygc34c3ab2fipd6gem2rbsajlo5ti2q",
      "publisherName": "Fortinet, Inc.",
      "summary": "User and identity management solution providing strong two-factor authentication and SSO"
    },
    {
      "displayName": "FortiGate Next-Gen Firewall (2 cores)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaaif6zctibx6njnmob2a23l5if7voquhgsfqxi2ftog2yy3jxmuaba",
      "publisherName": "Fortinet, Inc.",
      "summary": "Comprehensive Security in One, Simplified Solution"
    },
    {
      "displayName": "FortiGate Next-Gen Firewall (24 cores)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaamc75m7b3rukv6vd573mdrdqnlqabrbhmz5fggvvtalq3ckfl3zqa",
      "publisherName": "Fortinet, Inc.",
      "summary": "Comprehensive Security in One, Simplified Solution"
    },
    {
      "displayName": "FortiGate Next-Gen Firewall (4 cores)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaa6d5wbjlrlihw7l33nvdso74lv2s66snabevr33awotpgjownggiq",
      "publisherName": "Fortinet, Inc.",
      "summary": "Comprehensive Security in One, Simplified Solution"
    },
    {
      "displayName": "FortiGate Next-Gen Firewall (8 cores)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q",
      "publisherName": "Fortinet, Inc.",
      "summary": "Comprehensive Security in One, Simplified Solution"
    },
    {
      "displayName": "FortiGate Next-Gen Firewall (BYOL)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q",
      "publisherName": "Fortinet, Inc.",
      "summary": "Comprehensive Security in One, Simplified Solution"
    },
    {
      "displayName": "FortiManager Centralized Security Management (BYOL)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaawpkjzjrzqhd6m4q6j6qfkwsiqaqnv5f5juup6z2lvyg56wjbcbyq",
      "publisherName": "Fortinet, Inc.",
      "summary": "Simplify configuration, automate provisioning, and maintain compliance"
    },
    {
      "displayName": "Fortinet FortiADC Application Delivery Controller",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaassgl7ibzi7whhuhqb7dq7vrqjra25yey4dwkk5abz7to4qqqisna",
      "publisherName": "Fortinet, Inc.",
      "summary": "High-Performance Server Load Balancing and Application Delivery"
    },
    {
      "displayName": "Fortinet FortiSandbox Zero-Day Threat Protection",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaamp5ez5zh2y3tchbnjv46eeyq5xsgvexvamuzufsdtht2vemezc6a",
      "publisherName": "Fortinet, Inc.",
      "summary": "Zero-day Malware Protection for Your Cloud and Hybrid Workloads"
    },
    {
      "displayName": "Fortinet FortiWeb Web Application Firewall WAF",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaabns5i7dbr5rwxrkvbxlofsnn5gdvbe47qtfnqtl54sni3ltuxoga",
      "publisherName": "Fortinet, Inc.",
      "summary": "AI-based, multi-layered protection for web-based applications"
    },
```

### I added the shell script in the cloud shell on OCI and then had to **chmod** it in order to run.

...
userh@cloudshell:~ (us-ashburn-1)$ ./find.sh 'Next-Gen Firewall (BYOL)' '7.2.3' 'us-ashburn-1'
{
  "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q",
  "listingResourceId": "ocid1.image.oc1..aaaaaaaatgr6fgvzztpmmb2tuka55uasrviedqfnksbbwscj3nvhhcxiglba",
  "listingResourceVersion": "7.2.3_(_X64_)",
  "timePublished": "2022-11-17T04:11:48.443Z"
}
```
### I tried above in both uk-london-1 and us-ashburn-1 regions and found that the lisingID, listingResourceID and listingResourceVersion wer identical.

```
user@cloudshell:~ (us-ashburn-1)$ ./find.sh 'Next-Gen Firewall (BYOL)' '7.2.3' 'uk-london-1'
{
  "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q",
  "listingResourceId": "ocid1.image.oc1..aaaaaaaatgr6fgvzztpmmb2tuka55uasrviedqfnksbbwscj3nvhhcxiglba",
  "listingResourceVersion": "7.2.3_(_X64_)",
  "timePublished": "2022-11-17T04:11:48.443Z"
}
'''
### Below is an example looking for paygo and a different version

```
user@cloudshell:~ (us-ashburn-1)$ ./find.sh 'FortiGate Next-Gen Firewall (8 cores)' '7.0.9' 'uk-london-1'
{
  "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q",
  "listingResourceId": "ocid1.image.oc1..aaaaaaaa5pgooaurtnka7yleha3n3q3cm2dk2sqzlyev4bzw6krh7gtwslia",
  "listingResourceVersion": "7.0.9_(_X64_)",
  "timePublished": "2022-11-26T01:38:57.964Z"
}

```
