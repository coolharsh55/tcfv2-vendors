# tcfv2-vendors
Data related to analysis of vendors in TCF v2

source of TCF Vendors: https://vendor-list.consensu.org/v2/vendor-list.json

Checks HTTP status of privacy policies for TCF vendors listed.

* tcf-vendor-list-with-purposes.json :: JSON downloaded from TCF source, contains information about version, purposes, and vendors (JSON)
* check_http_status.sh :: script to check status of policy urls (BASH ; needs `curl` and `jq`)
* policy_status.tsv :: output consisting of HTTP status of urls (Tab-Separated-Values spreadsheet)
* policies_errors.tsv :: extracted list of policy urls returning errors (Tab-Separated-Values spreadsheet)
* filter_active_vendors.sh :: filter vendors with erroneous policies to discard ones that don't have a deletedDate
* policies_errors_active_vendors.tsv :: vendors with erroneous policies that are still listed as active

To execute:

```bash
check_http_status.sh > policy_status.tsv
cat policy_status.tsv | grep -v 200 > policies_errors.tsv
filter_active_vendors.sh > policies_errors_active_vendors.tsv
```
