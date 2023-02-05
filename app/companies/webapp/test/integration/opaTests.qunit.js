sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/companies/test/integration/FirstJourney',
		'ns/companies/test/integration/pages/CompaniesList',
		'ns/companies/test/integration/pages/CompaniesObjectPage',
		'ns/companies/test/integration/pages/DepartmentsObjectPage'
    ],
    function(JourneyRunner, opaJourney, CompaniesList, CompaniesObjectPage, DepartmentsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/companies') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCompaniesList: CompaniesList,
					onTheCompaniesObjectPage: CompaniesObjectPage,
					onTheDepartmentsObjectPage: DepartmentsObjectPage
                }
            },
            opaJourney.run
        );
    }
);