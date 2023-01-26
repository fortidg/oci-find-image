# oci-find-image
##This was adapted from  I dit not fork it because I wanted to add a README file.
    https://gist.github.com/mattiarossi/a7e5ceff8de0da0a12393a27ffc5c6e8
    https://foggykitchen.com/2020/05/19/how-to-retrieve-an-oci-marketplace-image-id-using-advanced-functionality-in-the-oci-cli-utility/
    
### I ran the below command to get Display names in order to populate the script.

* oci raw-request --target-uri https://iaas.us-ashburn-1.oraclecloud.com/20160918/appCatalogListings --http-method GET
 
### The above command gave me all marketplace images available in the region.  The below sample is from just a single FortiGate listing.  I wil lused the display name to populate the "$STERM" variable in the command
* Sample output

```sh

    {
      "displayName": "FortiGate Next-Gen Firewall (4 cores)",
      "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaa6d5wbjlrlihw7l33nvdso74lv2s66snabevr33awotpgjownggiq",
      "publisherName": "Fortinet, Inc.",
      "summary": "Comprehensive Security in One, Simplified Solution"
    },

```

### I added the shell script in the cloud shell on OCI and then had to **chmod** it in order to run.

```sh

userh@cloudshell:~ (us-ashburn-1)$ ./find.sh 'Next-Gen Firewall (BYOL)' '7.2.3' 'us-ashburn-1'
{
  "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q",
  "listingResourceId": "ocid1.image.oc1..aaaaaaaatgr6fgvzztpmmb2tuka55uasrviedqfnksbbwscj3nvhhcxiglba",
  "listingResourceVersion": "7.2.3_(_X64_)",
  "timePublished": "2022-11-17T04:11:48.443Z"
}
```
### I tried above in both uk-london-1 and us-ashburn-1 regions and found that the lisingID, listingResourceID and listingResourceVersion wer identical.

```sh
user@cloudshell:~ (us-ashburn-1)$ ./find.sh 'Next-Gen Firewall (BYOL)' '7.2.3' 'uk-london-1'
{
  "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaam7ewzrjbltqiarxukuk72v2lqkdtpqtwxqpszqqvrm7likfnpt5q",
  "listingResourceId": "ocid1.image.oc1..aaaaaaaatgr6fgvzztpmmb2tuka55uasrviedqfnksbbwscj3nvhhcxiglba",
  "listingResourceVersion": "7.2.3_(_X64_)",
  "timePublished": "2022-11-17T04:11:48.443Z"
}
'''
### Below is an example looking for paygo and a different version

```sh
user@cloudshell:~ (us-ashburn-1)$ ./find.sh 'FortiGate Next-Gen Firewall (8 cores)' '7.0.9' 'uk-london-1'
{
  "listingId": "ocid1.appcataloglisting.oc1..aaaaaaaa6e3iscizq3p24bfb5nr4wxsxzc3s6mzpekxgv7f2kse35akhg45q",
  "listingResourceId": "ocid1.image.oc1..aaaaaaaa5pgooaurtnka7yleha3n3q3cm2dk2sqzlyev4bzw6krh7gtwslia",
  "listingResourceVersion": "7.0.9_(_X64_)",
  "timePublished": "2022-11-26T01:38:57.964Z"
}

```
