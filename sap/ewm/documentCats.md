---
id: sxsb2p62h75c71l444uaxg
title: sap/ewm/documentCats
desc: ''
updated: 1723837963
created: 1723837963
---
# sap/ewm/documentCats

## About

doucment categories, more stuff to memorize

- IDR: inbound delivery notification
- PDI: inbound delivery


- odr: outbound delivery request
- pdo: outbound delivery order
- fdo: outbound delivery

- por: posting change request
- spc: posting change


- wmr: stock transfer


The category defines in which business process a document can be used, which customizing settings are possible, and with which transaction the document can be processed.

Some details for the different document categories are described here:

IDR (Inbound Delivery Notification) and PDI (Inbound Delivery): These documents are
used during the inbound process. The IDR is created through a message
received from the ERP system and triggers a PPF action to
create the follow up document, the PDI. In an SAP S/4HANA
embedded EWM the IDR does not exist anymore, the PDI is
created immediately. In a decentralized EWM (9.5 or based on SAP
S/4HANA) the IDR can be skipped.By using an Expected Goods Receipt
document (details are below) the PDI can also be created directly
in EWM, without a IDR. The PDI can then create an
inbound delivery in ERP or only create a material document, depending
on the scenario and customizing settings.

ODR (Outbound Delivery Request), PDO
(Outbound Delivery Order) and FDO (Outbound Delivery): These documents are used
during the outbound process. The ODR is created through a message
received from the ERP system and triggers a PPF action to
create the follow up document, the PDO. In an SAP S/4HANA
embedded EWM the ODR does not exist anymore, the PDO is
created immediately. In a decentralized EWM (9.5 or based on SAP
S/4HANA) the ODR can be skipped.The PDO can also be created
directly in EWM, this is then called a direct outbound delivery
order. This PDO then also creates an outbound delivery in ERP.For
the goods issue posting in EWM and to communicate any delivery
split, it is necessary to create the FDO.
POR (Posting Change

Request) and SPC (Posting Change): These documents are used during a posting
change process. The POR is created through a message received from
the ERP system and triggers a PPF action to create the
follow up document, the SPC. In an SAP S/4HANA embedded EWM
the POR does not exist anymore, the SPC is created immediately.
In a decentralized EWM (9.5 or based on SAP S/4HANA) the
POR can be skipped.The SPC can be created directly in EWM
to trigger a posting change.
WMR (Stock Transfer): The WMR can
only be created directly in EWM. It is used to plan
a warehouse internal physical movement.
Besides the above listed document categories,
some other, more specialized, document categories exist:

GRN (Expected Goods
Receipt Notification) and EGR (Expected Goods Receipt): The expected goods receipt
process is a planning process to enable warehouse managers to get
an overview about the planned inbound workload. The EGR can then
be used to create a PDI, which is then further processed
in the warehouse.The GRN is created through a report either in
ERP or in EWM and triggers a PPF action to create
the follow up document, the EGR. In a decentralized EWM 9.5
or based on SAP S/4HANA the GRN can be skipped.In SAP
S/4HANA embedded EWM neither the GRN nor the EGR exit. The
process steps based on these documents (inbound workload overview or creation
of the PDI in EWM) are still possible, they simply don't
require these documents.
PWR (Production Material Request): The PWR is created
in EWM for a manufacturing order in ERP in the advanced
production integration. There is no delivery in ERP and there is
no other interim document in EWM.

