<?php

use App\Http\Controllers\Admin\UserController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return redirect(route('login'));
});

Auth::routes(['register' => false]);

Route::post('ajaxRequest', [UserController::class, 'getUserData'])->name('ajaxRequest.post');
Route::post('checkUser', [UserController::class, 'checkUserType'])->name('checkUser.post');

if (config('constants.enable_client_signup')) {
    Route::get('/client/register', 'Client\ClientRegisterController@index')
            ->name('client.register-form');
    Route::post('/client/register', 'Client\ClientRegisterController@store')
            ->name('client.register');
}

// Employees & Superadmin
Route::prefix('admin')
    ->namespace('Admin')
    ->middleware(['auth', 'employee'])
    ->name('admin')
    ->group(function () {
        // single page
        Route::get('/', 'SinglePageController@displaySPA')
            ->name('admin.spa');

        // resource routes
        Route::get('user-statistics', 'UserController@getStatistics');
        Route::get('users-all', 'UserController@getAllEmployee');
        Route::get('users/{id}/name', 'UserController@getEmployee');
        
        Route::resource('users', 'UserController');

        Route::get('customers/{id}/customer-name', 'CustomerController@getCustomer');
        Route::get('customers/{id}/contacts', 'CustomerController@getContacts');
        Route::resource('customers', 'CustomerController')
            ->except(['create']);
        Route::resource('customer-notes', 'CustomerNoteController')
            ->except(['create']);
        Route::resource('contacts', 'ContactController');

        Route::resource('employee-notes', 'EmployeeNoteController');

        Route::resource('categories', 'CategoryController')->only(['store']);
        Route::post('save-stick-notes', 'DashboardController@saveStickNotes');
        Route::resource('dashboards', 'DashboardController')->only(['index']);

        Route::post('system-settings-upload-logo', 'SystemSettingsController@uploadLogo');
        Route::resource('system-settings', 'SystemSettingsController')->only(['create', 'store']);

        Route::resource('currencies', 'CurrencyController')->only(['index', 'store']);

        Route::resource('backups', 'BackupController')->only(['index', 'create']);
        Route::get('backups/delete/{file_name}', 'BackupController@delete');
        Route::get('backups/{file_name}', 'BackupController@download');

        Route::resource('roles', 'ManageRolesController');
        Route::resource('knowledge-bases', 'KnowledgeBaseController');
        Route::resource('invoice-scheme', 'InvoiceSchemeController');
        Route::resource('customer-account-ledger', 'CustomerAccountLedgerController')->only(['index']);

        Route::resource('status', 'StatusController')->only(['index', 'store']);
        Route::resource('source', 'SourceController')->only(['index', 'store']);

        Route::get('lead-statistics', 'LeadController@getStatistics');
        Route::get('leads-update-status', 'LeadController@updateStatus');
        Route::resource('leads', 'LeadController');

        Route::resource('lead-notes', 'LeadNoteController');
        Route::resource('reminders', 'ReminderController');
    });

