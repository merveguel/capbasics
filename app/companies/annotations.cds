using CompanyService as CompanyService from '../../srv/cap-service';

annotate CompanyService.Companies with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'Company ID',
            Value : ID,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Company Name',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Founding Date',
            Value : foundingDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Industry ID',
            Value : industry_ID,
        },
    ]
);

annotate CompanyService.Companies with @(
    // Tab information
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ],
    
    // Detail view
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'Company ID',
                Value : ID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Company Name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Founding Date',
                Value : foundingDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Industry',
                Value : industry_ID,
            },
        ],
    }
);

// Detail view - Industry Value Help
annotate CompanyService.Companies with {
    industry @(
        Common.ValueList: {
            Label : 'Industry',
            CollectionPath : 'Industries', // entity name
            Parameters : [
                {
                    $Type: 'Common.ValueListParameterInOut',    // which property will be changed
                    LocalDataProperty: industry_ID,             // property from the Companies entity  
                    ValueListProperty: 'ID'                     // property from the Industries entity 
                }, 
                {
                    $Type: 'Common.ValueListParameterDisplayOnly', // what to show when the view is in display mode
                    ValueListProperty: 'name'
                }
            ]
        }
    )
};