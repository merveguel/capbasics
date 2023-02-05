using CompanyService as CompanyService from '../../srv/cap-service';

annotate CompanyService.Departments with @(
    // Department Items
    /* UI.LineItem #GeneratedGroup2  : [
        { Value : ID },
        { Value : name },
        { Value : description }
    ]*/
    // Department Items (in Companies Object Page Tab)
    UI.LineItem #GeneratedGroup2  : {$value: [
        {
            $Type            : 'UI.DataField',
            Label            : 'Department ID',
            Value            : ID,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Label            : 'Department Name',
            Value            : name,
            ![@UI.Importance]: #High,
        },
        {
            $Type            : 'UI.DataField',
            Label            : 'Description',
            Value            : description,
            ![@UI.Importance]: #High,
        }
    ]},

    // Department Object Page - Department Details Tab
    UI.FieldGroup #GeneratedGroup3: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Department ID',
                Value: ID
            },
            {
                $Type: 'UI.DataField',
                Label: 'Department Name',
                Value: name
            },
            {
                $Type: 'UI.DataField',
                Label: 'Description',
                Value: description
            }
        ]
    },

    // Tab information in Department Object Page
    UI.Facets                     : [{
        $Type : 'UI.ReferenceFacet',
        ID    : 'GeneratedFacet3',
        Label : 'Department Details',
        Target: '@UI.FieldGroup#GeneratedGroup3'
    }]
);

annotate CompanyService.Companies with @(
    // Companies Worklist Page Item List  
    UI.LineItem: [
    {
        $Type: 'UI.DataField',
        Label: 'Company ID',
        Value: ID,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Company Name',
        Value: name,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Founding Date',
        Value: foundingDate,
    },
    {
        $Type: 'UI.DataField',
        Label: 'Industry ID',
        Value: industry_ID,
    },
]);

annotate CompanyService.Companies with @(

    // Company Object Page Details Tab
    UI.FieldGroup #GeneratedGroup1: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Label: 'Company ID',
                Value: ID,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Company Name',
                Value: name,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Founding Date',
                Value: foundingDate,
            },
            {
                $Type: 'UI.DataField',
                Label: 'Industry',
                Value: industry_ID,
            },
        ],
    },

    // Tab information in Companies Object Page
    UI.Facets                     : [
        {
            $Type : 'UI.ReferenceFacet',        // Company Details Tab
            ID    : 'GeneratedFacet1',
            Label : 'Company Details',
            Target: '@UI.FieldGroup#GeneratedGroup1',   
        },
        {
            $Type : 'UI.ReferenceFacet',        // Department Items Tab
            ID    : 'GeneratedFacet2',
            Label : 'Department Items',
            // Department Items tab for another entity set (here 'departments' property used as a reference from Companies entity)
            // For reference : Search for x_Remarks https://cap.cloud.sap/docs/guides/extensibility/customization?q=UI.ReferenceFacet#compositions--document-oriented-modeling
            Target: 'department/@UI.LineItem#GeneratedGroup2',
        }
    ]
);

annotate CompanyService.Companies with {
    // Company Object Page, Industry Property Value Help
    industry @(Common.ValueList: {
        Label         : 'Industry',
        CollectionPath: 'Industries', // entity name
        Parameters    : [
            {
                $Type            : 'Common.ValueListParameterInOut',    
                LocalDataProperty: industry_ID,                         // property from the Companies entity
                ValueListProperty: 'ID'                                 // property from the Industries entity
            },
            {
                $Type            : 'Common.ValueListParameterDisplayOnly', 
                ValueListProperty: 'name'                               // what to show when the view is in display mode
            }
        ]
    })
};
