import Vue from 'vue';
import Router from 'vue-router';
import store from '../common/Store';

Vue.use(Router);

const router = new Router({
    // mode: 'history',
    //hash: false,


    routes: [
        {
            path: '/',
            redirect: APP.USER_TYPE_LOG == 'ESTATE_OWNER' ? '/es' : APP.USER_TYPE_LOG == 'ENGINEERING_OFFICE' ? '/en' : APP.USER_TYPE_LOG == 'SUPPORT_SERVICES_OFFICE' ? '/su' : APP.USER_TYPE_LOG == 'CONTRACTING_COMPANY' ? '/co' : '/dashboard',
        },
        {
            path: '/to-do"',
            // redirect: APP.USER_TYPE_LOG=='ESTATE_OWNER' ?  '/es/to-do-list' :'/to-do-list',
        },
        {
            name: 'dashboard',
            path: '/dashboard',
            component: require('./dashboard/Home'),
            children: [
                {
                    path: '/',
                    name: 'dashboard.list',
                    component: require('./dashboard/List'),
                },
                ,
            ],
        },


        //estate owner 
        {
            name: 'dashboard_estate',
            path: '/es',
            component: require('../estate_owner/dashboard/Home'),
            children: [
                {
                    path: '/',
                    name: 'dashboard_estate.list',
                    component: require('../estate_owner/dashboard/List'),
                },
                {
                    path: 'to-do-list',
                    name: 'to-do-list_estate.list',
                    component: require('../estate_owner/main/ToDoList'),
                    name: 'todolist'
                },


                //employee

                {
                    path: 'employees',
                    name: 'users_estate.list',
                    component: require('../estate_owner/users/components/UserLists'),
                },
                {
                    path: 'employees/create',
                    name: 'users_estate.create',
                    component: require('../estate_owner/users/components/UserFormAdd'),
                },
                {
                    path: 'employees/edit/:id',
                    name: 'users_estate.edit',
                    component: require('../estate_owner/users/components/UserFormEdit'),
                    props: route => ({ propUserId: route.params.id }),
                },
                {
                    path: 'employees/:id/show',
                    name: 'users_estate.view',
                    component: require('../estate_owner/users/components/View'),
                    props: route => ({ propUserId: route.params.id }),
                },
                {
                    path: 'visit-requests',
                    name: 'visit_request_estate_list',
                    component: require('../estate_owner/tickets/List'),


                },

                {
                    path: 'create-visit-request',
                    name: 'create_visit_estate_request_list',
                    component: require('../estate_owner/tickets/Create'),
                },
                {
                    path: 'edit-visit-request/:id',
                    name: 'edit_visit_request_estate_list',
                    component: require('../estate_owner/tickets/editVisitRequest'),
                    props: route => ({ propRequestId: route.params.id }),
                },

                {
                    path: 'view_visit_request/:id',
                    name: 'view_visit_request_estate_list',
                    component: require('../estate_owner/tickets/view_visit_request'),
                    props: route => ({ propRequestId: route.params.id }),
                },

                {
                    path: 'project-management',
                    name: 'project_management_estate_owner',
                    component: require('../estate_owner/main/components/ProjectManagement'),
                },
                {
                    path: '/tasks',
                    component: require('../common/tasks/Tasks'),
                    children: [
                        {
                            path: '/',
                            name: 'tasks.list',
                            component: require('../common/tasks/List'),
                        },
                    ],
                },
                ///////////////////////request design
                {
                    path: 'design-request',
                    name: 'design_request_estate_list',
                    component: require('../estate_owner/designRequest/List'),
                },


                {
                    path: 'show-design-price/:id',
                    name: 'show_design_request_price_estate_list',
                    component: require('../estate_owner/designRequest/showDesignRequestReport'),
                    props: route => ({ design_enginner_id: route.params.id }),
                },



                {
                    path: 'support-request',
                    name: 'support_request_estate_list',
                    component: require('../estate_owner/supportRequest/List'),
                },

                {
                    path: 'show-support-price/:id',
                    name: 'show_support_request_price_estate_owner',
                    component: require('../estate_owner/supportRequest/showSupportRequestReport'),
                    props: route => ({ support_user_id: route.params.id }),
                },





                {
                    path: 'contract-request',
                    name: 'contract_request_estate_list',
                    component: require('../estate_owner/contractRequest/List'),
                },

                {
                    path: 'show-contract-price/:id',
                    name: 'show_contract_request_price_estate_owner',
                    component: require('../estate_owner/contractRequest/showContractRequestReport'),
                    props: route => ({ support_user_id: route.params.id }),
                },

            ],
        },

        //end estate owner 

        //start support service 

        {
            name: 'dashboard_support',
            path: '/su',
            component: require('../support_service/dashboard/Home'),
            children: [
                {
                    path: '/',
                    name: 'dashboard_support.list',
                    component: require('../support_service/dashboard/List'),
                },
                {
                    path: 'to-do-list',
                    name: 'to-do-list_support.list',
                    component: require('../support_service/main/ToDoList'),
                    name: 'todolist'
                },
                {
                    path: 'support-request',
                    name: 'support_request_support_list',
                    component: require('../support_service/supportRequest/List'),
                },
                {
                    path: 'create-support-service-price/:id',
                    name: 'create_report_price_support_service',
                    component: require('../support_service/supportRequest/CreatePriceSuportService'),
                    props: route => ({ support_service_id: route.params.id }),
                }


            ]
        },


        //end support service



        //start contract  copany 

        {
            name: 'dashboard_contract',
            path: '/co',
            component: require('../contract_company/dashboard/Home'),
            children: [
                {
                    path: '/',
                    name: 'dashboard_contract.list',
                    component: require('../contract_company/dashboard/List'),
                },
                {
                    path: 'to-do-list',
                    name: 'to-do-list_contract.list',
                    component: require('../contract_company/main/ToDoList'),
                    name: 'todolist'
                },
                {
                    path: 'support-request',
                    name: 'support_request_contract_list',
                    component: require('../contract_company/contractRequest/List'),
                },
                {
                    path: 'create-contract-price/:id',
                    name: 'create_report_price_contract',
                    component: require('../contract_company/contractRequest/CreatePriceContractReport'),
                    props: route => ({ support_service_id: route.params.id }),
                }


            ]
        },

        //end contract company

        ///enginner office
        {
            name: 'dashboard_enginner_office',
            path: '/en',
            component: require('../enginnering_office/dashboard/Home'),
            children: [
                {
                    path: '/',
                    name: 'dashboard_enginner_office.list',
                    component: require('../enginnering_office/dashboard/List'),
                },
                {
                    path: 'to-do-list',
                    name: 'to-do-list_enginner_office.list',
                    component: require('../enginnering_office/main/ToDoList'),
                    name: 'todolist'
                },


                //employee

                {
                    path: 'AddCustomer/',
                    name: 'customer_office.create',
                    component: require('../enginnering_office/users/components/AddCustomer'),
                },
                {
                    path: 'employees',
                    name: 'users_enginner_office.list',
                    component: require('../enginnering_office/users/components/UserLists'),
                },
                {
                    path: 'employees/create',
                    name: 'users_enginner_office.create',
                    component: require('../enginnering_office/users/components/UserFormAdd'),
                },
                {
                    path: 'employees/edit/:id',
                    name: 'users_enginner_office.edit',
                    component: require('../enginnering_office/users/components/UserFormEdit'),
                    props: route => ({ propUserId: route.params.id }),
                },
                {
                    path: 'employees/:id/show',
                    name: 'users_enginner_office.view',
                    component: require('../enginnering_office/users/components/View'),
                    props: route => ({ propUserId: route.params.id }),
                },


                {
                    path: 'roles',
                    name: 'roles_enginner_office.list',
                    component: require('../enginnering_office/users/components/RoleLists'),
                },
                {
                    path: 'roles/create',
                    name: 'roles_enginner_office.create',
                    component: require('../enginnering_office/users/components/RoleCreate'),
                },
                {
                    path: 'roles/edit/:id',
                    name: 'roles_enginner_office.edit',
                    component: require('../enginnering_office/users/components/RoleEdit'),
                    props: route => ({ propRoleId: route.params.id }),
                },


                {
                    path: 'visit-requests',
                    name: 'visit_request_enginner_office_list',
                    component: require('../enginnering_office/tickets/List'),

                },

                {
                    path: 'create-visit-request',
                    name: 'create_visit_enginner_office_request_list',
                    component: require('../enginnering_office/tickets/Create'),
                },
                {
                    path: 'edit-visit-request/:id',
                    name: 'edit_visit_request_enginner_office_list',
                    component: require('../enginnering_office/tickets/editVisitRequest'),
                    props: route => ({ propRequestId: route.params.id }),
                },
                {
                    path: 'view_visit_request/:id',
                    name: 'view_visit_enginner_office_request_list',
                    component: require('../enginnering_office/tickets/view_visit_request'),
                    props: route => ({ propRequestId: route.params.id }),
                },


                {
                    path: 'tasks',
                    component: require('../enginnering_office/tasks/Tasks'),
                    children: [
                        {
                            path: '/',
                            name: 'tasks_enginnering_office.list',
                            component: require('../enginnering_office/tasks/List'),
                        },
                    ],
                },
                {
                    path: 'project-management',
                    name: 'project_management_enginnering_office',
                    component: require('../enginnering_office/main/components/ProjectManagement'),
                },
                ////////////////////////projects
                {
                    path: 'projects',
                    name: 'projects_enginnering_office.list',
                    component: require('../enginnering_office/projects/components/List'),
                },
                {
                    path: 'addProject',
                    name: 'add_project_enginnering_office',//AddProject
                    component: require('../enginnering_office/projects/components/AddProject'),
                },
                {
                    path: 'finished-projects',
                    name: 'finished_projects_enginnering_office',
                    component: require('../enginnering_office/projects/components/FinishedProjects'),
                },
                {
                    path: 'edit/:id',
                    name: 'edit_project_enginnering_office',
                    component: require('../enginnering_office/projects/components/Edit_Project'),
                    props: route => ({ propProjectId: route.params.id }),
                },
                {
                    path: 'view/:id',
                    name: 'view_project_enginnering_office',
                    component: require('../enginnering_office/projects/components/view_project'),
                    props: route => ({ propProjectId: route.params.id }),
                },


                {
                    path: 'specialties',
                    name: 'specialties.list',
                    component: require('../enginnering_office/specialities/List'),

                },



                {
                    path: 'design-request',
                    name: 'design_request_enginnering_office_list',
                    component: require('../enginnering_office/designRequest/List'),
                },

                {
                    path: 'create-design-price/:id',
                    name: 'create_design_request_price__enginnering_office',
                    component: require('../enginnering_office/designRequest/CreatePriceDesignForENginner'),
                    props: route => ({ design_enginner_id: route.params.id }),
                }






            ],
        },





        //end enginner  office 

        {
            path: '/employees',
            component: require('./users/Users'),
            children: [
                {
                    path: '/',
                    name: 'users.list',
                    component: require('./users/components/UserLists'),
                },
                {
                    path: 'create',
                    name: 'users.create',
                    component: require('./users/components/UserFormAdd'),
                },
                {
                    path: 'edit/:id',
                    name: 'users.edit',
                    component: require('./users/components/UserFormEdit'),
                    props: route => ({ propUserId: route.params.id }),
                },
                {
                    path: ':id/show',
                    name: 'users.view',
                    component: require('./users/components/View'),
                    props: route => ({ propUserId: route.params.id }),
                },
                {
                    path: '/roles',
                    name: 'roles.list',
                    component: require('./users/components/RoleLists'),
                },
                {
                    path: '/roles/create',
                    name: 'roles.create',
                    component: require('./users/components/RoleCreate'),
                },
                {
                    path: '/roles/edit/:id',
                    name: 'roles.edit',
                    component: require('./users/components/RoleEdit'),
                    props: route => ({ propRoleId: route.params.id }),
                },
                {
                    path: '/visit-requests',
                    name: 'visit_request_estate_list',
                    component: require('../estate_owner/tickets/List'),


                },

            ],
        },



        {
            path: '/customers',
            component: require('./customers/Customers'),
            children: [
                {
                    path: '/',
                    name: 'customers.list',
                    component: require('./customers/components/List'),
                },
                {
                    path: ':id/show',
                    name: 'customers.show',
                    component: require('./customers/components/Show'),
                },
                {
                    path: ':id/contacts',
                    name: 'customers.contacts.list',
                    component: require('./customers/components/contacts/List'),
                    props: route => ({ propCustomerId: route.params.id }),
                },
                {
                    path: ':id/notes',
                    name: 'customers.notes.list',
                    component: require('./customers/components/notes/List'),
                    props: route => ({ propCustomerId: route.params.id }),
                },
            ],
        },

        {
            path: '/requests-creating-projects',
            name: 'requests_creating_projects',
            component: require('./main/components/RequestsCreatingProjects'),
        },

        {
            path: '/reports',
            name: 'reports_list',
            component: require('../common/reports/Lists'),
        },
        {
            path: '/add_report',
            name: 'add_report',
            component: require('../common/reports/Add'),
        },
        {
            path: '/edit_report',
            name: 'edit_report',
            component: require('../common/reports/Edit'),
        },

        {
            path: '/project',
            component: require('../common/projects/Projects'),
            children: [
                {
                    path: '/',
                    name: 'projects.list',
                    component: require('../common/projects/components/List'),
                },
                {
                    path: 'edit/:id',
                    name: 'edit-project',
                    component: require('../common/projects/components/Edit_Project'),
                    props: route => ({ propProjectId: route.params.id }),
                },
                {
                    path: 'view/:id',
                    name: 'view_project',
                    component: require('../common/projects/components/view_project'),
                    props: route => ({ propProjectId: route.params.id }),
                },


                /*{
                    path: ':id/invoices/create',
                    name: 'invoices.create',
                    component: require('../common/projects/invoices/Add'),
                    props: route => ({
                        propProjectId: route.params.id,
                    }),
                },*/
                {
                    path: 'attachments',
                    name: 'project.attachments',
                    component: require('../common/projects/notes/Lists'),
                },
                {
                    path: 'project-schedule',
                    name: 'project.schedule',
                    component: require('../common/projects/milestones/Lists'),
                },
                {
                    path: '/add-project',
                    name: 'add-project',//AddProject
                    component: require('../common/projects/components/AddProject'),
                },
                // {
                //     path: '/edit-project',
                //     name: 'edit-project',
                //     component: require('../common/projects/components/Edit_Project'),
                // },
                // {
                //     path: '/edit-project',
                //     name: 'edit-project',
                //     component: require('../common/projects/components/editPrjectRequest'),
                // },
                {
                    path: '/finished-projects',
                    name: 'finished-projects',
                    component: require('../common/projects/components/FinishedProjects'),
                },
                {
                    path: '/schedule',
                    name: 'schedule',
                    component: require('../common/projects/components/schedule'),
                },
                {
                    path: ':project_id/invoices/:id/edit',
                    name: 'invoices.edit',
                    component: require('../common/projects/invoices/Edit'),
                    props: route => ({
                        propInvoiceId: route.params.id,
                        propProjectId: route.params.project_id,
                    }),
                },
            ],
        },


        {
            path: '/settings',
            component: require('./settings/Settings'),
            children: [
                {
                    path: '/',
                    name: 'settings.create',
                    component: require('./settings/Create'),
                },
            ],
        },

        {
            path: '/backups',
            component: require('./backup/Backup'),
            children: [
                {
                    path: '/',
                    name: 'backups.list',
                    component: require('./backup/List'),
                },
            ],
        },

        {
            path: '/profiles',
            component: require('../common/profile/Profile'),
            children: [
                {
                    path: '/',
                    name: 'profile.list',
                    component: require('../common/profile/List'),
                },
                {
                    path: 'edit/:id',
                    name: 'profile.edit',
                    component: require('../common/profile/Edit'),
                    props: route => ({ propUserId: route.params.id }),
                },
            ],
        },
        {
            path: '/projects',
            component: require('./invoices/Invoices'),
            children: [
                {
                    path: '/invoice',
                    name: 'invoices.list',
                    component: require('./invoices/List'),
                },
                {
                    path: '/invoices/create',
                    name: 'sales.invoices.create',
                    component: require('../common/projects/invoices/Add'),
                },
                {
                    path: '/estimates',
                    name: 'estimates.list',
                    component: require('./invoices/estimates/List'),
                },
                {
                    path: '/estimates/create',
                    name: 'estimates.create',
                    component: require('../common/projects/invoices/Add'),
                },

                {
                    path: '/invoice-scheme',
                    name: 'invoice_scheme.list',
                    component: require('../admin/invoice_schemes/List'),
                },
            ],
        },
        {
            path: '/knowledge-base',
            component: require('./knowledgebase/KnowledgeBase'),
            children: [
                {
                    path: '/knowledge-base',
                    name: 'Knowledgebase.list',
                    component: require('./knowledgebase/List'),
                },
                {
                    path: '/knowledge-base/create',
                    name: 'Knowledgebase.create',
                    component: require('./knowledgebase/Create'),
                },
                {
                    path: '/knowledge-base/:id/edit',
                    name: 'Knowledgebase.edit',
                    component: require('./knowledgebase/Edit'),
                    props: route => ({ propKnowladgebaseId: route.params.id }),
                },
                {
                    path: '/knowledge-base/:id/view',
                    name: 'Knowledgebase.view',
                    component: require('./knowledgebase/View'),
                    props: route => ({ propKnowladgebaseId: route.params.id }),
                },
            ],
        },
        {
            path: '/expenses',
            component: require('./expenses/Expenses'),
            children: [
                {
                    path: '/expenses',
                    name: 'expenses.list',
                    component: require('./expenses/List'),
                },
            ],
        },
        {
            path: '/leaves',
            component: require('./leaves/Leaves'),
            children: [
                {
                    path: '/leaves',
                    name: 'leaves.list',
                    component: require('./leaves/List'),
                },
            ],
        },
        {
            path: '/leads',
            component: require('./leads/Leads'),
            children: [
                {
                    path: '/leads',
                    name: 'leads.list',
                    component: require('./leads/List'),
                },
                {
                    path: ':id/view',
                    name: 'lead.show',
                    component: require('./leads/Tab'),
                },
            ],
        },
        {
            path: '/tickets',
            component: require('../common/tickets/Ticket'),
            children: [
                {
                    path: '/tickets',
                    name: 'tickets.list',
                    component: require('../common/tickets/List'),
                },
                // {
                //     path: ':id/show',
                //     name: 'tickets.view',
                //     component: require('../common/tickets/View'),
                //     props: route => ({ propTicketId: route.params.id }),
                // },
            ],
        },
        {
            path: '/offices_types',
            name: 'offices_types',
            component: require('./main/components/OfficesTypes'),
        },
        {
            path: '/general_information',
            name: 'general_information     ',
            component: require('./main/components/GeneralInformation'),
        },
        {
            path: '/construction-licenses',
            name: 'constructionlicenses',
            component: require('./main/components/StructionLicenses'),
        },
        {
            path: '/survey-decisions',
            name: 'surveydecisions',
            component: require('./main/components/SurveyDecisions'),
        },
        {
            path: '/visit-requests',
            name: 'visit_request_list',
            component: require('../common/tickets/List'),


        },
        {
            path: '/create-visit-request',
            name: 'create_visit_request_list',
            component: require('../common/tickets/Create'),
        },
        {
            path: '/edit-visit-request/:id',
            name: 'edit_visit_request_list',
            component: require('../common/tickets/editVisitRequest'),
            props: route => ({ propRequestId: route.params.id }),
        },
        {
            path: '/view_visit_request_list/:id',
            name: 'view_visit_request_list',
            component: require('../common/tickets/view_visit_request'),
            props: route => ({ propRequestId: route.params.id }),
        },
        {
            path: '/project-management',
            name: 'project-management',
            component: require('./main/components/ProjectManagement'),
        },







        {
            path: '/to-do-list',
            component: require('./main/ToDoList'),
            name: 'todolist'
        },
        {
            path: '/new_authorization_requests',
            component: require('./main/components/NewAuthorizationRequests'),
            name: 'newAuthorizationRequests'
        },
        {
            path: '/home',
            component: require('./main/Home'),
            name: 'home'
        },
        {
            path: '/create-project',
            name: 'create_project',
            component: require('../common/tickets/CreateProjectRequest1'),
        },
        {
            path: '/test',
            name: 'create_project',
            component: require('./main/components/superadmin/CreateProject'),
        },



        //request role


        {
            path: '/requests-role',
            component: require('./requests_role/RequestsRole'),
            children: [
                {
                    path: '/',
                    name: 'requests_role.list',
                    component: require('./requests_role/List'),
                },
                {
                    path: 'view/:id',
                    name: 'requests_role.view',
                    component: require('./requests_role/View'),
                }

            ],
        },
    ],
    // mode: "history",
});


