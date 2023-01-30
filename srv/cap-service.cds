using { sap.ui.capapplication as my } from '../db/schema';

// @path annotation will be considered in case of necessity
service CompanyService {
    entity Companies as projection on my.Companies;
        annotate Companies with @odata.draft.enabled;
    entity Departments as projection on my.Departments;
    entity Industries as projection on my.Industries;
}