namespace sap.ui.capapplication;
using { managed } from '@sap/cds/common'; // CDL : CDS Definition Language

/*  One Company can be assigned to only one Industry while one Industry can be assigned to many Companies 
    One Company can be assigned to many Departments and one Department can be assigned to many Companies */
entity Companies : managed {
    key ID  : Integer;
    name            : String(100); 
    foundingDate    : Timestamp;
    industry        : Association to Industries;
    department      : Association to many Departments on department.company = $self;
    //department      : Association to Departments;
}

/*  One Company can only have one industry while One Industry can be assigned to many Companies
    One to many relation from the property company's (which refers to the entity Companies) industry property back to $self which is the entity Industries */
entity Industries : managed {
    key ID : Integer;
    name            : String(100);
    description     : String;
    company         : Association to many Companies on company.industry = $self;
}

/*  One Department can be assigned to many Companies and one Company can be assigned to many Departments
    Many to many relation from the property company's (which refers to the entity Companies) department property back to $self which is the entity Departments 
    QUESTION: Shouldnt that be a separate CDS view only for relations where this CDS View only contains the Department data and not have any duplications??? */
entity Departments : managed {
    key ID              : Integer;
    name                : String(100);
    description         : String;
    company             : Association to Companies;
    //company         : Association to many Companies on company.department = $self;
}
