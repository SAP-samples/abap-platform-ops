# ABAP Platform Operations Reference Scenarios

<!--- Register repository https://api.reuse.software/register, then add REUSE badge:
[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/abap-platform-ops)](https://api.reuse.software/info/github.com/SAP-samples/abap-platform-ops)
-->

## Description
The ABAP Platform Operations Reference Scenario provides sample implementations of operations related development objects for various use cases such as collecting and monitoring custom health metrics using the <strong>Generic Simple Metric (GSM) framework</strong>. You can find out more on the topic of developing custom metric providers on the [SAP Help Portal] (https://help.sap.com/docs/btp/sap-business-technology-platform/developing-metrics-for-health-monitoring)

## Requirements
Make sure to fulfill the following requirements:
* You have access to an ABAP Environment instance on SAP BTP or S/4HANA Cloud, public edition (see [SAP BTP-ABAP Environment](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/11d62652aa2b4600a0fa136de0789648.html) or [SAP S/4HANA Cloud-Developer Extensibility](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/e1059ff581854a699f15734049f14293.html)).
* You have downloaded and installed ABAP Development Tools (ADT). Make sure to use the most recent version as indicated on the [installation page](https://tools.hana.ondemand.com/#abap). 
* You have created an ABAP Cloud Project in ADT that allows you to access your ABAP Environment instance (see Creating an ABAP Cloud Project ([SAP BTP](https://help.sap.com/docs/BTP/5371047f1273405bb46725a417f95433/99cc54393e4c4e77a5b7f05567d4d14c.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/25cf71e63940453397a32dc2b7676947/99cc54393e4c4e77a5b7f05567d4d14c.html))). Your log-on language is English.
* You have installed the [abapGit](https://github.com/abapGit/eclipse.abapgit.org) plug-in for ADT from the update site `http://eclipse.abapgit.org/updatesite/`.

## Download and Installation
Use the abapGit plug-in to import the <em>ABAP Platform Operations Reference Scenario</em> by executing the following steps:
1. In your ABAP cloud project, create the ABAP package `/DMO/OPS` (using the superpackage `/DMO/SAP`) as the target package for the demo content to be downloaded (leave the suggested values unchanged when following the steps in the package creation wizard).
2. To add the <em>abapGit Repositories</em> view to the <em>ABAP</em> perspective, click `Window` > `Show View` > `Other...` from the menu bar and choose `abapGit Repositories`.
3. In the <em>abapGit Repositories</em> view, click the `+` icon to clone an abapGit repository.
4. Enter the following URL of this repository: `https://github.com/SAP-samples/abap-platform-ops.git` and choose <em>Next</em>.
5. Select the branch <em>ABAP-platform-cloud</em> and enter the newly created package `/DMO/OPS` as the target package and choose <em>Next</em>.
6. Create a new transport request that you only use for this demo content installation (recommendation) and choose <em>Finish</em> to link the Git repository to your ABAP cloud project. The repository appears in the abapGit Repositories View with status <em>Linked</em>.
7. Right-click on the new ABAP repository and choose `pull` to start the cloning of the repository contents. Note that this procedure may take a few minutes. 
8. Once the cloning has finished, the status is set to `Pulled Successfully`. (Refresh the `abapGit Repositories` view to see the progress of the import). Then refresh your project tree. 

## Known Issues
No known issues

## How to obtain support
[Create an issue](https://github.com/SAP-samples/abap-platform-ops/issues) in this repository if you find a bug or have questions about the content.
 
For additional support, [ask a question in SAP Community](https://answers.sap.com/questions/ask.html).

## License
Copyright (c) 2022 SAP SE or an SAP affiliate company. All rights reserved. This project is licensed under the Apache Software License, version 2.0 except as noted otherwise in the [LICENSE](LICENSE) file.
