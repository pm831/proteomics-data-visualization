# Proteomics_Analysis
## Background
Brief background- Urinalyses are an important part of a patient work up in order to assess kidney function. UAs consist of 
physical, ##chemical and microscopic analyses of the urine.  
More specific information about UAs and their interpretation can be found here (http://www.eclinpath.com/urinalysis/). 
While dipstick tests are commonly used as a sensitive measure to detect proteinuria (the presence of protein in the urine), the urine protein:creatinine ratio is recognized as a more accurate assessment of proteinuria. 
UPCs are commonly used as a follow up test when protein is detected in UA results via dipstick, as it requires a separate workflow in the laboratory and is run on a chemistry analyzer. 
Additional information can be found here (http://www.eclinpath.com/urinalysis/chemical-constituents/).   

ACME is a corporate account that has been running UPCs (urine protein creatinine ratios) on most of their UAs (urinalyses) they send in to the MedX reference lab. 
Their pricing is changing and they will no longer be receiving UPCs for free.  
Please use ACME’s data from the last year to help the professional service veterinarian and corporate accounts manager communicate to ACME’s veterinarians that they have been running unnecessary UPCs and that MedX’s Urinalysis with Reflex UPCs offering might be a good fit for them and help them reduce unnecessary testing when UPCs are not appropriate. 
Please use the indicated parameters found below in the MedX Test Directory for your analyses.
MedX Test Directory info: Urinalysis with Reflex UPC (If Indicated) (2326)
If the urinalysis is positive for protein and the sediment is not active, a urine protein:creatinine (UPC) ratio is automatically performed. 
If the urinalysis is negative for protein, or if there is an active sediment (white blood cells ≥6/hpf, red blood cells ≥ 100/hpf,  color is red or pink, and/or bacteria are seen), the UPC ratio will not be performed. The test price is the same whether or not a UPC ratio is performed.

## Use Case:
### Figuring out if the urianalysis was positive for protein
## Initial Dataset:
### ACME_Data
## Software:
### R (ggplot2)
## Basic Steps:
#### Downloaded the dataset. 

![UA_Count](https://user-images.githubusercontent.com/19572673/62091688-321e2c00-b240-11e9-8d74-d141e18d780a.PNG)
![UAs_Positive_Count](https://user-images.githubusercontent.com/19572673/62091689-321e2c00-b240-11e9-8a0a-3154a72a53b3.PNG)
![Positive_NoSediment](https://user-images.githubusercontent.com/19572673/62091687-321e2c00-b240-11e9-90ec-6ba55c750123.PNG)
![Unnecessary_UPCs](https://user-images.githubusercontent.com/19572673/62091690-321e2c00-b240-11e9-8e86-5a9b5bc17d47.PNG)
