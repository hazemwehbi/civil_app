<?php
use App\System;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\DB;
class SystemsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $datas = [
                    'tax_number' => null,
                    'mobile' => null,
                    'alternate_contact_no' => null,
                    'email' => null,
                    'city' => null,
                    'state' => null,
                    'country' => null,
                    'zip_code' => null,
                    'logo' => null,
                    'date_format' => 'm-d-Y',
                    'time_format' => 12,
                    'currency_id' => 1
                ];

        $invoice_reminder_template = [
                    'invoice_reminder_email_subject' => 'Invoice Reminder from {business_name}',
                    'invoice_reminder_email_body' => '<p>Dear {customer_name},</p>

                                    <p>Your invoice number for {project_name} is {invoice_number} and due date for this is {due_date}<br />
                                    
                                    <p>Thank you for the business.</p>
                                    <p><br></p>
                                    <p>Regards,</p> <br>
                                    <p>{business_name}</p>',
                    'invoice_reminder_attachment' => 1
                ];

        $datas['invoice_reminder_template'] = json_encode($invoice_reminder_template);

        foreach ($datas as $key => $value) {
            System::updateOrCreate(['key' => $key], ['value' => $value]);
        }




        $requests = [
            ['id' => '1','name' => 'visit_request','created_at' => '2019-04-18 12:26:57','updated_at' => '2019-04-18 12:26:57'],
            ['id' => '2','name' => 'design_request','created_at' => '2019-04-19 07:13:33','updated_at' => '2019-04-19 07:13:33'],
            ['id' => '3','name' => 'support_service_request','created_at' => '2019-04-18 12:26:57','updated_at' => '2019-04-18 12:26:57'],
            ['id' => '4','name' => 'contractor_request','created_at' => '2019-04-19 07:13:33','updated_at' => '2019-04-19 07:13:33'],
            ['id' => '5','name' => 'supervision_request','created_at' => '2019-04-18 12:26:57','updated_at' => '2019-04-18 12:26:57'],
          ];
  
          DB::table('request_types')->insert($requests);
    }
}