//Common routes
Route::middleware(['auth'])
    ->name('common')
    ->group(function () {
        Route::resource('manage-profiles', 'ManageProfileController')
            ->only(['index', 'edit', 'update']);

        Route::resource('media', 'MediaController');

        Route::post('visit-request', 'ProjectController@addVisitRequest');
        Route::post('add-new-project', 'ProjectController@addNewProject');
        
        Route::get('all-customers', 'ProjectController@getAllCustomer');
        Route::get('projects-statistics', 'ProjectController@getStatistics');
        Route::get('projects-customer', 'ProjectController@getCustomerProject');
        Route::get('projects/{id}/customer', 'ProjectController@getCustomerId');
        Route::get('projects/projects-list', 'ProjectController@getProjectsList');
        Route::get('projects/{id}/members', 'ProjectController@getMembers');
        Route::get('projects/update-status', 'ProjectController@updateStatus');



        Route::get('projects/mark-favorite', 'ProjectController@markAsFavorite');
        Route::resource('projects', 'ProjectController');
        Route::resource('project-notes', 'ProjectDocumentsAndNotesController');

        Route::get('project-tasks/mark-completed', 'ProjectTaskController@markAsCompleted');

        Route::get('project-tasks/filter-data/{project_id}', 'ProjectTaskController@getFilterData');
        
        Route::get('project-task-description', 'ProjectTaskController@updateDescription');
        Route::resource('project-tasks', 'ProjectTaskController');
        Route::resource('project-comments', 'ProjectCommentController');
        //Activities related route
        Route::get('activities/project', 'ActivityController@project');

        Route::resource('project-milestones', 'ProjectMilestonesController');   
        Route::post('confirm-send', 'ProjectController@confirmSendRequest');
        Route::post('send_request', 'ProjectController@projectRequest'); 
        Route::post('edit-visit-request', 'ProjectController@editVisitRequest');   
        Route::post('edit-project-request', 'ProjectController@editProjectRequest');

        Route::get('get-location-status', 'ProjectController@getLocationStatus');


        Route::post('customer-info', 'Admin\CustomerController@getCutomerInfo');
        Route::post('project-info', 'ProjectController@getProjectInfo');
        Route::post('getProject-Data', 'ProjectController@getProjectData');
        Route::post('add-agency', 'ProjectController@addAgency');
        Route::post('edit-new-project', 'ProjectController@editNewProject');
        Route::get('get-agencies/{user_id}', 'ProjectController@getAgencies');
        Route::get('get-project/{id}', 'ProjectController@getProject');

        Route::post('accept-project', 'ProjectController@acceptProject');
        Route::get('sent-requests', 'ProjectController@getProjectRequest');
        Route::delete('delete-requests/{id}', 'ProjectController@deleteRequest');
        Route::get('get-priority','RequestTypeController@getPriority');
        Route::resource('request-type','RequestTypeController');
        Route::get('get-request-types','RequestTypeController@getRequestsTypes');
        
        Route::get('get-Customer-name/{id}','Admin\CustomerController@getCustomerName');
        Route::get('visit-request-type/{id}','ProjectController@getVisitRequestType');
        
        Route::get('invoice-statistics', 'InvoiceController@getStatistics');
        Route::post('invoices/post-invoice-reminder', 'InvoiceController@postInvoiceReminder');
        Route::get('invoices/get-invoice-reminder', 'InvoiceController@getInvoiceReminder');
        Route::get('invoices/{id}/convert-to-invoice', 'InvoiceController@ConvertToInvoice');
        Route::get('invoices/get-filter-data', 'InvoiceController@getFilterData');
        Route::get('invoices/{id}/download', 'InvoiceController@download');
        Route::resource('invoices', 'InvoiceController');
        Route::resource('transaction-payments', 'TransactionPaymentController');

        Route::get('notifications-mark-as-read', 'NotificationController@markAsRead');
        Route::resource('notifications', 'NotificationController')->only(['index']);
        Route::resource('calendar-overview', 'CalendarOverviewController')->only(['index']);

        Route::get('expense-statistics', 'ExpensesController@getStatistics');
        Route::get('expenses/get-filters', 'ExpensesController@getFilters');
        Route::resource('expenses', 'ExpensesController');
        
        Route::get('leaves/get-filters', 'LeaveManagementController@getFilters');
        Route::get('leaves/update-status', 'LeaveManagementController@updateStatus');
        Route::resource('leaves', 'LeaveManagementController');

        Route::get('tickets-statistics', 'TicketController@getStatistics');
        Route::get('tickets-update-status', 'TicketController@updateStatus');
        Route::get('tickets/get-filters', 'TicketController@getFilters');
        Route::resource('tickets', 'TicketController');
        
        Route::resource('ticket-comments', 'TicketCommentController');
    });

// Employees & Superadmin
Route::prefix('client')
    ->namespace('Client')
    ->middleware(['auth', 'client'])
    ->name('client')
    ->group(function () {
        // single page
        Route::get('/', 'SinglePageController@displaySPA')
            ->name('spa');

        Route::get('dashboards', 'DashboardController@index');
    });

// Localization
Route::get('/js/lang.js', function () {
    $strings = Cache::remember('lang.js', 2, function () {
        $lang = config('app.locale');

        $files = glob(resource_path('lang/'.$lang.'/*.php'));
        $strings = [];

        foreach ($files as $file) {
            $name = basename($file, '.php');
            $strings[$name] = require $file;
        }

        return $strings;
    });

    header('Content-Type: text/javascript');
    echo 'window.i18n = '.json_encode($strings).';';
    exit();
})->name('assets.lang');
Route::get('lang/{lang}', ['as' => 'lang.switch', 'uses' => 'App\Http\Controllers\LanguageController@switchLang']);
