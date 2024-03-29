<?php

namespace App\Http\Util;

use App\Components\User\Models\User;
use App\Customer;
use App\InvoiceScheme;
use App\Project;
use App\ProjectMember;
use App\ProjectTaskMember;
use App\System;
use App\Ticket;
use App\Transaction;
use App\TransactionPaymentLine;
use Illuminate\Support\Facades\DB;
use PDF;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class CommonUtil
{
    /**
     * generate unique id for task.
     *
     * @return $task_id
     */
    public function generateTaskId($task)
    {
        $task_prefix = config('constants.task_prefix');

        $task_id = $task_prefix.$task->id;

        return $task_id;
    }

    /**
     * generate invoice number.
     *
     * @return $invoice no
     */
    public function generateInvoiceNo($invoice_scheme_id)
    {
        $invoice_scheme = InvoiceScheme::find($invoice_scheme_id);

        $invoice_prefix = $invoice_scheme->scheme_type == 'custom' ? $invoice_scheme->prefix : \Carbon::now()->year;

        $invoice_count = $invoice_scheme->invoice_count;
        $invoice_start_number = $invoice_scheme->start_number;

        $new_count = $invoice_count == 0 ? $invoice_start_number : $invoice_start_number + $invoice_count;
        
        $number = str_pad($new_count, $invoice_scheme->total_digits, '0', STR_PAD_LEFT);
        $invoice_no = $invoice_prefix. '-' . $number;

        $invoice_scheme->invoice_count += 1;
        $invoice_scheme->save();

        return $invoice_no;
    }

    /**
     * based on paying & total paid amount,
     * determine payment status.
     *
     * @return $payment status
     */
    public function calculatePaymentStatus($transaction_id, $paying_amount)
    {
        $total_paid = $this->calculateTotalPaid($transaction_id);

        $invoice_total = Transaction::find($transaction_id)->total;

        $total_paid = $invoice_total - $total_paid;

        $payment_status = 'due';
        if ($paying_amount >= $total_paid) {
            $payment_status = 'paid';
        } elseif ($paying_amount < $total_paid) {
            $payment_status = 'partial';
        }

        return $payment_status;
    }

    /**
     * calculate total paid amount.
     *
     * @return $total_paid
     */
    public function calculateTotalPaid($transaction_id)
    {
        $total_paid = TransactionPaymentLine::where('transaction_id', $transaction_id)
                ->select(DB::raw('SUM(amount)as total_paid'))
                ->first()
                ->total_paid;

        return $total_paid;
    }

    /**
     * create roles & permissions for a
     * project.
     *
     * @return $roles
     */
    public function createRoleAndPermissionsForProject($id)
    {
        $permissions = [
                ['name' => 'project.'.$id.'.edit'],
                ['name' => 'project.'.$id.'.status'],
                ['name' => 'project.'.$id.'.delete'],
                ['name' => 'project.'.$id.'.overview'],
                ['name' => 'project.'.$id.'.activities'],

                ['name' => 'project.'.$id.'.task.create'],
                ['name' => 'project.'.$id.'.task.view'],
                ['name' => 'project.'.$id.'.task.edit'],
                ['name' => 'project.'.$id.'.task.delete'],

                ['name' => 'project.'.$id.'.milestone.create'],
                ['name' => 'project.'.$id.'.milestone.view'],
                ['name' => 'project.'.$id.'.milestone.edit'],
                ['name' => 'project.'.$id.'.milestone.delete'],

                ['name' => 'project.'.$id.'.invoice.create'],
                ['name' => 'project.'.$id.'.invoice.view'],
                ['name' => 'project.'.$id.'.invoice.edit'],
                ['name' => 'project.'.$id.'.invoice.delete'],
            ];

        $lead_permissions = [];
        foreach ($permissions as $permission) {
            $lead_permissions[] = $permission['name'];
            Permission::create($permission);
        }

        $member_permissions = [
                'project.'.$id.'.overview', 'project.'.$id.'.activities',
                'project.'.$id.'.task.create', 'project.'.$id.'.task.view',
                'project.'.$id.'.task.edit', 'project.'.$id.'.task.delete',
                'project.'.$id.'.milestone.create', 'project.'.$id.'.milestone.view',
                'project.'.$id.'.milestone.edit', 'project.'.$id.'.milestone.delete',
            ];

        $customer_permissions = [
                'project.'.$id.'.overview', 'project.'.$id.'.activities',
                'project.'.$id.'.task.create', 'project.'.$id.'.task.view',
                'project.'.$id.'.task.edit', 'project.'.$id.'.task.delete',
                'project.'.$id.'.milestone.create', 'project.'.$id.'.milestone.view',
                'project.'.$id.'.milestone.edit', 'project.'.$id.'.milestone.delete',
                'project.'.$id.'.invoice.view',
            ];

        $lead_role = Role::create(['name' => $this->leadProjectRole($id), 'type' => 'project']);
        $lead_role->syncPermissions($lead_permissions);

        $member_role = Role::create(['name' => $this->memberProjectRole($id), 'type' => 'project']);
        $member_role->syncPermissions($member_permissions);

        $customer_role = Role::create(['name' => $this->customerProjectRole($id), 'type' => 'project']);
        $customer_role->syncPermissions($customer_permissions);

        $roles = [
                    'lead' => $lead_role->name,
                    'member' => $member_role->name,
                    'customer' => $customer_role->name,
                ];

        return $roles;
    }

    /**
     * Role which is created when projects is created for this customer.
     *
     * @return string
     */
    public function customerProjectRole($project_id)
    {
        return 'customer.'.$project_id;
    }

    /**
     * Role which is created for members when a new projects is created.
     *
     * @return string
     */
    public function memberProjectRole($project_id)
    {
        return 'member.'.$project_id;
    }

    /**
     * Role which is created for lead when a new projects is created.
     *
     * @return string
     */
    public function leadProjectRole($project_id)
    {
        return 'lead.'.$project_id;
    }

    /**
     * retrieve assigned project
     * for employee.
     *
     * @return $project_ids
     */
    public function getAssignedProjectForEmployee($user_id)
    {
        $projects = ProjectMember::where('user_id', $user_id)
                            ->get();

        $project_ids = [];
        foreach ($projects as $project) {
            $project_ids[] = $project->project_id;
        }

        return $project_ids;
    }

    /**
     * retrieve assigned tasks
     * for employee.
     *
     * @return $project_task_ids
     */
    public function getAssignedTasksForEmployee($user_id)
    {
        $project_task_ids = ProjectTaskMember::where('user_id', $user_id)
                            ->select('project_task_id')
                            ->get()
                            ->toArray();

        return $project_task_ids;
    }

    /**
     * generate pdf for
     * invoice.
     *
     * @param int $id
     *
     * @return \Illuminate\Http\Response
     */
    public function generateInvoicePdf($id)
    {
        $invoice = Transaction::with('invoiceLines', 'customer')
                    ->find($id);

        $customer_currency = Customer::with('currency')->find($invoice->customer_id);

        $keys = ['tax_number', 'email', 'mobile', 'city', 'state', 'zip_code', 'country', 'logo', 'alternate_contact_no', 'address_line_1', 'address_line_2'];

        $system = System::getSystemSettings($keys);

        $invoice_pdf = PDF::setPaper('a4')->setOptions(['enable-javascript' => true])->loadView('invoices.template', compact('invoice', 'system', 'customer_currency'));

        return $invoice_pdf;
    }

    /**
     * generate reference no.
     * for expense, ticket
     *
     * @return reference no.
     */
    public function generateReferenceNo($ref_for)
    {
        if ($ref_for == 'expense') {
            $prefix = config('constants.expense_prefix');
            $ref_no = $prefix.rand();
        } elseif ($ref_for == 'ticket') {
            $prefix = config('constants.ticket_prefix');
            $ticket_count = Ticket::count();
            $final_ticket_count = $ticket_count + 1;
            $ref_no = $prefix.$final_ticket_count;
        }
        
        return $ref_no;
    }

    /**
     * retrieve superadmin
     *
     * @return $admin
     */
    public function getSuperadmin()
    {
        $admin = User::role('superadmin')->first();

        return $admin;
    }

    /**
     * create contact
     *
     * @return $user
     */
    public function createContact($contact)
    {
        $user = User::create($contact);

        Customer::where('id', $contact['customer_id'])
                ->update(['primary_contact_id' => $user->id]);

        //Assign customer role.
        $user->assignRole('contact');

        return $user;
    }

    /**
     * Generates command to setup cron job
     *
     * @return string
     */
    public function getCronJobCommand()
    {
        $php_binary_path = empty(PHP_BINARY) ? "php" : PHP_BINARY;

        $command = "* * * * * " . $php_binary_path . " " . base_path('artisan') . " schedule:run >> /dev/null 2>&1";

        if (config('app.env') == 'demo') {
            $command = '';
        }

        return $command;
    }

    /**
     * Return the priority list
     */
    public function getPriorityList($append_all = false)
    {
        $priority = [
                        [
                            'key' => 'low',
                            'value' => __('messages.low')
                        ],
                        [
                            'key' => 'medium',
                            'value' => __('messages.medium')
                        ],
                        [
                            'key' => 'high',
                            'value' => __('messages.high')
                        ],
                        [
                            'key' => 'urgent',
                            'value' => __('messages.urgent')
                        ]
                    ];

        if ($append_all) {
            $priority = array_merge([['key' => '', 'value' => __('messages.all')]], $priority);
        }
        
        return $priority;
    }


    public function getBuildingTypeList($append_all = false)
    {
        $priority = [
                        [
                            'key' => 'test',
                            'value' => __('messages.low')
                        ],
                        [
                            'key' => 'test1',
                            'value' => __('messages.medium')
                        ],
                    ];

        if ($append_all) {
            $priority = array_merge([['key' => '', 'value' => __('messages.all')]], $priority);
        }
        
        return $priority;
    }

    
    public function getUsingBuilding($append_all = false)
    {
        $usingTypes = [
                        [
                            'key' => 'ecomerce',
                            'value' => __('data.ecomerce')
                        ],
                        [
                            'key' => 'support',
                            'value' =>'support'// __('messages.medium')
                        ],
                    ];

       // if ($append_all) {
         //   $priority = array_merge([['key' => '', 'value' => __('messages.all')]], $priority);
       // }
        
        return $usingTypes;
    }

    public function getRolesNumber($append_all = false)
    {
        $roles_number = [
                        [
                            'key' => 1,
                            'value' =>1// __('data.ecomerce')
                        ],
                        [
                            'key' => 2,
                            'value' =>2,// __('data.ecomerce')
                        ],
                        [
                            'key' => 3,
                            'value' =>3// __('data.ecomerce')
                        ],
                        [
                            'key' => 4,
                            'value' =>4// __('data.ecomerce')
                        ],
                        [
                            'key' => 5,
                            'value' =>5//'// __('data.ecomerce')
                        ],
                    ];

       // if ($append_all) {
         //   $priority = array_merge([['key' => '', 'value' => __('messages.all')]], $priority);
       // }
        
        return $roles_number;
    }



    public function getBuildingTypes($append_all = false)
    {
        $building_types = [
                        [
                            'key' => 'test',
                            'value' =>'test'// __('data.ecomerce')
                        ],
                        [
                            'key' => 'test1',
                            'value' =>'test1',// __('data.ecomerce')
                        ],
                      
                    ];

       // if ($append_all) {
         //   $priority = array_merge([['key' => '', 'value' => __('messages.all')]], $priority);
       // }
        
        return $building_types;
    }



    public function getProvinceMunicipalities($append_all = false)
    {
        $provinceMunicipalities = [
                        [
                            'key' => 'province1',
                            'value' => __('data.province1')
                        ],
                        [
                            'key' => 'province2',
                            'value' => __('data.province2')
                        ],
                        [
                            'key' => 'province2',
                            'value' => __('data.province3')
                        ],
                        
                    ];

        
        return $provinceMunicipalities;
    }

    public function getMunicipalities($append_all = false)
    {
        $provinceMunicipalities = [
                        [
                            'key' => 'municipality1',
                            'value' => __('data.municipality1')
                        ],
                        [
                            'key' => 'municipality2',
                            'value' => __('data.municipality2')
                        ],
                        [
                            'key' => 'municipality3',
                            'value' => __('data.municipality3')
                        ],
                        
                    ];

        
        return $provinceMunicipalities;
    }


    public function getCategoriesLocation($append_all = false)
    {
        $categoriesLocation = [
                        [
                            'key' => 'category1',
                            'value' => __('data.category1')
                        ],
                        [
                            'key' => 'category2',
                            'value' => __('data.category2')
                        ],
                        [
                            'key' => 'category3',
                            'value' => __('data.category3')
                        ],
                        
                    ];

        
        return $categoriesLocation;
    }


    public function getNeighborhoods($append_all = false)
    {
        $neighborhoods = [
                        [
                            'key' => 'neighborhood1',
                            'value' => __('data.neighborhood1')
                        ],
                        [
                            'key' => 'neighborhood2',
                            'value' => __('data.neighborhood2')
                        ],
                        [
                            'key' => 'neighborhood3',
                            'value' => __('data.neighborhood3')
                        ],
                        
                    ];

        
        return $neighborhoods;
    }



    public function getDistricts($append_all = false)
    {
        $districts = [
                        [
                            'key' => 'district1',
                            'value' => __('data.district1')
                        ],
                        [
                            'key' => 'district2',
                            'value' => __('data.district2')
                        ],
                        [
                            'key' => 'district3',
                            'value' => __('data.district3')
                        ],
                        
                    ];

        
        return $districts;
    }


    public function getVisitRequestStatus($append_all = false)
    {
        $statuses = [
                        [
                            'key' => 'new',
                            'value' => __('data.new')
                        ],
                        [
                            'key' => 'pending',
                            'value' => __('data.pending')
                        ],
                        [
                            'key' => 'sent',
                            'value' => __('data.sent')
                        ],
                        [
                            'key' => 'accepted',
                            'value' => __('data.accepted')
                        ],
                        
                    ];

        
        return $statuses;
    }


    public function getRequestsTypes($append_all = false)
    {
        $requestTypes = [
            [
                'key' => 'visit_request',
                'value' => __('data.visit_request')
            ],
            [
                'key' => 'design_request',
                'value' => __('data.design_request')
            ],
            [
                'key' => 'support_service_request',
                'value' => __('data.support_service_request')
            ],
            [
                'key' => 'contractor_request',
                'value' => __('data.contractor_request')
            ],
            [
                'key' => 'supervision_request',
                'value' => __('data.supervision_request')
            ],
        ];
        return  $requestTypes;

    }



    public function getEnginneringTypes($append_all = false)
    {
        $enginneringTypes = [
            [
                'key' => 'civil_enginnering',
                'value' => __('data.civil_enginnering')
            ],
            [
                'key' => 'it_enginnering',
                'value' => __('data.it_enginnering')
            ],
            [
                'key' => 'architectural_enginnering',
                'value' => __('data.architectural_enginnering')
            ],
           
        ];
        return  $enginneringTypes;

    }

}
