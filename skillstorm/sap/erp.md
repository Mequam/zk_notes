---
id: mjhg9livz29vyy5e4fxz1p
title: skillstorm/sap/erp
desc: ''
updated: 1718637387
created: 1718637387
---
# skillstorm/sap/erp

## About

erp is short for Enterprise Resource Planning

there are different software packages that offer this
SAP is one of them and what this will cover.

other erp's include octiva as an example, sap is one of
the bigger systems

these incorperate people resources and processes
the idea here is to enhance productivity by combining
the sub projects

Incorperates Sub Modules

1. Financials (FI and CO)
    utilize funds to efficiently increase productivity in long run
2. hcm (human capitol management)
    manage employees from recrutment to payrol
    think hr processes
3. Operations
    coveres the broadest range of technologies
4. Corprate Services
    covers travel management environment health safty realistate
    think tracking expenses and travel

the idea here is to manages these processes to make better
decision making and enhance productivity

we want to be getting realtime data from these.

---

## Business processes

there are three of these

> these are not necessarily linear processes
> you can bounce back and forth between them

### Business Intelligence (BI) and Business Warehouse (BW)

1. these process a large amount of data and returns info from it
2. these transfer analyses to sap enterprise portal 

### Master Data Management (MDM)

1. we create cross company unified master data
    the idea here is that many different companies
    can use the same snippit of information
    we want to be *consistent* accross different ORGS

### knowledge management
functions that enable corprate information to be structured

these include

1. search
2. classification
3. subscription abilities

basically these are actions that employees can can perform
to get info from the company.

classification is for putting info where it goes (hr info gets marked as hr)

### purchase-to-pay

TODO: look more into this

convert PR to a PO

PR is a purchase requisition when that is approved it is
converted to a PO

once the procurment team purchases the order we followup with
the vendor

enter a goods reciept refering to that po
this is where qa comes in

record that vendors invoice and ensure that po matches
if not we go back to the vendor

### plan-to-produce

manufactoring takes over here

ensure that everything is planned propperly

#### Sub Steps

1. forcast product demand
    (predict how much of a product will be needed in the future)
2. run a material requirements planning (mrp)
    determine materials / compnents needed to manufacture
    the product. Involves machines and labor that we might
    need
3. manufactor the products / goods
    organizing production schedules and maintaining

### Order-to-Cash

time to sell stuff $$$ :D

this is primarly maintained by the sails team

1. create sales order
    capture the details of the customers order
2. fill the order and ship the goods
    involves quardinating with warhouse team to actually
    package the products
3. Invoice customer goods
4. Recive payment from the customer
    actually get payment from the customer
    will update financial records to ensure the correct
    paper work

---

## Enhancement Packages (EHP)

optional packages that add inovations to existing software
without upgrading the full system

these will not downgrade the whole system

latest ehp includes all prior updates, we install the
latest ehp and automatically get the features of the
previous versions

these enhance an existing package that you have.
> appears to be like a plugin

### General Behaviors

We apply enhancement and update in a single step

ehp's have their own support package

ehp's have same maitenance period as underlying core erp
anything thats updated with erp is updated with the core ehps

you can install only the core components and not the entire
package

> installations are iriversable, so make sure you test before
> production

these are only available in abap based systems

see  [abap](skillstorm/eap/abap.md) for more info

you can't mix EHP versions, only one version at a time

### New capabilities offered
1. simplification
2. simplify buisness processes
    for example add a new workflow automation feature for
    the approvement of purchase orders so no one has to track
    through the entire process
3. Ennhance capabilities across different modules
    could be analytical for hr modules
    provide insight into employee performance
4. Industry specific enhancements

### Enterprise service bundles

enable development of applicatons on top of a basic erp system

> I think these are more like custom solution

## SAP Components

### Adaptive Computing Controller

central point of control to assign computer resources
accross an organization

### SAP Composition Environment

supports design and implementation of composit application

### SAP Enterprise portal

unifies critical information

> basically only show people what they need

### SAP Auto-ID Infrastructure

provides the capabilities for RFID support in your apps

bluetooth embeded systems or other warhouse functionality

### SAP Identity Management

Helps manage controll access rights into applications

### Netweaver moble

foundation for sap moble apps enhances existing sap applications for mobile

service employees can be notified from mobile as apposed to desktops

### SAP Netweaver development studio

vscode for netweaver :)

### NeatWeaver Visual Composer

simplifies creation of protal content using a visual method

### SAP solution manager

helps technical support in a distributed system for continus
improvement of an application

### NetWeaver Application Server

baically offers web server functionality to the sap echosystem

1. can create web servicies that utilize key standards
    this is for integration into exisitng services
2. uses SOAP protocal (simple object access protocal)
    used to send data to the outside world
3. WSDL (web services description language)
    describes the functionality offered by a given service,
    key for integration
4. Universal Description Discovery and Integegration (UUDDI)
5. Http, https, html, xml, javascript
    basically the application servers support standard web dev tech
6. NetWeaver is compatible with .net and IBM WebSphere
7. Can create and publish web services and access applicaitons and enterprise
services within SAP ecosystem

### Process Integration

1. SAP solution manager customizing
    this is a tool that helps configuring and managing
    sap solutions based on the needs of a given organization
2. SAP process integration
    basically a way to exchange data seemlesly between
    organizations.
    
    Luvera designer and crystal reports are locations where
    this can get sent to
3. SAP buisness workflow
    automates buisness tasks
4. SAP buisness process mangement (bpm)
    allows buisnesses to design and implement efficient processes

### SAP Business Suite

these are additional components that can be added onto erp

1. customer relation management (crm)
    sales and marketing prm
    think salesforce
2. product lifecylce management (plm)
    enables businesses to efficiently manage
    the entire lifecylce in their products
    facilitates colab and reduces time to market
3. supply relationship management (srm)
    optimize prucurment processes / supply selection
    performance management
    you can see contracts in here
4. supply chain management (scm)
    provides tools to optimize supply chain

### Net Weaver

web based platform that enables application development

can be used on multiple devices

modular development that allows additional applications / development
basically you can add stuff to it ^

can integerate with information from almost all sources

this should ideally integrate with existing it investments

should expand and scale projects overtime as needed

#### Advantages
1. openess and extensability
2. compatibility with .net and IBM WebSphere
    WebSphere can provide real time assistance
3. Immediate Integration
    ensures that all systems are integrated and talking to
    eachother
    if everybody speaks the same language productivity goes up
4. Lower Cost of Ownership
    since netweaver uses existing infrastructure it reduces
    the need for more software
    30+ years of robustness for sap