router.beforeEach((to, from, next) => {
    store.commit('showLoader');
    if (to.path == '/to-do') {
        //  alert(to.path)
        if (APP.USER_TYPE_LOG == 'ESTATE_OWNER') {
            if (from.path != '/es/to-do-list')
                next('/es/to-do-list')
            else
                next('/')
            // return ;
        }
        else if (APP.USER_TYPE_LOG == 'CONTRACTING_COMPANY') {
            if (from.path != '/co/to-do-list')
                next('/co/to-do-list')
            else
                next('/')
        }
        else if (APP.USER_TYPE_LOG == 'SUPPORT_SERVICES_OFFICE') {
            if (from.path != '/su/to-do-list')
                next('/su/to-do-list')
            else
                next('/')
            // return ;
        }
        else if (APP.USER_TYPE_LOG == 'ENGINEERING_OFFICE') {
            if (from.path != '/es/to-do-list')
                next('/en/to-do-list')
            else
                next('/')
        }
        else {
            next('/to-do-list')
        }
    }
    if (localStorage.getItem("currenpathaftercjange") != null) {
        var path = localStorage.getItem("currenpathaftercjange");
        localStorage.removeItem("currenpathaftercjange");

        next(path)
    }
    else {
        next();
    }


});

router.afterEach((to, from) => {
    //   alert(JSON.stringify(to.path))
    localStorage.setItem("currenpath", to.path);
    setTimeout(() => {
        store.commit('hideLoader');
    }, 1000);
});
export default router;
